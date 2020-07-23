import 'package:flutter/material.dart';

//==================================================================
// REF AND THKS: https://androidkt.com/flutter-alertdialog-example/
//==================================================================

class Ep14Page extends StatefulWidget {
  @override
  _Ep14PageState createState() => _Ep14PageState();
}

enum ConfirmAction { CANCEL, ACCEPT }
enum Departments { Production, Research, Purchasing, Marketing, Accounting }
class _Ep14PageState extends State<Ep14Page> {
//==================================================================
// STEP 1: CREATE GLOBAL KEY VARIABLE
//==================================================================  
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//==================================================================
// STEP 2: KEY IN SCAFFOLD
//==================================================================       
      key: scaffoldKey,
      appBar: AppBar(title: Text('EP14 - SNACKBAR & DIALOG'),),
      body: ListView(children: <Widget>[
          RaisedButton(onPressed: (){fnSnackBar();}, child: Text('SnackBar'),),
          RaisedButton(onPressed: (){_showMyDialog();}, child: Text('Dialog - SHOW MESSAGE'),),
          RaisedButton(onPressed: (){_ackAlert(context);}, child: Text('Dialog - ACKNOWLDGET DIALOG'),),                    
          RaisedButton(onPressed: (){_asyncConfirmDialog(context);}, child: Text('Dialog - CONFIRM'),),           
          RaisedButton(onPressed: (){_asyncSimpleDialog(context);}, child: Text('Dialog - SELECT OPTION'),), 
          RaisedButton(onPressed: (){_asyncInputDialog(context);}, child: Text('Dialog - WITH TEXT FIELD'),), 
                ],)
                
              );
            }
 //==================================================================
// FUNCTION#1: SNACKBAR
//==================================================================           
      void fnSnackBar() {
        scaffoldKey.currentState.showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text('This is SnackBar', style: TextStyle(color: Colors.white))));
      }
//==================================================================
// FUNCTION#2: DIALOG - ANDRIOD
//==================================================================  
Future<void> _showMyDialog() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('This is a demo alert dialog.'),
              Text('Would you like to approve of this message?'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
//==================================================================
// FUNCTION#3: DIALOG - IOS
//==================================================================  
  Future<void> _ackAlert(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Not in stock'),
        content: const Text('This item is no longer available'),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}


 //==================================================================
// FUNCTION#3: DIALOG 2
//==================================================================  
Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Reset settings?'),
        content: const Text(
            'This will reset your device to its default factory settings.'),
        actions: <Widget>[
          FlatButton(
            child: const Text('CANCEL'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.CANCEL);
            },
          ),
          FlatButton(
            child: const Text('ACCEPT'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.ACCEPT);
            },
          )
        ],
      );
    },
  );
}



  //==================================================================
// SELECT OPTION
//==================================================================  
Future<Departments> _asyncSimpleDialog(BuildContext context) async {
  return await showDialog<Departments>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select Departments '),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Departments.Production);
              },
              child: const Text('Production'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Departments.Research);
              },
              child: const Text('Research'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Departments.Purchasing);
              },
              child: const Text('Purchasing'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Departments.Marketing);
              },
              child: const Text('Marketing'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Departments.Accounting);
              },
              child: const Text('Accounting'),
            )
          ],
        );
      });
}


//==================================================================
// DIALOG WITH TEXT FIELD
//================================================================== 
Future<String> _asyncInputDialog(BuildContext context) async {
  String teamName = '';
  return showDialog<String>(
    context: context,
    barrierDismissible: false, // dialog is dismissible with a tap on the barrier
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Enter current team'),
        content: new Row(
          children: <Widget>[
            new Expanded(
                child: new TextField(
              autofocus: true,
              decoration: new InputDecoration(
                  labelText: 'Team Name', hintText: 'eg. Juventus F.C.'),
              onChanged: (value) {
                teamName = value;
              },
            ))
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop(teamName);
            },
          ),
        ],
      );
    },
  );
}


}