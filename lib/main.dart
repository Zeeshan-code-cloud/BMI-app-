import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home_Page(),
    );
  }
}
class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {

  final WeightController = TextEditingController();
  final FeetController = TextEditingController();
  final InchController = TextEditingController();
    String result ="" ;
    var bgcolor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor ,
     body: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 30),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         children:   [
           const SizedBox(height: 40,),
           Container(
             width: MediaQuery.of(context).size.width * 0.72,
               height: MediaQuery.of(context).size.height * 0.34,
               child: const Image(image: AssetImage("assets/images/bmi-removebg-preview.png"),fit: BoxFit.contain,)),
           const SizedBox(height: 20,),
           TextField(
             controller: FeetController,
             decoration:  InputDecoration(
               label:  const Text("Enter your in feet"),
               prefixIcon: const Icon(Icons.height),
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(33.0),
               )
             ),
           ),
           const SizedBox(height: 20,),

           TextField(
             controller: InchController,
             decoration:  InputDecoration(
                 label:  const Text("Enter your in Meter"),
                 prefixIcon: const Icon(Icons.height),
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(33.0),
                 )
             ),
           ),
           const SizedBox(height: 20,),
           TextField(
             controller: WeightController,
             decoration:  InputDecoration(
                 label:  const Text("Enter your weight in kg"),
                 prefixIcon: const Icon(Icons.line_weight),
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(33.0),
                 )
             ),
           ),
           const SizedBox(height: 20,),
           ElevatedButton(onPressed: (){
             var ft = FeetController.text.toString().trim();
             var In = InchController.text.trim();
             var wght = WeightController.text.trim();
             if (ft.isEmpty || In.isEmpty || wght.isEmpty) {
               result= "Please provide all field";
               setState(() {

               });
               return;
             }else{
               var ift =int.parse(ft);
               var iIn = int.parse(In);
               var Iwght = int.parse(wght);
               var tIn = (ift*12) + iIn;
               var tCm = tIn*2.40;
               var tM = tCm/100;
               var BMI = Iwght/(tM*tM);
               var msg = '';
               if (BMI > 25) {
                 msg = "you're overweight sir";
                 bgcolor = Colors.redAccent.shade400;
               }  else if (BMI < 18) {
                 msg = "you're underweight sir";
                 bgcolor = Colors.redAccent.shade200;
               }  else{
                 msg = "you're healthy sir";
                 bgcolor = Colors.greenAccent.shade200;
               }
               String strBMI = (BMI.toStringAsFixed(3));
               setState(() {
                 result = "$msg \n   BMI value is : $strBMI";
               });
             }
           }, child: const Text("Calculate",style: TextStyle(fontSize: 20),)),
           const SizedBox(height: 20,),
           Text(result, style: const TextStyle(
             fontSize: 21,
           ),),
         ],
       ),
     ),
    );
  }
}
