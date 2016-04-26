# BottomUp-Animation

![alt tag](https://github.com/quantumarun/quantumarun.github.io/blob/master/Images/BottomUpAnimation.gif)

This project will show a bottomup animation from bottom of the screen and then slides down to hide again in few seconds. It is category over UIView and autolayout compliant.

To integrate this feature, include UIView+BottomAnimation.h and .m file in your project.

And from your view call to display the animation for Text Only.

[self.view messageSlideOut:@"Sliding Out"];

If both Image and Text need to be displayed call(You need to see the size of the image to be properly displayed in the view. This is not taken in consideration in Library):

[self.view messageSlideOut:@"Sliding Out" withImage:@"color1"];
