import 'package:flutter/material.dart';

import 'DataFile.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "MyFirst",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MyHomePage()


    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),),
      body:MyButton(),
    );
  }

}

class MyButton extends StatelessWidget {
  MyButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 10,top: 0,right: 10, bottom:0),
        child: Column(
            children: [Stack(
                children:[
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: ElevatedButton(
                      onPressed: () { print("hello");
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => Second())
                      );
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(32, 8, 32, 8)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(color: Colors.red, width: 1, strokeAlign: BorderSide.strokeAlignInside)
                              )
                          )
                      ),
                      child: const Text(
                        'Cancel',textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 14), textScaleFactor: 1,
                      ),
                    ),
                  ),
                  Visibility(
                      visible: false,
                      child: Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.red),
                              padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(32, 8, 32, 8)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )
                              )
                          ),
                          child: const Text("Confirm", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 14),)

                      )
                  ),
                  )

                ]

            ),
              SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Listview(data: List.generate(10,
                              (i) => DataFile('Task $i', 'Task Description $i',),),),
                        ));
                  },

                  child: const Text("Go to Next Screen", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 14),)

              )
            ]
        )


    );
  }

}

class Second extends StatelessWidget {
  Second({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
              padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(32, 8, 32, 8)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
              )
          ),
          child: const Text("Confirm", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 14),)

      ),
    );
  }
}

class Listview extends StatelessWidget {
  Listview({super.key, required this.data});
  final List<DataFile> data ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My List"),
      ),
      body: ListView.builder(itemCount: data.length,
          itemBuilder: (context, index){
        return customList(context, data[index]);
        // ListTile(
        //   title: Text(data[index].task),
        //   onTap: () {
        //     Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //             builder: (context) => DetailScreen(info: data[index])));
        //   }
        // );
          }),
      
    );

  }

  Widget customList(BuildContext context, DataFile info) {
    return Card(
      child: Row(
        children: [
          Container(child: Text("label  : ${info.desc}")),
          InkWell(
            onTap:() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailScreen(info: info)));

            },
          child: Expanded(child: Image.asset('assets/Icon_launch.png', fit: BoxFit.fitHeight, width: 30, height: 40,))
          )
        ],
      ),
    );
  }

}
class DetailScreen extends StatelessWidget {
  DetailScreen({super.key, required this.info});
  final DataFile info;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: Text("Description")),
      body: Center(
        child: Text(info.desc),
      ),
    );

  }

}
