import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../store/ad_new.dart';
import 'home.dart';
class add extends StatefulWidget {
  const add({Key? key}) : super(key: key);


  @override
  State<add> createState() => _addState();
}



class _addState extends State<add> {
  AdNew adNew = AdNew ();
  final TextEditingController _titleTextEditingController = TextEditingController();
  final TextEditingController _bodyTextEditingController = TextEditingController();

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Observer(
      builder:(_) => Stack(children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child: TextField(
                      controller: _titleTextEditingController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.grey),

                          ),
                          hintText: ("Insert title"),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.blue),
                          )
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                //height: 80,
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child: TextField(
                      maxLines: 5,
                      controller: _bodyTextEditingController,
                      decoration: InputDecoration(border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                          hintText: ("Insert body"),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.blue),
                          )
                      )
                  )
              ),
            ],
          ),
        )]),),

      floatingActionButton: FloatingActionButton(
        onPressed: (){adNew.apiPostCreate(_titleTextEditingController,_bodyTextEditingController).then((value) => {
          Navigator.push(context,MaterialPageRoute(builder: (context) =>  home1()),)
        });},
        child: Icon(Icons.add),
      ),
    );
  }
}
