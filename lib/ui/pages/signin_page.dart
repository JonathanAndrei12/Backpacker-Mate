part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final ctrlEmail = TextEditingController();
  final ctrlPassword = TextEditingController();

  @override
  void dispose() {
    ctrlPassword.dispose();
    ctrlEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
          color: Colors.white,
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(10, 170, 10, 200),
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign In",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Arial",
                          fontSize: 30),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: ctrlEmail,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: "Email",
                          hintText: "Your Email",
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      obscureText: true,
                      controller: ctrlPassword,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key),
                          labelText: "Password",
                          hintText: "Your Password",),
                    ),
                    SizedBox(height: 10),
                    Container(
                      alignment: Alignment(0, 0),
                      child: RaisedButton.icon(
                        icon: Icon(Icons.cloud_upload),
                        label: Text("Sign Up"),
                        textColor: Colors.white,
                        color: Colors.blue,
                        onPressed: () async {
                          if (ctrlEmail.text == "" || ctrlPassword.text == "") {
                            Fluttertoast.showToast(
                              msg: "Please fill all fields!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16,
                            );
                          } else {
                            String result = await AuthServices.signIn(
                                ctrlEmail.text, ctrlPassword.text);
                            if (result == "success") {
                              Fluttertoast.showToast(
                                msg: "Success",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16,
                              );
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return MainMenu();
                              }));
                            } else {
                              Fluttertoast.showToast(
                                msg: result,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16,
                              );
                            }
                          }
                        }
                      ),
                    ),
                    Container(
                      alignment: Alignment(0, 0),
                      child: RichText(
                        text: TextSpan(
                          text: "Not registered yet? Sign up.",
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return SignUpPages();
                            }));
                          }
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
