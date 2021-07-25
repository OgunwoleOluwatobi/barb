import 'package:barb/core/enums/textfield_type.dart';
import 'package:barb/core/utils/exports.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final TextStyle? style;
  final String? labelText;
  final String? hintText;
  final String? prefixImage;
  final String? suffixImage;
  final Icon? suffixIcon;
  final Function? suffixIconFunc;
  final int? minLines;
  final int? maxLines;
  final TextEditingController? controller;
  final bool? obscure;
  final TextInputAction? action;
  final TextInputType? inputType;
  final ValueChanged? onChanged;
  final VoidCallback? suffixFunc;
  final String? errorText;
  final bool enabled;
  final String? helperText;
  final TextStyle? helperStyle;
  final int? maxLength;
  final bool center;
  final bool showCusor;
  final bool readOnly;
  final bool autofocus;
  final VoidCallback? onSubmit;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final TextFieldType? type;
  final bool validate;
  final bool symbol;
  final bool border;
  final bool search;
  final Function? validator;
  final EdgeInsets? contentPadding;
  final double? radius;
  final bool? showFocusBorder;
  final bool? whiteText;
  // final UserBloc _userBloc = locator<UserBloc>();

  CustomTextField({
    Key? key,
    this.label,
    this.style,
    this.labelText,
    this.hintText,
    this.prefixImage,
    this.suffixImage,
    this.suffixIcon,
    this.suffixIconFunc,
    this.minLines,
    this.maxLines,
    this.controller,
    this.obscure,
    this.action,
    this.inputType,
    this.onChanged,
    this.suffixFunc,
    this.errorText,
    this.enabled = true,
    this.helperText,
    this.helperStyle,
    this.maxLength,
    this.onSubmit,
    this.focusNode,
    this.center = false,
    this.showCusor = true,
    this.readOnly = false,
    this.autofocus = false,
    this.textInputAction,
    this.inputFormatters,
    this.type = TextFieldType.others,
    this.symbol = false,
    this.validate = true,
    this.search = false,
    this.border = false,
    this.validator,
    this.contentPadding,
    this.radius,
    this.showFocusBorder = false,
    this.whiteText = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        label ==null ? SizedBox() : Container(
          // margin: EdgeInsets.only(bottom: 5.h),
          child: Text(
            label!,
            style: Theme.of(context).textTheme.headline5!.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w300,
              color: Color(0xFF7A7991)
            ),
          ),
        ),
        Expanded(
          flex: 0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextFormField(
                  validator: (val) {
                    if(val == null) return 'Invalid input';
                    if(validator == null){
                      if(type == TextFieldType.bvn) {
                        if(val.isEmpty) {
                          return 'Field cannot be empty';
                        } else if (val.trim().isEmpty) {
                          return "Field cannot be empty";
                        } else if(val.length < 11) {
                          return 'Invalid Entry';
                        } else if(int.tryParse(val) == null) {
                          return 'Invalid entry';
                        }
                        return null;
                      } else if(type == TextFieldType.accountNo) {
                        if(val.isEmpty) {
                          return 'Field cannot be empty';
                        } else if (val.trim().isEmpty) {
                          return "Field cannot be empty";
                        } else if(val.length < 10) {
                          return 'Invalid Entry';
                        } else if(int.tryParse(val) == null) {
                          return 'Invalid entry';
                        }
                        return null;
                      } else if(type == TextFieldType.phone) {
                        if(val.isEmpty || val.trim().isEmpty){
                          return 'Field must not be empty';
                        } else if(val.length<11) {
                          return 'Invalid entry';
                        } else if(int.tryParse(val.replaceAll('+', '')) == null) {
                          return 'Invalid entry';
                        }
                        return null;
                      } else {
                        if(validate) {
                          if (val.isEmpty) {
                            return "Field cannot be empty";
                          } else if (val.trim().isEmpty) {
                            return "Field cannot be empty";
                          } else if(type == TextFieldType.amount) {
                            if(double.tryParse(val.replaceAll(',', '')) == null) {
                              return 'Enter a valid amount';
                            } else if(double.tryParse(val.replaceAll(',', ''))! <= 0) {
                              return 'Enter a valid amount';
                            }
                          } else if(type == TextFieldType.email) {
                            bool isValidEmail = RegExp(
                            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                            .hasMatch(val);
                            return isValidEmail ? null : "Please provide a valid email address";
                          } else if(type == TextFieldType.setPassword) {
                            bool isValidPassword = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,15}$")
                            .hasMatch(val);
                            return isValidPassword ? null : "Please provide a valid password";
                          }
                        }

                        return null;
                      }
                    } else {
                      validator!(val);
                    }
                  },
                  inputFormatters: getFormertter(),
                  focusNode: focusNode,
                  autofocus: autofocus,
                  showCursor: showCusor,
                  readOnly: readOnly,
                  enableInteractiveSelection: true,
                  enabled: enabled,
                  controller: controller,
                  maxLines: maxLines == null ? 1 : maxLines,
                  minLines: minLines,
                  obscureText: obscure == null ? false : obscure!,
                  style: style ?? TextStyle(
                    fontSize: 16.sp,
                    fontFamily: symbol ? 'Roboto' : 'GTWalsheimPro',
                    color: enabled ? whiteText! ? Colors.white : null : Colors.grey[400]
                  ),
                  textAlign: center ? TextAlign.center : TextAlign.start,
                  textInputAction: textInputAction == null ? TextInputAction.done : textInputAction,
                  onEditingComplete: onSubmit,
                  keyboardType: inputType == null ? TextInputType.text : inputType,
                  textAlignVertical: TextAlignVertical.center,
                  onChanged: onChanged,
                  maxLength: maxLength,
                  decoration: InputDecoration(
                    isDense: true,
                    // filled: true,
                    // fillColor: search ? Color(0xFFF9F9F9) : Colors.white,
                    labelText: labelText,
                    labelStyle: Theme.of(context)
                      .textTheme
                      .bodyText2
                      !.copyWith(
                          fontSize: 15.sp, 
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF9B9AAC)),
                    hintText: hintText ?? '',
                    hintStyle: TextStyle(
                      fontSize: 15.sp,
                      color: Color(0xFFACACAC),
                      fontWeight: FontWeight.w300
                    ),
                    helperText: helperText,
                    helperStyle: Theme.of(context).textTheme.headline3!.copyWith(
                      fontSize: 12.sp,
                      color: BrandColors.grey9c,
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: search && !border ? Color(0xFFF9F9F9) : showFocusBorder! ? BrandColors.primary : Color(0xFF9B9AAC),
                        width: 1.5
                      ),
                      borderRadius: BorderRadius.circular(radius ?? 7.r)
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: search && !border ? Color(0xFFF9F9F9) : BrandColors.primary,
                        width: 1.5
                      ),
                      borderRadius: BorderRadius.circular(radius ?? 7.r)
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: search && !border ? Color(0xFFF9F9F9) : showFocusBorder! ? BrandColors.primary : Color(0xFF9B9AAC),
                        width: 1.5
                      ),
                      borderRadius: BorderRadius.circular(radius ?? 7.r)
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red
                      ),
                      borderRadius: BorderRadius.circular(radius ?? 7.r)
                    ),
                    errorText: errorText,
                    contentPadding: contentPadding ?? EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                    prefixIconConstraints: BoxConstraints(
                      minHeight: 40.h,
                      minWidth: 60.w
                    ),
                    prefixIcon: prefixImage == null ? null :Container(
                      child: SvgPicture.asset(
                        prefixImage!,
                        fit: BoxFit.none,
                      ),
                    ),
                    suffixIconConstraints: BoxConstraints(
                      minHeight: this.type == TextFieldType.password || this.type == TextFieldType.setPassword ? 40.h : 0,
                      minWidth: this.type == TextFieldType.password || this.type == TextFieldType.setPassword ? 60.w : 0
                    ),
                    suffixIcon: setPasswordIcon(
                      obscuredText: this.obscure,
                      obscurePassword: this.suffixFunc
                    ),
                    
                  ),
                ),
              ),
              suffixImage == null ? SizedBox() : Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                child: InkWell(
                    borderRadius: BorderRadius.circular(5.r),
                    onTap: suffixFunc,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 5.w),
                      decoration: BoxDecoration(
                        color: Color(0xFFB9B9B9).withOpacity(0.12),
                        borderRadius: BorderRadius.circular(5.r)
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            suffixImage!,
                            // color: BrandColors.primary,
                            width: 6.w,
                          ),
                        ],
                      ),
                    ),
                  ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget? setPasswordIcon({required bool? obscuredText, required VoidCallback? obscurePassword}) {
    if (this.type == TextFieldType.password || this.type == TextFieldType.setPassword) {
      return IconButton(
        padding: EdgeInsets.all(0.0),
        icon: obscuredText == null ? Icon(
          Icons.error_outline_sharp,
          color: Colors.red,
        ) : obscuredText ? Icon(Icons.visibility_off, color: BrandColors.primary,) : 
        Icon(Icons.visibility, color: BrandColors.primary,),
        onPressed: obscurePassword,
        iconSize: 20.0,
      );
    } else {
      return null;
    }
  }

  List<TextInputFormatter>? getFormertter() {
      if(type == TextFieldType.amount) {
        return [
          FilteringTextInputFormatter.digitsOnly,
          ThousandsFormatter(),
          // LengthLimitingTextInputFormatter(7),
        ];
      } else if(type == TextFieldType.bvn) {
        return [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(11)
        ];
      }  else if(type == TextFieldType.accountNo) {
        return [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(10)
        ];
      } else if(type == TextFieldType.phone) {
        return [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(14)
        ];
      } else if(type == TextFieldType.name) {
        return [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z-]"))];
      }
      return inputFormatters;
    }
}