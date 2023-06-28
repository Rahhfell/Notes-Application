import 'package:app3/Utilities/dialogs/generic_dialog.dart';
import 'package:flutter/cupertino.dart';

Future<void> showPasswordResetSentDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    title: 'Password Reset',
    content: 'We have sent a password reset link',
    optionsBuilder: () => {'OK': null},
  );
}
