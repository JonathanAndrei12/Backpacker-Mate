part of "pages.dart";

class HotelRecommendationPage extends StatefulWidget {
  @override
  _HotelRecommendationPageState createState() => _HotelRecommendationPageState();
}

class _HotelRecommendationPageState extends State<HotelRecommendationPage> {
  final _minimumPadding = 5.0;
  var _onItemSelected = 'Jakarta';
  var cities = ["Aceh", "Ambon", "Anyer", "Bali", "Balikpapan", "Bandar Lampung", "Bandung", "Bangka", "Banjarmasin", "Banten", "Banyuwangi", "Batam Island", "Berastagi", "Bintan Island", "Blitar", "Bogor", "Bukittinggi", "Cikarang", "Cirebon", "Irian Jaya / Papua", "Jakarta", "Jambi", "Kediri", "Kendari", "Ketapang", "Kupang", "Labuan Bajo", "Lombok", "Mabuun", "Magelang", "Makassar", "Malang", "Manado", "Medan", "Padang", "Palembang", "Palu", "Parapat", "Pekanbaru", "Pelabuhan Ratu", "Pontianak", "Puncak", "Samarinda", "Semarang", "Solo (Surakarta)", "Surabaya", "Tangerang", "Tarakan", "Trawas", "Yogyakarta"];

  
  // void initState() { 
  //   getHotelsCities();
  //   super.initState();
  // }

  // getHotelsCities(){
  //   hotelsRef.get().then((QuerySnapshot snapshot){
  //     snapshot.docs.forEach((DocumentSnapshot doc){
  //       allHotels.add(doc.data);
  //     });
  //   });
  //   var citiesCount = 0;
  //   var citiesCountWhile = 0;
  //   var whileBool = true;
  //   for(var i = 0; i < allHotels.length; i++){
  //     whileBool = true;
  //     if (cities.isEmpty){
  //       cities[citiesCount] = allHotels[i].city.toString();
  //       citiesCount++;
  //     }else{
  //       while(whileBool == true){
  //         if(citiesCountWhile == citiesCount - 1){
  //           if(allHotels[i].city.toString() == cities[citiesCountWhile]){
  //             citiesCountWhile = 0;
  //             whileBool = false;
  //           }else{
  //             cities[citiesCount] = allHotels[i].city.toString();
  //             citiesCountWhile = 0;
  //             citiesCount++;
  //             whileBool = false;
  //           }
  //         }else{
  //           if(allHotels[i].city.toString() == cities[citiesCountWhile]){
  //             citiesCountWhile++;
  //           }else{
  //             cities[citiesCount] = allHotels[i].city.toString();
  //             citiesCountWhile = 0;
  //             citiesCount++;
  //             whileBool = false;
  //           }
  //         }
  //       }
  //     }
  //   }
  //   citiesFix = cities;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Hotel Recommendation',
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),

      body: Container(
        margin: EdgeInsets.all(_minimumPadding * 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(height: 150),
            TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Input Bugdet',
                    hintText: '(Ex:2000000)',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
            ),
            DropdownButton<String>(
              items: cities.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              value: _onItemSelected,
              onChanged: (String newValueSelected) {
                _onDropDownItemSelected(newValueSelected);
              },
            ),
            RaisedButton(
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("Add Hotel"),
                onPressed: () {},
                shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0),
                ),
            ),  
            SizedBox(height: 150),      
          ],
        ),
      ),
    );
  }
 
  // Widget getImageAsset() {
    // AssetImage assetImage = AssetImage('images/hotel.png');
    // Image image = Image(
    //   image: assetImage,
    //   width: 125.0,
    //   height: 125.0,
    // );
 
    // return Container(
    //   child: image,
    //   margin: EdgeInsets.all(_minimumPadding * 10),
    // );

  //   return Container(
  //     width: 125.0,
  //     height: 125.0,
  //     margin: EdgeInsets.all(_minimumPadding * 10),
  //     decoration: BoxDecoration(
  //       image: DecorationImage(
  //         image: AssetImage("assets/images/hotel.png"),
  //       )
  //     ),
  //   );
  // }

  void _onDropDownItemSelected(newValueSelected) {
    setState(() {
      this._onItemSelected = newValueSelected;
    });
  }
}