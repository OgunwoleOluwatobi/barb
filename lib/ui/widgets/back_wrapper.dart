import 'package:barb/core/utils/exports.dart';

class BackWrapper extends StatelessWidget {
  final String title;
  final Widget child;
  final bool headercolor;
  final Color? hcolor;
  final bool logo;
  final bool bodyColor;
  final BoxDecoration? childDecoration;

  const BackWrapper({
    Key? key,
    required this.title,
    required this.child,
    this.hcolor,
    this.childDecoration,
    this.headercolor = false,
    this.logo = false,
    this.bodyColor = true}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyColor ? Colors.white : BrandColors.light,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            logo ? Positioned(
              left: -180.w,
              bottom: -5.h,
              child: Opacity(
                opacity: .03,
                child: SvgPicture.asset(
                  'logo_bg'.svg,
                  height: 680.h,
                ),
              ),
            ) : SizedBox.shrink(),
            Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    // margin: EdgeInsets.only(top: Utils.statusBarPadding),
                    padding: EdgeInsets.only(top: Utils.statusBarPadding, left: 20.w, right: 20.w),
                    color: headercolor ? hcolor == null ? BrandColors.primary : hcolor : BrandColors.light,
                    height: 80.h + Utils.statusBarPadding,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            '$title',
                            style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: headercolor ? Colors.white : Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          bottom: 0,
                          child: Center(
                            child: InkWell(
                              onTap: () => Navigator.pop(context),
                              borderRadius: BorderRadius.circular(50.r),
                              child: CircleAvatar(
                                backgroundColor: headercolor ? Color(0xFF0A1330).withOpacity(.1) : Color(0xFF0A1330).withOpacity(.1),
                                radius: 16.r,
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_back_ios_rounded,
                                    color: headercolor ? Colors.white : BrandColors.primary,
                                    size: 18.w,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: childDecoration ?? BoxDecoration(
                        color: Colors.white,
                      ),
                      child: child
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}