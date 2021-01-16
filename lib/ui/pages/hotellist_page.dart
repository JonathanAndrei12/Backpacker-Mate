part of 'pages.dart';

class HotelListPage extends StatefulWidget {
  final HotelsRec hotelRec;
  HotelListPage(this.hotelRec);

  @override
  _HotelListPageState createState() => _HotelListPageState(hotelRec);
}

  

class _HotelListPageState extends State<HotelListPage> {
  final HotelsRec hotelRec;
  _HotelListPageState(this.hotelRec);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hotel Recommendation List"),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("hoteldata")
              .where("city",isEqualTo: hotelRec.city)
              // .where("price", isLessThanOrEqualTo: double.parse(hotelRec.budget))
              .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return ListView(
                  children: snapshot.data.docs.map((DocumentSnapshot doc) {
                    // if(double.parse(doc.data()['price']) <= double.parse(hotelRec.budget)){
                      return HotelCard(
                        // if(double.parse(doc.data()['price']) <= double.parse(hotelRec.budget)){
                        hotel: Hotels(doc.data()['hotel_id'], doc.data()['hotel_name'], doc.data()['address'], doc.data()['city'], doc.data()['state'], doc.data()['star_rating'], doc.data()['url'], doc.data()['photo1'], doc.data()['photo2'], doc.data()['photo3'], doc.data()['photo4'], doc.data()['photo5'], doc.data()['overview'], doc.data()['number_of_reviews'], doc.data()['rating_average'], doc.data()['price']),
                        // }
                        budget: double.parse(hotelRec.budget)
                      );
                    // }
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