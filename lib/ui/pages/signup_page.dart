part of 'pages.dart';

class SignUpPages extends StatefulWidget {
  @override
  _SignUpPagesState createState() => _SignUpPagesState();
}

class _SignUpPagesState extends State<SignUpPages> {
  final ctrlPassword2 = TextEditingController();
  final ctrlEmail = TextEditingController();
  final ctrlPassword = TextEditingController();
  final ctrlName = TextEditingController();

  @override
  void dispose() {
    ctrlPassword.dispose();
    ctrlEmail.dispose();
    ctrlPassword2.dispose();
    ctrlName.dispose();
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
                margin: EdgeInsets.fromLTRB(10, 120, 10, 150),
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Arial",
                          fontSize: 30),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: ctrlName,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_circle),
                          labelText: "Full Name",
                          hintText: "Your full name",
                      ),
                    ),
                    SizedBox(height: 10),
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
                          hintText: "Your Password",
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      obscureText: true,
                      controller: ctrlPassword2,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key),
                          labelText: "Re-Type Password",
                          hintText: "Re-Type Your Password",
                      ),
                    ),
                    SizedBox(height: 10),
                    RaisedButton.icon(
                        icon: Icon(Icons.cloud_upload),
                        label: Text("Sign Up"),
                        textColor: Colors.white,
                        color: Colors.blue,
                        onPressed: () async {
                          if (ctrlEmail.text == "" ||
                              ctrlPassword.text == "" ||
                              ctrlPassword2.text == "" ||
                              ctrlName.text == "") {
                            Fluttertoast.showToast(
                              msg: "Please fill all fields!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16,
                            );
                          } else if (ctrlPassword.text != ctrlPassword2.text) {
                            Fluttertoast.showToast(
                              msg: "Please re-type your password correctly",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16,
                            );
                          } else if (ctrlPassword.text.length < 6 || ctrlPassword2.text.length < 6){
                            Fluttertoast.showToast(
                              msg: "Password at least have 6 characters minimum",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16,
                            );
                          } else {
                            String result = await AuthServices.signUp(
                                ctrlEmail.text,
                                ctrlPassword.text,
                                ctrlName.text);
                            if (result == 'success') {
                              Fluttertoast.showToast(
                                msg: "Success",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16,
                              );
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
                        }),
                    RichText(
                      text: TextSpan(
                          text: "Already registered? Sign in.",
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return SignInPage();
                              }));
                            }),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
