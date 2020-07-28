import 'package:flutter/material.dart';
import 'package:flutterep11/widgets/TextFieldBorderLessWidget.dart';

class Ep181Page extends StatefulWidget {
  @override
  _Ep181PageState createState() => _Ep181PageState();
}

class _Ep181PageState extends State<Ep181Page> {
//===================================================
// DECLARE VARIABLE
//===================================================
  final TextEditingController nameController = TextEditingController()..text = 'Mr. Johnson Smith';  
  final TextEditingController surNameController = TextEditingController();  
  final TextEditingController emailController = TextEditingController();  
  final TextEditingController passwordController = TextEditingController();        
//===================================================
// BUILD WIDGET
//===================================================  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EP18-1 TextField'),),
      body: ListView(children: <Widget>[
//===================================================
// TEST
//===================================================
        Text('Name: ${nameController.text} Surname: ${surNameController.text} E-mail: ${emailController.text}'),
//===================================================
// CONTAINER
//===================================================
      Padding(
        padding: EdgeInsets.only(top: 8,bottom: 8),
        child: Container(
          // padding: EdgeInsets.only(top: 8,bottom: 8),
          alignment: Alignment.center,
          height: 40,color: Colors.black12,child: Text('TextField No Border'),),
      ),          
//===================================================
// TEXT FIELD (BORDERLESS)
//===================================================
        TextFieldBorderlessWidget(nameController: nameController, labelText: 'Name',hintText: 'Enter Name max 20 digits',icon: Icon(Icons.person)),    
        TextFieldBorderlessWidget(nameController: surNameController, labelText: 'Surname',hintText: 'Enter Surname max 20 digits',icon: Icon(Icons.people)),  
        TextFieldBorderlessWidget(nameController: emailController, labelText: 'E-mail',hintText: 'Enter E-mail',icon: Icon(Icons.email)),  
        TextFieldBorderlessWidget(nameController: passwordController, labelText: 'Password',hintText: 'Enter Password',icon: Icon(Icons.verified_user)),
//===================================================
// RAISED BUTTON
//===================================================       
        RaisedButton(onPressed: () {
            setState(() {
              // RELOAD UI            
            });

        },child: Text('Submit',style: TextStyle(color: Colors.white)),color: Colors.blue,),   
//===================================================
// CONTAINER
//===================================================
      Padding(
        padding: EdgeInsets.only(top: 8,bottom: 8),
        child: Container(
          // padding: EdgeInsets.only(top: 8,bottom: 8),
          alignment: Alignment.center,
          height: 40,color: Colors.black12,child: Text('TextField with Border'),),
      ),        
//===================================================
// TEXT FIELD (BORDER)
//===================================================
        TextFieldBorderWidget(nameController: nameController, labelText: 'Name',hintText: 'Enter Name max 20 digits',icon: Icon(Icons.person)),    
        TextFieldBorderWidget(nameController: surNameController, labelText: 'Surname',hintText: 'Enter Surname max 20 digits',icon: Icon(Icons.people)),  
        TextFieldBorderWidget(nameController: emailController, labelText: 'E-mail',hintText: 'Enter E-mail',icon: Icon(Icons.email)),  
        TextFieldBorderWidget(nameController: passwordController, labelText: 'Password',hintText: 'Enter Password',icon: Icon(Icons.verified_user)),                                    
      ],

      ),
      
    );
  }
}


//===================================================
// CLASS TEXT FIELD WIDGET (WITH BORDER)
//===================================================
class TextFieldBorderWidget extends StatelessWidget {
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
  const TextFieldBorderWidget({
    this.labelText, this.hintText,this.icon,
    Key key,
    @required this.nameController,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
//===================================================
// PADDING
//===================================================          
        Padding(
          padding: const EdgeInsets.only(right: 8),
//===================================================
// TEXTFIELD
//===================================================            
          child: TextField(
            controller: nameController,  
            decoration: InputDecoration(
            border: OutlineInputBorder(),
              labelText: labelText,
              hintText: hintText,
              icon: icon,            
            ),
          ),
        ),
//===================================================
// SIZEDBOX = SPACE
//===================================================          
        SizedBox(height: 8,)

      ],
    );
  }
}