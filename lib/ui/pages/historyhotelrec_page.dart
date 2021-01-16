part of 'pages.dart';

class HistoryHotelRecPage extends StatefulWidget {
  @override
  _HistoryHotelRecPageState createState() => _HistoryHotelRecPageState();
}

class _HistoryHotelRecPageState extends State<HistoryHotelRecPage> {
  User _auth = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hotel Recommendation History"),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: StreamBuilder<QuerySnapshot>(
              stream: HotelRecServices.hotelRecCollection.where("uid", isEqualTo: _auth.uid).snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("Failed to get budget management data!");
                }

                return ListView(
                  children: snapshot.data.docs.map((DocumentSnapshot doc) {
                    return HotelRecCard(
                      hotelRec: HotelsRec(doc.data()['id'], doc.data()['budget'],
                          doc.data()['city'], doc.data()['uid']),
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