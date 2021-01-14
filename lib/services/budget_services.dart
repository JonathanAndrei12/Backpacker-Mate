part of 'services.dart';

class BudgetServices {
  //setup cloud firestroe
  static CollectionReference budgetCollection =
      FirebaseFirestore.instance.collection("budgets");
  static DocumentReference budgetDoc;

  //setup firestore storage
  static Reference ref;
  static UploadTask uploadTask;

  static String imgUrl;

  static Future<bool> addBudget(Budgets budget) async {
    await Firebase.initializeApp();

    budgetDoc = await budgetCollection
        .add({'id': "", 'name': budget.name, 'total': budget.total});

    if (budgetDoc.id != null) {
      ref = FirebaseStorage.instance.ref();

      budgetCollection.doc(budgetDoc.id).update({'id': budgetDoc.id});
      return true;
    } else {
      return false;
    }
  }

  //static Future<bool> editProduct(name, price, productid) async {
  // if (name != "" && price != "" && productid != "") {
  //   DocumentReference p =
  //      FirebaseFirestore.instance.collection("products").doc(productid);
  // p.update({
  //    'name': name,
  //    'price': price,
  // });
  // return true;
  // } else {
  //   return false;
  // }
  // }

  static Future<bool> deleteProduct(budgetid) async {
    if (budgetid != "") {
      DocumentReference p =
          FirebaseFirestore.instance.collection("budgets").doc(budgetid);
      p.delete();
      return true;
    } else {
      return false;
    }
  }
}
