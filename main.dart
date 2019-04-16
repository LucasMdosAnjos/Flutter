import 'package:flutter/material.dart';

void main() => runApp(Home());


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controllerEmail = TextEditingController();
  final controllerSenha = TextEditingController();
  String email, senha;
  Future<Null> _refresh() async
  {
    await Future.delayed(Duration(seconds: 3));
    return null;
  }
  void initialState()
  {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OnePlanet',
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('ONEPLANET',style: TextStyle(color: Colors.yellowAccent,letterSpacing: 4.0),),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body:
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                "images/maior.png",
                fit: BoxFit.cover,
                height: 250.0,width: 300.0,
              ),
                Padding(
                  padding: const EdgeInsets.only(right: 35.0),
                  child: textFieldModel(context, 'Email', 'example@gmail.com',Icon(Icons.email),controllerEmail)
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(right: 35.0,top: 20.0),
                  child: textFieldModel(context, 'Senha', '123456',Icon(Icons.lock_outline),controllerSenha),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ButtonTheme(
                    minWidth: 285.0,
                    height: 50.0,
                    child: RaisedButton(
                        onPressed: (){
                          setState(() {
                            senha = controllerSenha.text;
                            email = controllerEmail.text;
                          });
                            print(email);
                            print(senha);
                            controllerSenha.text = "";
                            controllerEmail.text = "";
                        },
                      color: Colors.green,
                      elevation: 15.0,
                      child: Text('LOGIN',style: TextStyle(letterSpacing: 7.0),),
                      textColor: Colors.white,
                        ),
                  ),
                )
            ],
          ),
        ),
      )
    );
  }



  //MODELO PARA TEXTFIELD/INPUT_TEXT
  Widget textFieldModel(context,labelText,hintText,icon,controller)
  {
    return TextField(
      controller: controller,
      maxLength: 30,
      decoration: InputDecoration(
          icon: icon,
          border: OutlineInputBorder(
              borderRadius:BorderRadius.all(Radius.circular(6.0))),
          labelText: labelText,
          hintText: hintText,
          labelStyle: TextStyle(color: Colors.green)
      ),
    );
  }
}
