# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "cpg: 1 messages, 1 services")

set(MSG_I_FLAGS "-Icpg:/home/viki/Desktop/CPG/src/cpg/msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(cpg_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/viki/Desktop/CPG/src/cpg/srv/ModifyParameters.srv" NAME_WE)
add_custom_target(_cpg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cpg" "/home/viki/Desktop/CPG/src/cpg/srv/ModifyParameters.srv" ""
)

get_filename_component(_filename "/home/viki/Desktop/CPG/src/cpg/msg/cpg_pos.msg" NAME_WE)
add_custom_target(_cpg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cpg" "/home/viki/Desktop/CPG/src/cpg/msg/cpg_pos.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(cpg
  "/home/viki/Desktop/CPG/src/cpg/msg/cpg_pos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cpg
)

### Generating Services
_generate_srv_cpp(cpg
  "/home/viki/Desktop/CPG/src/cpg/srv/ModifyParameters.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cpg
)

### Generating Module File
_generate_module_cpp(cpg
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cpg
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(cpg_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(cpg_generate_messages cpg_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/viki/Desktop/CPG/src/cpg/srv/ModifyParameters.srv" NAME_WE)
add_dependencies(cpg_generate_messages_cpp _cpg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/viki/Desktop/CPG/src/cpg/msg/cpg_pos.msg" NAME_WE)
add_dependencies(cpg_generate_messages_cpp _cpg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cpg_gencpp)
add_dependencies(cpg_gencpp cpg_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cpg_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(cpg
  "/home/viki/Desktop/CPG/src/cpg/msg/cpg_pos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cpg
)

### Generating Services
_generate_srv_lisp(cpg
  "/home/viki/Desktop/CPG/src/cpg/srv/ModifyParameters.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cpg
)

### Generating Module File
_generate_module_lisp(cpg
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cpg
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(cpg_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(cpg_generate_messages cpg_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/viki/Desktop/CPG/src/cpg/srv/ModifyParameters.srv" NAME_WE)
add_dependencies(cpg_generate_messages_lisp _cpg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/viki/Desktop/CPG/src/cpg/msg/cpg_pos.msg" NAME_WE)
add_dependencies(cpg_generate_messages_lisp _cpg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cpg_genlisp)
add_dependencies(cpg_genlisp cpg_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cpg_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(cpg
  "/home/viki/Desktop/CPG/src/cpg/msg/cpg_pos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cpg
)

### Generating Services
_generate_srv_py(cpg
  "/home/viki/Desktop/CPG/src/cpg/srv/ModifyParameters.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cpg
)

### Generating Module File
_generate_module_py(cpg
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cpg
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(cpg_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(cpg_generate_messages cpg_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/viki/Desktop/CPG/src/cpg/srv/ModifyParameters.srv" NAME_WE)
add_dependencies(cpg_generate_messages_py _cpg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/viki/Desktop/CPG/src/cpg/msg/cpg_pos.msg" NAME_WE)
add_dependencies(cpg_generate_messages_py _cpg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cpg_genpy)
add_dependencies(cpg_genpy cpg_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cpg_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cpg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cpg
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(cpg_generate_messages_cpp geometry_msgs_generate_messages_cpp)
add_dependencies(cpg_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cpg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cpg
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(cpg_generate_messages_lisp geometry_msgs_generate_messages_lisp)
add_dependencies(cpg_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cpg)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cpg\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cpg
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(cpg_generate_messages_py geometry_msgs_generate_messages_py)
add_dependencies(cpg_generate_messages_py std_msgs_generate_messages_py)
