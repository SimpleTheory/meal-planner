import 'package:flutter/material.dart';
import 'package:nutrition_app/domain.dart';
import 'package:flutter_zxing/flutter_zxing.dart';
import 'package:nutrition_app/screens/ingredients_page.dart';
import '../temp_dummy_data.dart';

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
  const BarcodeReaderForFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ReaderWidget(
    onScan: (Code code) {
      try {
        if (code.isValid) {
          print(code.text);
          final ing = Ingredient.fromApi(settings, int.parse(code.text!));
          print(ing);
          // Navigator.pop(context);
          ing.then((value) => showDialog(
              context: context,
              builder: (context) => confirmIngredient(value, context)));
        }
      } catch (err) {
        print(err);
        // todo write in snack bars for errs when functionality hits
        // onErrFunc
      }
    },
    onScanFailure: (code) {
      print('failure $code');
      // onErrFunc
    },
    isMultiScan: false,
    scanDelay: const Duration(milliseconds: 500),
  );
}


// Widget barcodeReaderForFood(BuildContext context) => ReaderWidget(
//       onScan: (Code code) {
//         try {
//           if (code.isValid) {
//             print(code.text);
//             final ing = Ingredient.fromApi(settings, int.parse(code.text!));
//             print(ing);
//             // Navigator.pop(context);
//             ing.then((value) => showDialog(
//                 context: context,
//                 builder: (context) => confirmIngredient(value, context)));
//           }
//         } catch (err) {
//           print(err);
//           // todo write in snack bars for errs when functionality hits
//           // onErrFunc
//         }
//       },
//       onScanFailure: (code) {
//         print('failure $code');
//         // onErrFunc
//       },
//       isMultiScan: false,
//       scanDelay: const Duration(milliseconds: 500),
//     );

// void onErrFunc(){} TODO

// void scanSuccess(Code code, BuildContext context){
//   try{
//     if (code.isValid){
//       final ing = Ingredient.fromApi(settings, int.parse(code.text!));
//       ing.then((value) => showDialog(context: context,
//           builder: (context) => confirmIngredient(value, context)));
//     }
//   }
//   catch(err){
//     // todo write in snack bars for errs when functionality hits
//   }
// }
