// import 'package:flutter/material.dart';
// import '../temp_dummy_data.dart';
// import '../utils/local_widgets.dart';
//
// class ShoppingListPage extends StatelessWidget {
//
//   const ShoppingListPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(diet.name)),
//       drawer: dietDrawer(diet, context),
//       body: Placeholder(),
//     );
//   }
// }
//
// // DragTarget with title on top
// // Draggable
//
// // Widget dragTarget(String title){
// //
// // }
//
// Widget draggable(String data) =>
//   LayoutBuilder(builder: (context, constraints)=>
//       Draggable<String>(
//           feedback: dragBody(data, drag: true),
//           childWhenDragging: dragBody(data, drag: true),
//           child: dragBody(data),
//       )
//   );
//
// Container dragBody( String data, {bool drag=false}){
//   return Container(
//       color: !drag ? Colors.green : const Color.fromRGBO(76, 175, 80, 33), // 76 175 80
//       padding: const EdgeInsets.all(8),
//       child: Text(data, style: TextStyle(color: !drag ? Colors.white : const Color.fromRGBO(255, 255, 255, 33)))
//   );
// }