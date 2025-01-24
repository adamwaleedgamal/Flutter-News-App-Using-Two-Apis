import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_task/Screens/Registerion_Screen/register_page.dart';
import 'package:work_task/Screens/products_page..dart';
import '../../Providers/login_provider.dart';
import '../../Widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {

    var obj = Provider.of<LoginProvider>( context,listen: false);

    return Scaffold(
      appBar: AppBar(title: Text("Login Page") , centerTitle: true,),

      body: Consumer(
        builder: (context,LoginProvider value, child) {
          var data = value.loginModel?.data;
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 20,),
                CircleAvatar(
                  radius: 100,
                  child: Image.network("https://static.vecteezy.com/system/resources/previews/029/462/514/non_2x/logo-icon-3d-social-media-in-modern-free-png.png"),
                ),
                SizedBox(height: 40,),
                CustomTextField(controller: email, text: "Email"),

                SizedBox(height: 20,),
                CustomTextField(controller: pass, text: "password"),
                SizedBox(height: 40,),

                GestureDetector(
                  onTap: () async{
                     if(await value.login(email.text, pass.text)){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsPage(),));
                     }else{
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid")));
                     }
                  },

                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.deepPurple
                    ),
                    child: Center(child: Text("Login",style: TextStyle(fontSize: 20),)),
                  ),
                ),
                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't Have an account ?",style: TextStyle(fontSize: 20),),
                    SizedBox(width: 10,),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage(),));

                      },
                        child: Text("Register",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold , color: Colors.deepPurple),)),
                  ],
                )

              ],
            ),
          );
        },

      ),

    );
  }
}
