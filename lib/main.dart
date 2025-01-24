import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_task/Providers/category_provider.dart';
import 'Providers/login_provider.dart';
import 'Providers/products_provider.dart';
import 'Providers/register_provider.dart';
import 'Screens/Registerion_Screen/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider(),),
        ChangeNotifierProvider(create: (context) => ProductsProvider(),),
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => RegisterProvider(),),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //comment for the github
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginPage(),
      ),
    );
  }
}
