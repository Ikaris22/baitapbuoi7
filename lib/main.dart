import 'package:flutter/material.dart';
void main (){
runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "User List",
        theme: ThemeData(primarySwatch: Colors.green),
        debugShowCheckedModeBanner: false,
        home: const HomeWork());
  }
}
class HomeWork extends StatefulWidget{
  const HomeWork({super.key});



  @override
  State<StatefulWidget> createState() => _HomeWork();
}
class _HomeWork extends State<HomeWork> {
  bool reverse = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ Text('User List')],
          )),
          body: Column(
              children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      backgroundColor: Colors.deepOrange
                  ),
              onPressed: () {
                        setState(() {
                          reverse==true?reverse=false:reverse=true;
                        });

                     },
                  child: const Text(' Reverse List ')),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
                        backgroundColor: Colors.deepOrange
                    ),
                    onPressed: (){
                       setState(() {
                           user.shuffle();
                        });
                    },
                    child: const Text('Shuffle Users')
                ),
                Container(
                  height:  MediaQuery.of(context).size.height/2.71,
                  child: ListView.builder(
                    reverse: reverse,
                      itemCount: user.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onDoubleTap: (){
                            setState(() {
                              user.removeAt(index);
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 8 ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: index % 2 == 0?Colors.green:Colors.blue
                                ),
                              onPressed: ()=> showAlertDialog(context,user,index) ,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:[
                                    Text('Name: ${user[index].name}',
                                    style: const TextStyle(fontSize: 18)),
                                    Text('Age: ${user[index].age}'),
                                  ]
                              ),
                            )
                          ),
                        ) ;
                      }
                  ),
                ),
              ],
            ),
    );
  }
}

showAlertDialog(BuildContext context,List user,int index) {
  Widget okButton = ElevatedButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    title: const Text('User Detail'),
    content: Row(
      children:[
        Text('Name: ${user[index].name} \nAge: ${user[index].age}  '),
      ]
    ),
    actions: [
      okButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
class Users {
  String name;
  int age;

  Users ( this.name , this.age );

}
List<Users> user = [
  Users ('Chi', 20),
  Users ('Tân', 23),
  Users ('Hiếu', 23),
  Users ('Tú', 23),
  Users ('Tuấn', 28),
];
