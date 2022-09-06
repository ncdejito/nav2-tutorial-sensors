# automation untested, currently just documentation

# TODO: Add command like: `timeout 30s grep -q 'before continuing wait for MSG' <(tail -f logs/batch.log)`

ros2 launch sam_bot_description display.launch.py use_sim_time:=True
# before continuing wait for Connected to gazebo master
ros2 launch slam_toolbox online_async_launch.py use_sim_time:=True
# before continuing wait for Registering sensor
ros2 launch nav2_bringup navigation_launch.py use_sim_time:=True autostart:=True
# before continuing wait for Creating bond timer
