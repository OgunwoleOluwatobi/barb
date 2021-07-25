import 'package:barb/core/utils/exports.dart';
import 'package:stacked_services/stacked_services.dart';


class SuccessDialog2 extends StatefulWidget {
  final DialogRequest request;
  final Function completer;

  const SuccessDialog2({Key? key, required this.request, required this.completer}) : super(key: key);

  @override
  _SuccessDialog2State createState() => _SuccessDialog2State();
}

class _SuccessDialog2State extends State<SuccessDialog2>  {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'thumbs_up'.svg
                  ),
                  SizedBox(height: 10.h),
                  widget.request.title != null
                    ? Text(
                        widget.request.title!,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700
                        ),
                      )
                    : SizedBox(),
                    SizedBox(height: 20.h),
                  widget.request.description != null
                    ? Text(
                        widget.request.description!,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                          color: Colors.black,
                          fontSize: 12.sp,
                        ),
                      )
                    : SizedBox(),
                ],
              ),
            ),
            // CustomButton(
            //   title: 'Exit',
            //   func: () => widget.completer(DialogResponse())
            // )
          ],
        ),
      ),
    );
  }
}