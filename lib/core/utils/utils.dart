import 'package:intl/intl.dart';
import 'package:barb/core/utils/exports.dart';
import 'package:stacked_services/stacked_services.dart';

class Utils{
  static EdgeInsets padding = EdgeInsets.only(top: MediaQuery.of(StackedService.navigatorKey!.currentContext!).padding.top + 40.h, left: 20.w, right: 20.w, bottom: 40.h);
  static double statusBarPadding = MediaQuery.of(StackedService.navigatorKey!.currentContext!).padding.top;

  static BoxDecoration roundedShadow = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8.r),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(.1),
        spreadRadius: 1,
        blurRadius: 8,
        offset: Offset(0, 1),
      ),
    ],
  );

  static final currencyFormatter2 = NumberFormat.simpleCurrency(name: 'NGN', decimalDigits: 2);
  static final currencyFormatter0 = NumberFormat.simpleCurrency(name: 'NGN', decimalDigits: 0);
  static final normalFormatter = new NumberFormat("#,###");

  static final SystemUiOverlayStyle light = Platform.isIOS ? SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.dark
  ) : SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.dark
  );

  static final SystemUiOverlayStyle dark = Platform.isIOS ? SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.dark
  ) : SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.dark
  );

  static final SystemUiOverlayStyle white = Platform.isIOS ? SystemUiOverlayStyle(
    statusBarColor: BrandColors.light,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.dark
  ) : SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.dark
  );

  static final SystemUiOverlayStyle darkWhiteNav = Platform.isIOS ? SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.light
  ) : SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.light
  );

  static String getLoanStatus(int val) {
    String stat;
    switch (val) {
      case 1:
        stat = 'Pending';
        break;
      case 2:
        stat = 'Approved';
        break;
      case 7:
        stat = 'Rejected';
        break;
      case 8:
        stat = 'Due';
        break;
      case 9:
        stat = 'Cancelled';
        break;
      case 10:
        stat = 'Written Off';
        break;
      default:
        stat = '';
    }
    return stat;
  }

  static List<DropdownMenuItem<T>> getDropdownItem<T>(List<T> items) {
    return items.map((T value) {
      return new DropdownMenuItem<T>(
        value: value,
        child: new Text(
          '$value',
          style: Theme.of(StackedService.navigatorKey!.currentContext!).textTheme.headline4!.copyWith(
            fontSize: 16.sp,
            color: Color(0xFFACACAC),
          ),
        ),
      );
    }).toList();
  }

  static List<String> days = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31'
  ];
}