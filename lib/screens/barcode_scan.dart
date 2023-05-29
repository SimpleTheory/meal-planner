import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/blocs/ingredients_page/ingredients_page_bloc.dart';
import 'package:nutrition_app/domain.dart';
import 'package:flutter_zxing/flutter_zxing.dart';
import 'package:nutrition_app/screens/ingredients_page.dart';
import 'package:nutrition_app/utils.dart';
import '../blocs/init/init_bloc.dart';

class BarcodeReadingPage extends StatelessWidget {
  const BarcodeReadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Barcode Reader')),
      body: const BarcodeReaderForFood(),
    );
  }
}

class BarcodeReaderForFood extends StatelessWidget {
  bool _isThereCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

  const BarcodeReaderForFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ReaderWidget(
        onScan: (Code code) {
          // <editor-fold desc="If Valid">
          if (code.isValid &&
              _isThereCurrentDialogShowing(context) &&
              code.toString().length == 12)
          // </editor-fold>
          {
            print('Current is valid');
            Ingredient.fromApi(context.read<InitBloc>().state.app!.settings,
                    int.parse(code.text!))
                .then((value) {
              showDialog(
                  context: context,
                  builder: (context) => BlocProvider.value(
                        value: context.read<IngredientsPageBloc>(),
                        child: confirmIngredient(value, context),
                      ));
            }, onError: (err) {
              showErrorMessage(context, err.toString());
            });
          }
        },
        onScanFailure: (code) {
          // print('failure $code');
          // onErrFunc
        },
        isMultiScan: false,
        scanDelay: const Duration(milliseconds: 500),
      );
}
