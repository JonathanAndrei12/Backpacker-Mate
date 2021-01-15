part of "pages.dart";

class HistoryBudgetPage extends StatefulWidget {
  @override
  _HistoryBudgetPageState createState() => _HistoryBudgetPageState();
}

class _HistoryBudgetPageState extends State<HistoryBudgetPage> {
  User _auth = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Budget Management List"),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: StreamBuilder<QuerySnapshot>(
              stream: BudgetServices.budgetCollection.where("uid", isEqualTo: _auth.uid).snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("Failed to get budget management data!");
                }

                return ListView(
                  children: snapshot.data.docs.map((DocumentSnapshot doc) {
                    return Budgetcard(
                      budget: Budgets(doc.data()['id'], doc.data()['name'],
                          doc.data()['total'], doc.data()['uid']),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
