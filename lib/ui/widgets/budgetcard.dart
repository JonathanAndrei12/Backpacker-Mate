import 'package:backpacker_mate/models/models.dart';
import 'package:backpacker_mate/ui/pages/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Budgetcard extends StatelessWidget {
  final Budgets budget;
  Budgetcard({this.budget});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(10),
        child: ListTile(
          contentPadding: EdgeInsets.all(8),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return BudgetManagementResult(budget: budget);
                  },
                  settings: RouteSettings(arguments: budget),
                ));
          },
          title: Text(budget.name, style: TextStyle(fontSize: 20)),
          subtitle: Text(NumberFormat.currency(
                  locale: 'id', symbol: 'Rp ', decimalDigits: 0)
              .format(double.tryParse(budget.total))),

          //isThreeLine: true,
          trailing: Icon(Icons.remove_red_eye),
        ));
  }
}
