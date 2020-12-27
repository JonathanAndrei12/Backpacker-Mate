part of "pages.dart";

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool isLoading = false;
  User _auth = FirebaseAuth.instance.currentUser;
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  String img, name, email;

  PickedFile imageFile;
  final ImagePicker imagePicker = ImagePicker();

  Future chooseImage() async {
    final selectedImage = await imagePicker.getImage(
        source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      imageFile = selectedImage;
    });
  }

  void getUserUpdate() async {
    userCollection.doc(_auth.uid).snapshots().listen((event) {
      img = event.data()['profilePicture'];
      name = event.data()['name'];
      email = event.data()['email'];
      if (img == "") {
        img = null;
      }
      setState(() {});
    });
  }

  void initState() {
    getUserUpdate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
        actions: [
          CircleAvatar(
            radius: 27,
            backgroundImage: NetworkImage(
              img ??
                "https://firebasestorage.googleapis.com/v0/b/backpacker-mate.appspot.com/o/default%2Flogo.png?alt=media&token=4884ad3d-6466-4231-ad81-f6022290041a",
            ),
          )
        ],
      ),
      body: Stack(children: [
        Container(
          padding: EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Expanded(
                child: Card(
                  elevation: 2,
                  margin: EdgeInsets.all(18),
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        CircleAvatar(
                          radius: 102,
                          backgroundColor: Colors.blue,
                          child: CircleAvatar(
                            radius: 100,
                            backgroundImage: NetworkImage(
                              img ??
                              "https://firebasestorage.googleapis.com/v0/b/backpacker-mate.appspot.com/o/default%2Flogo.png?alt=media&token=4884ad3d-6466-4231-ad81-f6022290041a",
                            ),
                          )
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RaisedButton.icon(
                          color: Colors.blue,
                          textColor: Colors.white,
                          padding: EdgeInsets.all(8),
                          icon: Icon(Icons.image),
                          label: Text('Edit Photo'),
                          onPressed: () async {
                            await chooseImage();
                            await UserServices.updateProfilePicture(
                                    _auth.uid, imageFile)
                                .then((value) {
                              if (value) {
                                Fluttertoast.showToast(
                                  msg: "Update profile picture succesfull!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                              } else {
                                Fluttertoast.showToast(
                                  msg: "Failed",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                              }
                            });
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          name ?? '',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          email ?? '',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Signout Confirmation"),
                            content: Text("Are you sure to signout?"),
                            actions: [
                              FlatButton(
                                onPressed: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  await AuthServices.signOut().then((value) {
                                    if (value) {
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                        return SignMenu();
                                      }));
                                      setState(() {
                                        isLoading = false;
                                      });
                                    } else {
                                      setState(() {
                                        isLoading = false;
                                      });
                                    }
                                  });
                                },
                                child: Text("Yes"),
                              ),
                              FlatButton(
                                child: Text("No"),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          );
                        });
                  },
                  padding: EdgeInsets.all(12),
                  textColor: Colors.white,
                  color: Colors.redAccent,
                  child: Text("Signout"),
                ),
              ),
            ],
          ),
        ),
        isLoading == true
            ? Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.transparent,
                child: SpinKitFadingCircle(
                  size: 50,
                  color: Colors.blue,
                ),
              )
            : Container()
      ]),
    );
  }
}
