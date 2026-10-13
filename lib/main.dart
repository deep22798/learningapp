import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:learn/bloccontroller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      // MultiBlocProvider(
      //   providers: [
      //     BlocProvider(create: (_)=>CubitContro())
      //   ],
      // child: const MyApp())

    MultiProvider(
        providers: [
      ChangeNotifierProvider(create: (_)=>newprovider())
    ],
        child: Providerrrr() )
  );
}



class newprovider extends ChangeNotifier{
  int a=0;
  String name='Kuldeep Singh';
  int curinx=0;

  List<String> nameList = [
    "Kuldeep Singh",
    "Rahul Kumar",
    "Amit Sharma",
    "Rohit Verma",
    "Arjun Singh",
  ];
  void changevalue(){
    a++;
    notifyListeners();
  }

  void changename(){
    curinx++;

    if(curinx>nameList.length){
      curinx=0;
    }
    name= nameList[curinx];
    notifyListeners();
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cubit Example'),
        ),
        body: Center(
          child: Column(
            children: [
              MaterialButton(
                onPressed: (){
                  Get.to(()=>Home());
                  }
                ,child: Text("CLick"),),
              BlocBuilder<CubitContro, int>(
                builder: (context, count) {
                  return Text(
                    '$count',
                    style: const TextStyle(fontSize: 40),
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<CubitContro>().increement();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}



class Home extends StatelessWidget {
   Home({super.key});

  final gety ge= Get.put(gety());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${ge.a.toString()}",style: TextStyle(fontSize: 30),),
              InkWell(
                onTap: (){ge.increement();},
                  child: Text("+",style: TextStyle(fontSize: 30),)),
              InkWell(onTap: (){ge.decreement();},
                  child: Text("-",style: TextStyle(fontSize: 30),))
            ],

          ),
        ),
      ),
    );
  }
}



class gety extends GetxController{
  var a=0.obs;

  void increement(){
    a++;
  }

  void decreement(){
    a--;
  }
}


class Providerrrr extends StatelessWidget {
   Providerrrr({super.key});

  @override
  Widget build(BuildContext context) {
    final newpro = context.watch<newprovider>();
    final newproread = context.read<newprovider>();

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${newpro.a.toString()}",style: const TextStyle(fontSize: 30),),
              Text("${newpro.name.toString()}",style: const TextStyle(fontSize: 30),),
              InkWell(
                  onTap: (){newproread.changevalue();},
                  child: const Text("+",style: TextStyle(fontSize: 30),)),
               InkWell(onTap: (){newproread.changename();},
                  child: Text("-",style: TextStyle(fontSize: 30),))
            ],
      
          ),
        ),
      ),
    );
  }
}
