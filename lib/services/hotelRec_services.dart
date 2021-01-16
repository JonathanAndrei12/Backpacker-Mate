part of 'services.dart';

class HotelRecServices {
  //setup cloud firestroe
  static CollectionReference hotelRecCollection =
      FirebaseFirestore.instance.collection("hotelrec");
  static DocumentReference hotelRecDoc;

  //setup firestore storage
  static Reference ref;
  static UploadTask uploadTask;

  static String imgUrl;

  static Future<bool> addHotelRec(HotelsRec hotelsRec) async {
    await Firebase.initializeApp();

    hotelRecDoc = await hotelRecCollection
        .add({'id': "", 'budget': hotelsRec.budget, 'city': hotelsRec.city, 'uid': hotelsRec.uid});

    if (hotelRecDoc.id != null) {
      ref = FirebaseStorage.instance.ref();

      hotelRecCollection.doc(hotelRecDoc.id).update({'id': hotelRecDoc.id});
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

  static Future<bool> deleteHotelRec(hotelrecid) async {
    if (hotelrecid != "") {
      DocumentReference p =  FirebaseFirestore.instance.collection("hotelrec").doc(hotelrecid);
      p.delete();
      return true;
    } else {
      return false;
    }
  }
}
