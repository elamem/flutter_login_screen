class AnimationdData {
  double userDetailsContainerSize;
  double socialMediaContinerMargin;
  double floatingButtonTopMargin;
  double userDetailsContainerBottomSlopeFrom;
  double userDetailsContainerBottomSlopeTo;
  double listHeight;
  double listviewContainerHeight;
  String title;
  String pageChangerText;

  AnimationdData.loginData() {
    userDetailsContainerSize = 0.5;
    socialMediaContinerMargin = 0.45;
    userDetailsContainerBottomSlopeFrom = 0.03;
    userDetailsContainerBottomSlopeTo = 0.03;
    listHeight = 0.25;
    listviewContainerHeight = 200;
    floatingButtonTopMargin = 0;
    title = 'LOGIN';
    pageChangerText = 'Don\'t hava an account?  ';
  }

  AnimationdData.signUpData() {
    userDetailsContainerSize = 0.6;
    socialMediaContinerMargin = 0.55;
    userDetailsContainerBottomSlopeFrom = 0.06;
    userDetailsContainerBottomSlopeTo = 0.06;
    title = 'SIGNUP';
    listHeight = 0.35;
    floatingButtonTopMargin = 30;
    listviewContainerHeight = 300;
    pageChangerText = 'Already hava an account?  ';
  }
}
