part of 'pages.dart';

class SignMenu extends StatefulWidget {
  @override
  _SignMenuState createState() => _SignMenuState();
}

class _SignMenuState extends State<SignMenu> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text(" "),
            backgroundColor: Colors.blue,
          ),
          body: Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 100),
                    Flexible(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("assets/images/logo.png"),
                        )),
                      ),
                    ),
                    Flexible(
                        flex: 3,
                        child: Center(
                          child: Column(
                            children: [
                              RaisedButton(
                                padding: EdgeInsets.all(15),
                                child: Container(
                                  width: 100,
                                  child: Text("Sign In",
                                      textAlign: TextAlign.center),
                                ),
                                textColor: Colors.white,
                                color: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return SignInPage();
                                  }));
                                },
                              ),
                              SizedBox(height: 20),
                              RaisedButton(
                                padding: EdgeInsets.all(15),
                                child: Container(
                                  width: 100,
                                  child: Text("Sign Up",
                                      textAlign: TextAlign.center),
                                ),
                                textColor: Colors.white,
                                color: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return SignUpPages();
                                  }));
                                },
                              ),
                              SizedBox(height: 10),
                              RichText(
                                text: TextSpan(
                                  text:
                                      "By joining with us, you will agree with our General Terms of Use",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 11),
                                ),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              )),
        ));
  }
}
