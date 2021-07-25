import 'package:barb/core/utils/exports.dart';
import 'package:stacked_services/stacked_services.dart';


class SuccessDialog extends StatefulWidget {
  final DialogRequest request;
  final Function completer;

  const SuccessDialog({Key? key, required this.request, required this.completer}) : super(key: key);

  @override
  _SuccessDialogState createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<SuccessDialog>  {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
              ),
              height: 220.h,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'dialog_check'.svg,
                                  color: BrandColors.secondary,
                                ),
                                SizedBox(height: 10.h),
                                widget.request.title != null
                                  ? Text(
                                      widget.request.title!,
                                      softWrap: true,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 15.sp,
                                        // fontFamily: 'Roboto'
                                      ),
                                    )
                                  : SizedBox(),
                                  SizedBox(height: 20.h),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () => widget.completer(DialogResponse(confirmed: false)),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                              child: Text(
                                'Close',
                                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  color: Colors.black,
                                  fontSize: 14.sp
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 6.h,
                    width: double.infinity,
                    color: BrandColors.secondary,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}