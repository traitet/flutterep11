

import 'package:flutter/material.dart';

//===================================================
// CLASS TEXT FIELD WIDGET (NO BORDER)
//===================================================
class TextFieldBorderlessWidget extends StatelessWidget {
//===================================================
// DECLARE VARIABLE = PROPERTY
//===================================================  
  final TextEditingController nameController;
  final String labelText;
  final String hintText;
  final Icon icon;
//===================================================
// CONSTRUCTURE
//===================================================    
  const TextFieldBorderlessWidget({
    this.labelText, this.hintText,this.icon,
    Key key,
    @required this.nameController,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: nameController,  
      decoration: InputDecoration(
        //border: OutlineInputBorder(),
        labelText: labelText,
        hintText: hintText,
        icon: icon,            
      ),
    );
  }
}