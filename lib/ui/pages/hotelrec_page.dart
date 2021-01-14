part of "pages.dart";

class HotelRecommendationPage extends StatefulWidget {
  @override
  _HotelRecommendationPageState createState() =>
      _HotelRecommendationPageState();
}

class _HotelRecommendationPageState extends State<HotelRecommendationPage> {
 var _currencies = ['Jawa Timur', 'Jawa Barat', 'Jawa Tengah'];
  final _minimumPadding = 5.0;
  var _currentItemSelected = 'Jawa Timur';

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
            
            Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'City',
                          hintText: 'Surabaya',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),

                  Container(
                    width: _minimumPadding * 5,
                  ),
                  
                  Expanded(
                    child: DropdownButton<String>(
                      items: _currencies.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: _currentItemSelected,
                      onChanged: (String newValueSelected) {
                        _onDropDownItemSelected(newValueSelected);
                      },
                    ),
                  ),
                ],
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
 
  Widget getImageAsset() {
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

    return Container(
      width: 125.0,
      height: 125.0,
      margin: EdgeInsets.all(_minimumPadding * 10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/hotel.png"),
        )
      ),
    );
  }

  void _onDropDownItemSelected(newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }
}