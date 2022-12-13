import 'package:flutter/material.dart';
import 'package:clubrecruitment/homepage.dart';
import 'package:clubrecruitment/Practice.dart';
import 'package:clubrecruitment/prac.dart';
import 'package:clubrecruitment/flashcard.dart';
import 'dart:math';


void main() => runApp(MaterialApp(
  home:Home()

));

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {



  List <Widget> flashcardlist=[];
  List <String> questions=[];
  List<String> answers=[];
  var TitleText=TextEditingController();
  var AnswerText=TextEditingController();
  String Title="";
  String Answer="";
  var randomindex;




  @override
  Widget build(BuildContext context) {
    return
      Scaffold(


        backgroundColor: Colors.deepPurple[600],
        appBar:AppBar(
          title: Row(
            children: [
              Text("FlashCards",style:TextStyle(fontSize: 25.0,fontWeight:FontWeight.bold,color:Colors.black,fontFamily:'ZenDots')),
              Text("                    "),
              ElevatedButton(onPressed: (){
                var randomindex=Random().nextInt(questions.length);
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Practice(value1:questions[randomindex],value2:answers[randomindex])));




              }, child: Text("Practice",style:TextStyle(fontFamily:'ZenDots',fontSize:10))),
            ],
          ),
          centerTitle:true,
          backgroundColor: Colors.deepOrange[300],
        ),
        body: ListView.builder(itemCount: questions.length,
            itemBuilder: (context,index){
              return Card(
                color: Colors.amber,

                margin:EdgeInsets.all(10.0),
                shape:RoundedRectangleBorder(
                    side:BorderSide(

                    ),
                    borderRadius: BorderRadius.circular(15.0)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Q:- ${questions.elementAt(index)} \n\n",style:TextStyle(fontFamily:'ZenDots',fontSize:20,)),

                    Text("A:- ${answers.elementAt(index)}\n\n  ",style:TextStyle(fontFamily:'ZenDots',fontSize:20,)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: (){
                          setState(() {
                            questions.removeAt(index);
                            answers.removeAt(index);
                          });
                        }, icon: Icon(Icons.delete,size:30,color:Colors.red))
                      ],
                    )
                  ],
                ),

              );

            }),

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
                child:Text("Submit",style:TextStyle(fontSize: 12,fontFamily: 'ZenDots')),
              )
            ],
          ))

      ));
  void submit() {
    String Title=TitleText.text.toString();
    String Answer=AnswerText.text.toString();
    Navigator.of(context).pop();

    setState(() {
      questions.add(TitleText.text);
      answers.add(AnswerText.text);

    });



    TitleText.clear();
    AnswerText.clear();




  }


}




