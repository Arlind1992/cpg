#include "ros/ros.h"
#include "geometry_msgs/Point.h"
#include "cpg/cpg_pos.h"
#include <cmath>
#include "cpg/ModifyParameters.h"
#include <vector>
  

static double rate;
static double major_ax;
static double minor_ax;
static double coup_strength;
static double limit_cycle;
static double forward_velocity;
static double curvature;
static std::vector<std::vector<int>> coupling; 
static std::vector<double> x_offset;
static std::vector<double> y_offset;
static std::vector<double> x_initial;
static std::vector<double> y_initial;
static std::vector<double> last_x=x_initial;
static std::vector<double> last_y=y_initial;
static int joint;
static float calculate_hi(const float xi,const float yi,const float xi_offset,const float yi_offset){
       return pow((xi-xi_offset)/major_ax,curvature)+pow((yi-yi_offset)/minor_ax,curvature);
};

bool modify(cpg::ModifyParameters::Request  &req,
            cpg::ModifyParameters::Response &res)
{
    major_ax=(double)req.major_ax;
    minor_ax=(double)req.minor_ax;
    coup_strength=(double)req.coup_strength;
    limit_cycle=(double)req.limit_cycle;
    forward_velocity=(double)req.forward_velocity;
    curvature=(double)req.curvature;
    x_offset=(std::vector<double>)req.x_offset;
    y_offset=(std::vector<double>)req.y_offset;
    coupling.clear();
    coupling.push_back((std::vector<int>)req.coupling_1);
    coupling.push_back((std::vector<int>)req.coupling_2);
    coupling.push_back((std::vector<int>)req.coupling_3);
    coupling.push_back((std::vector<int>)req.coupling_4);
    coupling.push_back((std::vector<int>)req.coupling_5);
    coupling.push_back((std::vector<int>)req.coupling_6);	    
    ROS_INFO("all parameters set");
    return true;
}

int main(int argc, char **argv)
{
  
  std::vector<std::vector<int>> defaultCoupling={{0,-1,-1,1,1,-1},{-1,0,1,-1,-1,1},{-1,1,0,-1,-1,1},{1,-1,-1,0,1,-1},{1,-1,-1,1,0,-1},{-1,1,1,-1,-1,0}};
 
  ros::init(argc, argv, "cpg_joint_angle_publisher");
  ros::NodeHandle n;
  //setting parameters
  n.param("joint",joint,6);
  for(int z=0;z<joint;z++){
  	std::vector<int> coupling_i;
  	n.param("coupling_"+joint, coupling_i, defaultCoupling[z]);
        coupling.push_back(coupling_i);
  }
  n.param("rate",rate,1.0);
  n.param("major_ax",major_ax,0.125);
  n.param("minor_ax",minor_ax,0.5);
  n.param("coup_strength",coup_strength,0.25);
  n.param("limit_cycle",limit_cycle,40.0);
  n.param("forward_velocity",forward_velocity,5.0);
  n.param("curvature",curvature,4.0);
  n.param("x_offset",x_offset,{0,0,0,0,0,0});
  n.param("y_offset",y_offset,{0,0,0,0,0,0});
  n.param("x_initial",x_initial,{0.75,0.75,0,0,-0.75,-0.75});
  n.param("y_initial",y_initial,{0.125,0.125,0.125,0.125,0.125,0.125});
  ros::Publisher pub = n.advertise<cpg::cpg_pos>("/cpg_joint_angles", 1);
  ros::ServiceServer service = n.advertiseService("modify_parameters", modify);
  ros::Rate loop_rate(rate);
  last_x=x_initial;
  last_y=y_initial;
  // the message to be published
  cpg::cpg_pos msg;
  auto calculate_xi=[](const double xi, const double yi,const double xi_offset, const double yi_offset){
	return -forward_velocity*curvature/minor_ax*pow(yi/minor_ax,curvature-1) + 
          limit_cycle*(1-calculate_hi(xi,yi,xi_offset,yi_offset))*curvature/major_ax*pow(xi/major_ax,curvature-1);
  };
  auto calculate_yi=[](const double xi, const double yi,const double xi_offset, const double yi_offset,const int i){
	return forward_velocity*curvature/major_ax*pow(xi/major_ax,curvature-1) + 
          limit_cycle*(1-calculate_hi(xi,yi,xi_offset,yi_offset))*curvature/minor_ax*pow(yi/minor_ax,curvature-1)
         + coup_strength*([](const int k){
		double toReturn=0;
             for(int p=0;p<joint;p++){
                 toReturn=toReturn+ coupling[k][p]*(last_y[p]-y_offset[p]);
             }
            return toReturn;
          })(i);
  };

  
  std::vector<double> current_x;
  std::vector<double> current_y;
  while (ros::ok())
  {
    msg.cpg_x_joint_angles.clear();
    msg.cpg_y_joint_angles.clear();
    current_x.clear();
    current_y.clear();
    for (int l=0;l<joint;l++ ) {
        current_x.push_back(last_x[l]+(1/rate)*calculate_xi(last_x[l],last_y[l],x_offset[l],y_offset[l]));
        current_y.push_back(last_y[l]+(1/rate)*calculate_yi(last_x[l],last_y[l],x_offset[l],y_offset[l],l));
    }
    msg.cpg_x_joint_angles=current_x;
    msg.cpg_y_joint_angles=current_y;
    pub.publish(msg);
    ROS_INFO("Message published");
    ros::spinOnce();
    loop_rate.sleep();
    last_x=current_x;
    last_y=current_y;
  }


  return 0;
}
