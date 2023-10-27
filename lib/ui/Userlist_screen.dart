import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_project/constants/Appcolors.dart';
import 'package:task_project/constants/StringConstants.dart';
import 'package:task_project/controller/user_controller.dart';
import 'package:task_project/model/Userdatalist_model.dart';

import 'Detail_screen.dart';

class Userlist_screen extends StatefulWidget {
  const Userlist_screen({super.key});

  @override
  State<Userlist_screen> createState() => _Userlist_screenState();
}

class _Userlist_screenState extends State<Userlist_screen> {
  final usercontroller=Get.put(Usercontroller());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: FutureBuilder<List<UserdatalistModel>>(
          future: usercontroller.getuserlist(),
          builder: (context, snapshot) {
            print("snapshot");
            print(snapshot.data);
            if (snapshot.hasData) {
              return Padding(
                  padding: EdgeInsets.only(left: 15.0,right: 15.0),
                  child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder:  (BuildContext context, int i){
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Detail_screen(id: snapshot.data![i].id!.toInt(),)));
                                usercontroller.update();
                              },
                              child: Container(
                                alignment: Alignment.topLeft,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                    border: Border.all(width: 0.5,color: Appcolors().bordercolor)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: <Widget>[
                                      const Icon(Icons.account_circle,size: 50,),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      userwidget(snapshot.data![i].name.toString(),snapshot.data![i].email.toString(),snapshot.data![i].phone.toString()),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        );
                      }
                  )
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
  Widget userwidget(String name,String email,String phonenumber){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${StringConstants.name} :- $name"),
          const SizedBox(
            height: 5,
          ),
          Text("${StringConstants.email} :- $email"),
          const SizedBox(
            height: 5,
          ),
          Text("${StringConstants.phonenumber} :- $phonenumber",style: TextStyle(overflow: TextOverflow.ellipsis),),
        ],
      ),
    );
  }
}
