part of 'pages.dart';

class HotelDetailsPage extends StatefulWidget {
  final Hotels hotel;
  HotelDetailsPage(this.hotel);

  @override
  _HotelDetailsPageState createState() => _HotelDetailsPageState(hotel);
}

class _HotelDetailsPageState extends State<HotelDetailsPage> {
  final Hotels hotel;
  _HotelDetailsPageState(this.hotel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: Text("Hotel Details"),
          ),
          body: Container(
            child: Column(
              children: [
                Flexible(
                    flex: 2,
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      hotel.photo1),
                                  fit: BoxFit.fill)),
                        ),
                      ],
                    )),
                Flexible(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        hotel.photo2),
                                    fit: BoxFit.fill)),
                            margin: EdgeInsets.only(left: 2.5, right: 2.5),
                            padding: EdgeInsets.all(0),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        hotel.photo3),
                                    fit: BoxFit.fill)),
                            margin: EdgeInsets.only(left: 2.5, right: 2.5),
                            padding: EdgeInsets.all(0),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        hotel.photo4),
                                    fit: BoxFit.fill)),
                            margin: EdgeInsets.only(left: 2.5, right: 2.5),
                            padding: EdgeInsets.all(0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                            flex: 10,
                            child: Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  margin: EdgeInsets.all(0),
                                  child: ListView(
                                    padding: EdgeInsets.all(0),
                                    children: <Widget>[
                                      Text(
                                        hotel.hotel_name,
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Icon(Icons.location_pin, color: Colors.blue,),
                                          SizedBox(width: 3),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(hotel.address, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                                              Text(hotel.city+", "+hotel.state, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Icon(Icons.star_rounded, color: Colors.yellow[700],),
                                          Text(hotel.star_rating, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Icon(Icons.message_rounded, color: Colors.grey[500],),
                                          Text(hotel.rating_average+" ("+hotel.number_of_reviews+")", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(NumberFormat.currency(
                                            locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                                              .format(double.tryParse(hotel.price)),
                                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                                          ),
                                          Text("  *After Discount", style: TextStyle(color: Colors.red[400]),)
                                        ],  
                                      ),
                                      SizedBox(height: 10),
                                      Text("Overview", textAlign: TextAlign.center, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                                      SizedBox(height: 10),
                                      Text(hotel.overview)
                                    ],
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      margin: EdgeInsets.all(10),
                                      child: RaisedButton(
                                        onPressed: _launchURL,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        textColor: Colors.black,
                                        padding: const EdgeInsets.all(0.0),
                                        child: Container(
                                          width: 110,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.blue,
                                            // gradient: LinearGradient(
                                            //     begin: Alignment.centerLeft,
                                            //     end: Alignment.centerRight,
                                            //     colors: <Color>[
                                            //       Colors.blue,
                                            //       Colors.white
                                            //     ]),
                                          ),
                                          padding: const EdgeInsets.all(10.0),
                                          child: const Text('Book Now',
                                              textAlign: TextAlign.center,),
                                        ),
                                      ),
                                    ))
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
    );
  }
  _launchURL() async {
    if (await canLaunch(hotel.url)) {
      await launch(hotel.url);
    } else {
      throw 'Could not launch websites';
    }
}
}