// import 'package:hive/hive.dart';
// import 'package:barb/app/locator.dart';
// import 'package:barb/core/models/user.dart';
// import 'package:barb/core/utils/hive_boxes.dart';
// import 'package:stacked/stacked.dart';

// abstract class UserLocalDataSource {
//   User? user;
//   Future<void> init();
//   void getUser();
//   Future addUser(User user);
//   void addPassword(String password);
//   void clear();
//   void clearUser();
// }

// class UserLocalDataSourceImpl extends UserLocalDataSource with ReactiveServiceMixin {
//   User? _user;
//   @override
//   User? get user => _user;
  
//   final _hiveService = locator<HiveInterface>();

//   bool get _isBoxOpen => _hiveService.isBoxOpen(HiveBox.user);
//   Box<User> get _userBox => _hiveService.box<User>(HiveBox.user);

//   UserLocalDataSourceImpl(){
//     listenToReactiveValues([_user]);
//   }

//   @override
//   Future<void> init() async{
//     _hiveService.registerAdapter(UserAdapter());

//     if (!_isBoxOpen) {
//       await _hiveService.openBox<User>(HiveBox.user);
//     }
//   }

//   @override
//   Future addPassword(String password) async{
//     getUser();
//     User updatedUser = _user!..password = password;
//     await _userBox.putAt(0, updatedUser);
//     getUser();
//   }

//   @override
//   Future addUser(User user) async{
//     await _userBox.put(0, user);
//     getUser();
//   }

//   @override
//   void getUser() {
//     _user = _userBox.get(0);
//     notifyListeners();
//   }

//   @override
//   void clear() {
//     _userBox.clear();
//     getUser();
//   }

//   @override
//   void clearUser() {
//     _user = null;
//     notifyListeners();
//   }
  
// }