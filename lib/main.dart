import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:clubrecruitment/Database.dart';
import 'package:clubrecruitment/Practice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(home:Home()));
}
// void main() => runApp(MaterialApp(
//   home:Home()
//
// ));


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;


  @override
  void initState() {
    getConnectivity();
    super.initState();
  }
  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
            (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox();
            setState(() => isAlertSet = true);
          }
        },
      );


  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }




  var TitleText=TextEditingController();
  var AnswerText=TextEditingController();
  String Title="";
  String Answer="";
  var randomindex;




  @override
  Widget build(BuildContext context) {
    return
      Scaffold(


        backgroundColor: Colors.white12,
        appBar:AppBar(
          title: Row(
            children: [
              Text("FlashCards",style:TextStyle(fontSize: 35.0,fontWeight:FontWeight.bold,color:Colors.black,fontFamily:'Oswald')),
              Text("                              "),
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Practice()));
              }, child: Text("Practice",style:TextStyle(fontFamily:'Oswald',fontSize:13)),
                  style: TextButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black

              )),
              Text("   "),

            ],
          ),
          centerTitle:true,
          backgroundColor: Colors.purple[600],
        ),
        body:Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.purple, Colors.blueAccent],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [0.4, 0.7],
              tileMode: TileMode.repeated,
            ),
          ),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('Carddata').snapshots(),
            builder: (context,AsyncSnapshot snapshot){
              if (!snapshot.hasData){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.data.docs.length==0)
                {
                  return Center(
                    child: Text("No Cards Added Yet"),
                  );
                }
              return ListView.builder
                (
                  itemCount: snapshot.data.docs.length,
                  itemBuilder:(context,index){
                    DocumentSnapshot course=snapshot.data.docs[index];
                    return Card(
                      color: Colors.red[600],

                      margin:EdgeInsets.all(10.0),
                      shape:RoundedRectangleBorder(
                          side:BorderSide(

                          ),
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Q:- ${course['question']} \n\n",style:TextStyle(fontFamily:'Oswald',fontSize:20,color:Colors.white70)),

                          Text("A:- ${course['answer']}\n\n  ",style:TextStyle(fontFamily:'Oswald',fontSize:20)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(onPressed: (){
                                setState(() {
                                  delete(snapshot.data.docs[index].id);

                                });
                              }, icon: Icon(Icons.delete,size:30,color:Colors.amber))
                            ],
                          )
                        ],
                      ),

                    );

                  });
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed:(){
          openDialog();

        },
          child:Text("Add Card",style:TextStyle(fontSize: 10.0,color: Colors.black)),
          hoverColor: Colors.blueAccent,
          backgroundColor: Colors.blue,


        ),

      );


  }
  Future openDialog()=> showDialog(
      context: context,
      builder: (context)=>AlertDialog(
          title:Text('Create FlashCard'),
          content:
          Center(child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                  controller: TitleText,
                  autofocus: true,
                  decoration:InputDecoration(
                      hintText: 'Enter Title here',
                      enabledBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(color:Colors.black)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(11),
                          borderSide: BorderSide(color:Colors.deepOrange)
                      )
                  )
              ),
              Container(height:10),
              TextField(
                  controller:AnswerText,
                  decoration:InputDecoration(
                      hintText: 'Enter Answer here',
                      enabledBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(color:Colors.black)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(11),
                          borderSide: BorderSide(color:Colors.deepOrange)
                      )
                  )
              ),
              ElevatedButton(onPressed:submit,
                child:Text("Submit",style:TextStyle(fontSize: 12,fontFamily: 'Oswald')),
              )
            ],
          ))

      ));

  void submit() {
    Title=TitleText.text.toString();
    Answer=AnswerText.text.toString();
    Navigator.of(context).pop();
    TitleText.clear();
    AnswerText.clear();
    addcard().carddata(Title, Answer);




  }
  void delete(id)
  {
    FirebaseFirestore.instance.collection('Carddata').doc(id).delete();
  }

  showDialogBox() => showCupertinoDialog<String>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text('No Connection'),
      content: const Text('Please check your internet connectivity'),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            Navigator.pop(context, 'Cancel');
            setState(() => isAlertSet = false);
            isDeviceConnected =
            await InternetConnectionChecker().hasConnection;
            if (!isDeviceConnected && isAlertSet == false) {
              showDialogBox();
              setState(() => isAlertSet = true);
            }
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );


}






