import 'package:stacked_services/stacked_services.dart';
import 'package:barb/core/utils/exports.dart';
import 'package:barb/ui/widgets/dialogs/loader_dialog.dart';
import 'package:barb/ui/widgets/dialogs/success_dialog.dart';
import 'package:barb/ui/widgets/dialogs/sucess_dialog2.dart';

void setupDialog() {
  final DialogService _dialogService = locator<DialogService>();

  final builders = {
    DialogType.loader: (context, sheetRequest, completer) => LoaderDialog(request: sheetRequest),
    DialogType.success: (context, sheetRequest, completer) => SuccessDialog(
      request: sheetRequest,
      completer: completer,
    ),
    DialogType.success2: (context, sheetRequest, completer) => SuccessDialog2(
      request: sheetRequest,
      completer: completer,
    ),
  };

  _dialogService.registerCustomDialogBuilders(builders);
}