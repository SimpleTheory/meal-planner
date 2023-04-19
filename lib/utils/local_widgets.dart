import 'package:flutter/material.dart';

Widget plusSignTile(void Function()? onTap) =>
  Padding(
    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: ListTile(
        onTap: onTap,
        title: const Center(child: Icon(Icons.add),),
        tileColor: const Color.fromRGBO(240, 240, 240, 30),
        shape: const BeveledRectangleBorder(
          side: BorderSide(color: Color.fromRGBO(150, 150, 150, 80), width: 1),
    // borderRadius: BorderRadius.(5),
          ),
        ),
      );