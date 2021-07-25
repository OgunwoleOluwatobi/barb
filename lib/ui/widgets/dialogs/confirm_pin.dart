import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:barb/core/utils/exports.dart';

class ConfirmPin extends StatelessWidget {
  final bool? moreInfo;

  const ConfirmPin({Key? key, this.moreInfo = true}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 30.w),
          width: 310.w,
          height: 350.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  moreInfo! ? RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.black,
                        fontSize: 18.sp,
                      ),
                      text: 'Confirm ',
                      children: [
                        TextSpan(
                          text: 'N5,000',
                          style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: BrandColors.primary,
                            fontSize: 18.sp,
                          ),
                        ),
                        TextSpan(
                          text: ' transfer to ',
                        ),
                        TextSpan(
                          text: 'Archie',
                          style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: BrandColors.primary,
                            fontSize: 18.sp,
                          ),
                        )
                      ]
                    ),
                  ) : SizedBox(),
                  SizedBox(height: 15.h,),
                  moreInfo! ? Text(
                    'Please confirm that the details above are correct. Submitted payments cannot  be recalled.',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.black54,
                      fontSize: 12.sp,
                    ),
                  ) : SizedBox(),
                  SizedBox(height: 12.h,),
                  Text(
                    'Enter PIN',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.black,
                      fontSize: 14.sp
                    ),
                  ),
                  SizedBox(height: moreInfo! ? 5.h : 40.h,),
                  Container(
                    width: 250.w,
                    child: PinCodeTextField(
                      // controller: model.otpController,
                      backgroundColor: Colors.transparent,
                      appContext: context,
                      useHapticFeedback: true,
                      validator: (value) {
                        if(value == null) return 'Invalid value';
                        if(value.isEmpty) {
                          return 'Enter value';
                        }
                        return null;
                      },
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // errorAnimationController: model.errorController,
                      length: 4,
                      enableActiveFill: true,
                      enablePinAutofill: true,
                      keyboardType: TextInputType.number,
                      animationType: AnimationType.scale,
                      obscureText: true,
                      obscuringCharacter: '*',
                      textStyle: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: 36.sp
                      ),
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5.r),
                        borderWidth: 1,
                        fieldHeight: 55.h,
                        fieldWidth: 55.w,
                        activeFillColor: BrandColors.greyF6,
                        inactiveFillColor: BrandColors.greyF6,
                        disabledColor: BrandColors.darkD9,
                        activeColor: BrandColors.darkD9,
                        inactiveColor: BrandColors.darkD9,
                        selectedColor: BrandColors.darkD9,
                        selectedFillColor: BrandColors.greyF6
                      ),
                      onChanged: (val){},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(6.r),
                    onTap: ()  => Navigator.of(context, rootNavigator: true).pop(),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      width: 110.w,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(6.r)
                      ),
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: BrandColors.primary,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                      )
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    width: 110.w,
                    decoration: BoxDecoration(
                      color: BrandColors.primary,
                      borderRadius: BorderRadius.circular(6.r)
                    ),
                    child: Center(
                      child: Text(
                        'Done',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    )
                  ), 
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}