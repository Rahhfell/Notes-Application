import 'package:app3/Utilities/dialogs/generic_dialog.dart';
import 'package:flutter/cupertino.dart';

Future showErrorDialog(BuildContext context, String text) {
  return showGenericDialog(
      context: context,
      title: text,
      content: 'An Error occured',
      optionsBuilder: () => {
            'Ok': null,
          });
}
