part of "pages.dart";

class BudgetManagementResult extends StatefulWidget {
  Budgets budget;
  BudgetManagementResult({Key key, this.budget}) : super(key: key);
  @override
  _BudgetManagementResultState createState() => _BudgetManagementResultState();
}

class _BudgetManagementResultState extends State<BudgetManagementResult> {
  bool isLoading = false;
  CollectionReference productCollection =
      FirebaseFirestore.instance.collection("budgets");

  @override
  Widget build(BuildContext context) {
    final String uang = "${widget.budget.total}";
    final total1 = double.parse(uang);
    final double makan = total1 * 0.40;
    final double transport = total1 * 0.20;
    final double kesehatan = total1 * 0.15;
    final double oleh = total1 * 0.15;
    final double urgent = total1 * 0.10;
    String makan1 = makan.toStringAsFixed(2);
    String transport1 = transport.toStringAsFixed(2);
    String kesehatan1 = kesehatan.toStringAsFixed(2);
    String oleh1 = oleh.toStringAsFixed(2);
    String urgent1 = urgent.toStringAsFixed(2);

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
                          "${widget.budget.name}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Arial",
                              fontSize: 35),
                        ),
                        SizedBox(height: 35),
                        Text(
                          "Budget Makan           :   " +
                              NumberFormat.currency(
                                      locale: 'id',
                                      symbol: 'Rp',
                                      decimalDigits: 0)
                                  .format(double.tryParse(makan1)),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Arial",
                              fontSize: 20),
                        ),
                        SizedBox(height: 35),
                        Text(
                          "Budget Transport     :   " +
                              NumberFormat.currency(
                                      locale: 'id',
                                      symbol: 'Rp',
                                      decimalDigits: 0)
                                  .format(double.tryParse(transport1)),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Arial",
                              fontSize: 20),
                        ),
                        SizedBox(height: 35),
                        Text(
                          "Budget Kesehatan    :   " +
                              NumberFormat.currency(
                                      locale: 'id',
                                      symbol: 'Rp',
                                      decimalDigits: 0)
                                  .format(double.tryParse(kesehatan1)),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Arial",
                              fontSize: 20),
                        ),
                        SizedBox(height: 35),
                        Text(
                          "Budget Oleh-oleh     :   " +
                              NumberFormat.currency(
                                      locale: 'id',
                                      symbol: 'Rp',
                                      decimalDigits: 0)
                                  .format(double.tryParse(oleh1)),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Arial",
                              fontSize: 20),
                        ),
                        SizedBox(height: 35),
                        Text(
                          "Budget Urgent           :   " +
                              NumberFormat.currency(
                                      locale: 'id',
                                      symbol: 'Rp',
                                      decimalDigits: 0)
                                  .format(double.tryParse(urgent1)),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Arial",
                              fontSize: 20),
                        ),
                        SizedBox(height: 20),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: RaisedButton(
                                elevation: 5,
                                padding: EdgeInsets.all(15),
                                child: Container(
                                  width: 100,
                                  child: Text("Delete",
                                      textAlign: TextAlign.center),
                                ),
                                textColor: Colors.white,
                                color: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                onPressed: () async {
                                  showAlertDialog(context);
                                }))
                      ])),
            ],
          )),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed: () async {
        bool result = await BudgetServices.deleteProduct("${widget.budget.id}");
        if (result == true) {
          Fluttertoast.showToast(
            msg: "Delete Products Success",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 20.0,
          );
          setState(() {
            isLoading = false;
          });
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HistoryBudgetPage();
          }));
        } else {
          Fluttertoast.showToast(
            msg: "Failed! Try Again",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 20.0,
          );
          setState(() {
            isLoading = false;
          });
        }
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete Confirmation"),
      content: Text("Are you sure to delete " + "${widget.budget.name}"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
