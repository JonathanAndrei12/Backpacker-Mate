part of "pages.dart";

class HotelRecommendationPage extends StatefulWidget {
  @override
  _HotelRecommendationPageState createState() => _HotelRecommendationPageState();
}

class _HotelRecommendationPageState extends State<HotelRecommendationPage> {
  final _minimumPadding = 5.0;
  var _onItemSelected = 'Select Your Destination';
  var hotelsRef = FirebaseFirestore.instance.collection("hoteldata");
  final ctrlBudget = TextEditingController();
  User _auth = FirebaseAuth.instance.currentUser;
  var cities = ["Select Your Destination", "Aceh", "Ambon", "Anyer", "Bali", "Balikpapan", "Bandar Lampung", "Bandung", "Bangka", "Banjarmasin", "Banten", "Banyuwangi", "Batam Island", "Berastagi", "Bintan Island", "Blitar", "Bogor", "Bukittinggi", "Cikarang", "Cirebon", "Irian Jaya / Papua", "Jakarta", "Jambi", "Kediri", "Kendari", "Ketapang", "Kupang", "Labuan Bajo", "Lombok", "Mabuun", "Magelang", "Makassar", "Malang", "Manado", "Medan", "Padang", "Palembang", "Palu", "Parapat", "Pekanbaru", "Pelabuhan Ratu", "Pontianak", "Puncak", "Samarinda", "Semarang", "Solo (Surakarta)", "Surabaya", "Tangerang", "Tarakan", "Trawas"];

  @override
  void dispose() {
    ctrlBudget.dispose();
    super.dispose();
  }

  void clearForm() {
    ctrlBudget.clear();
    _onItemSelected = 'Select Your Destination';
  }

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
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: 150),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: ctrlBudget,
                  decoration: InputDecoration(
                    labelText: 'Input Bugdet',
                    hintText: '(Ex:2000000)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))
                  ),
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
                  onPressed: () async {
                    if (ctrlBudget.text == "" || _onItemSelected == "Select Your Destination") {
                      Fluttertoast.showToast(
                        msg: "Please Fill All Field!",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 20.0,
                      );
                    } else {
                      HotelsRec hotelRec = HotelsRec("", ctrlBudget.text, _onItemSelected, _auth.uid);
                      bool result = await HotelRecServices.addHotelRec(hotelRec);
                      if (result == true) {
                        Fluttertoast.showToast(
                          msg: "Add Budget Success",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 20.0,
                        );
                        clearForm();
                      } else {
                        Fluttertoast.showToast(
                          msg: "Failed! Try Again",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 20.0,
                        );
                      }
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return HistoryHotelRecPage();
                        })
                      );
                    }
                  },
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                ),  
                SizedBox(height: 150),      
              ],
            ),
          ],
        )
      ),
    );
  }

  void _onDropDownItemSelected(newValueSelected) {
    setState(() {
      this._onItemSelected = newValueSelected;
    });
  }
}