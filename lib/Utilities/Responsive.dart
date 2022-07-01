
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

bool isMobile()
{
  var width = ScreenUtil().screenWidth;
  if(width < 400){
    return true;
  }
  return
   false;
}



bool isTablet()
{
  var width = ScreenUtil().screenWidth;
  if(width >  400 && width < 850){
    return true;
  }
  return false;
}


bool isDesktop()
{
  var width = ScreenUtil().screenWidth;
  if(width >  850){
    return true;
  }
  return false;
}