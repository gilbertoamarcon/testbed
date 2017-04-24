#!/usr/bin/env python
import rospy
import tf
from geometry_msgs.msg import Vector3
from geometry_msgs.msg import Pose
from visualization_msgs.msg import Marker
from std_msgs.msg import Header

def msg_callback(msg):

	# Copying the message
	new_marker = msg

	# Scaling the marker
	new_marker.scale = Vector3(0.2,0.2,0.2)

	# Marker frame
	# marker_frame = '/ar_marker_'+str(new_marker.id)

	# Camera frame
	# cam_frame = new_marker.header.frame_id

	# # From Camera to Marker frame
	new_marker.pose = tf_lis.transformPose(marker_frame, new_marker.pose)

	# # Z-axis modification
	# new_marker.pose.position.z = new_marker.pose.position.z-0.1

	# # From Marker to Camera frame
	# new_marker.pose = tf_lis.transformPose(cam_frame, new_marker.pose)

	# Publishing the marker
	pub.publish(new_marker)

# Node initialization
rospy.init_node('alvar_filter')

# Marker frame
marker_frame = '/ar_marker_1'

# Camera frame
cam_frame = 'camera_depth_optical_frame'

# Transform tf_lis
tf_lis = tf.TransformListener()
tf_lis.waitForTransform('camera_depth_optical_frame', '/ar_marker_1', rospy.Time(), rospy.Duration(10))

# Subscribing to the incoming markers
sub	= rospy.Subscriber('/visualization_marker', Marker, msg_callback)

# Publishing out markers
pub = rospy.Publisher('/boxes', Marker, queue_size=1)

# Main loop
rospy.spin()
