rosparam set /robot_description "$(cat $(rospack find motoman_sda10f_support)/urdf/sda10f_r2f85_scan.urdf)"
rosnode kill /robot_state_publisher
rosnode kill /joint_state_publisher_gui