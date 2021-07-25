import 'package:barb/core/utils/exports.dart';
import 'package:barb/ui/widgets/dropdown_mock.dart';
import 'package:stacked_services/stacked_services.dart';

class CustomToast {
  static void show(String msg) => Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 14.sp);

  static void cancelAll() => Fluttertoast.cancel();
}


BottomNavigationBarItem bottomBarItem(String name, String path, String semanticlabel, String activeSemanticLabel, int cIndex, int index, BuildContext context) {
  return BottomNavigationBarItem(
    title: AnimatedContainer(
      margin: EdgeInsets.only(top: 1.h),
      duration: const Duration(milliseconds: 200),
      child: Text(
        '$name',
        style: Theme.of(context).textTheme.headline4!.copyWith(
          fontSize: 13.sp,
          fontWeight: cIndex == index ? FontWeight.w400 : FontWeight.w400,
          color: cIndex == index ? BrandColors.primary : Color(0xFFC3CFDF)//Colors.black.withOpacity(.5)
        ),
      ),
    ),
    icon: SvgPicture.asset(
      path,
      height: 22.h,
      width: 22.h,
      color: Color(0xFFC3CFDF),//Colors.black.withOpacity(.5),
      semanticsLabel: semanticlabel,
      fit: BoxFit.fill,
    ),
    activeIcon: SvgPicture.asset(
      path,
      height: 22.h,
      width: 22.h,
      color: BrandColors.primary,
      semanticsLabel: activeSemanticLabel
    ),
  );
}

Widget handle({Color? color}) {
  return Container(
    width: 150.w,
    height: 4.h,
    decoration: BoxDecoration(
      color: color ?? Colors.white,
      borderRadius: BorderRadius.circular(50.r)
    ),
  );
}

Widget indicator(bool selected, {Color? backgroundColor, Color? colorActive}){
  return Container(
    width: selected ? 10.r : 5.r,
    height: selected ? 10.r : 5.r,
    decoration: BoxDecoration(
      color: backgroundColor ?? Colors.white,
      shape: BoxShape.circle
    ),
    child: selected ? Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 5.5.r,
        height: 5.5.r,
        decoration: BoxDecoration(
          color: colorActive ?? BrandColors.secondary,
          shape: BoxShape.circle
        ),
      ),
    ) : SizedBox(),
  );
}

Widget expansionItem({required String title, body}) {
    return Theme(
      data: ThemeData(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        accentColor: Colors.black,
        dividerColor: Colors.white,
        primaryColor: Colors.white,
        unselectedWidgetColor: Color(0xFF666666)
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.h),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6.r),
          child: ExpansionTile(
            backgroundColor: Colors.white,
            collapsedBackgroundColor: Colors.white,
            title: Text(
              title,
              style: Theme.of(StackedService.navigatorKey!.currentContext!).textTheme.bodyText2!.copyWith(
                fontSize: 14.sp,
                // fontWeight: FontWeight.w300,
                color: Colors.black
              ),
            ),
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                child: Text(
                  '$body',
                  style: Theme.of(StackedService.navigatorKey!.currentContext!).textTheme.bodyText2!.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    color: Colors.black
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget helpItem({required String title, body, icon}) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: BrandColors.secondary
          ),
          child: Center(
            child: SvgPicture.asset(
              '$icon'
            ),
          )
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black,
                  width: .3
                )
              )
            ),
            child: helpItem(
              title: '$title',
              body: '$body'
            ),
          ),
        ),
      ],
    );
  }

  Widget nairaText({required String text, required TextStyle style}) {
  return RichText(
    text: TextSpan(
      style: style.copyWith(
        fontFamily: 'Roboto'
      ),
      text: '₦',
      children: [
        TextSpan(
          text: '$text',
          style: style,
        )
      ]
    ),
  );
}