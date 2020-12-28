part of "pages.dart";

class BudgetManagementPage extends StatefulWidget {
  @override
  _BudgetManagementPageState createState() => _BudgetManagementPageState();
}

class _BudgetManagementPageState extends State<BudgetManagementPage> {
  final ctrlBudgetName = TextEditingController();
  final ctrlBudgetAmount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Budget Management',
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
          color: Colors.white,
          child: ListView(
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(10, 20, 10, 150),
                  color: Colors.transparent,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Align(
                          alignment: Alignment
                              .center, // Align however you like (i.e .centerRight, centerLeft)
                          child: Icon(
                            Icons.attach_money,
                            color: Colors.blueAccent,
                            size: 120.0,
                          ),
                        ),
                        SizedBox(height: 50),
                        Text(
                          "Budget Name",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Arial",
                              fontSize: 20),
                        ),
                        SizedBox(height: 1),
                        TextFormField(
                          controller: ctrlBudgetName,
                          decoration: InputDecoration(
                            //KALO MAU ICON PASANG DISINI
                            hintText: "(Ex: Budget Malang)",
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Budget",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Arial",
                              fontSize: 20),
                        ),
                        SizedBox(height: 1),
                        TextFormField(
                          controller: ctrlBudgetAmount,
                          decoration: InputDecoration(
                            //KALO MAU ICON PASANG DISINI
                            hintText: "(Ex:2000000)",
                          ),
                        ),
                        SizedBox(height: 80),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: RaisedButton(
                              elevation: 5,
                              padding: EdgeInsets.all(15),
                              child: Container(
                                width: 100,
                                child:
                                    Text("Submit", textAlign: TextAlign.center),
                              ),
                              textColor: Colors.white,
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return BudgetManagementResult();
                                }));
                              },
                            ))
                      ]))
            ],
          )),
    );
  }
}
