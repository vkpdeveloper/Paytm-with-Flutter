import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<dynamic, dynamic> response;
      static const platform = const MethodChannel('com.vkpdeveloper.paytmpayments/paytm');

  void startPaytm() async {
    try{
      Map<dynamic, dynamic> res = await platform.invokeMethod('payWithPaytm', {
        "orderId": "5464676768678967",
        "customerId": "vkpdeveloper",
        "amount": "405"
      });
      setState(() {
        response = res;
      });
    }on PlatformException catch(e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.monetization_on),
        onPressed: startPaytm,
      ),
      appBar: AppBar(title: Text("Paytm Flutter"),),
      body: Container(
        child: Text(response.toString()),
      ),
    );
  }
}
