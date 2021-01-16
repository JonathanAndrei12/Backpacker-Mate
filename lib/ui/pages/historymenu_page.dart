part of "pages.dart";

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text(""),
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
                                  child: Text("Budget Management History",
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
                                    return HistoryBudgetPage();
                                  }));
                                },
                              ),
                              SizedBox(height: 20),
                              RaisedButton(
                                padding: EdgeInsets.all(15),
                                child: Container(
                                  width: 100,
                                  child: Text("Hotel Recommendation History",
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
                                    return HistoryHotelRecPage();
                                  }));
                                },
                              ),
                              SizedBox(height: 10),
                              RichText(
                                text: TextSpan(
                                  text: "Enjoy Plan your trip with us",
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
