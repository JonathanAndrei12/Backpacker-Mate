part of "pages.dart";

class BudgetManagementResult extends StatefulWidget {
  @override
  _BudgetManagementResultState createState() => _BudgetManagementResultState();
}

class _BudgetManagementResultState extends State<BudgetManagementResult> {
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
    );
  }
}
