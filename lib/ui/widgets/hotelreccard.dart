part of 'widgets.dart';

class HotelRecCard extends StatelessWidget {
  final HotelsRec hotelRec;
  HotelRecCard({this.hotelRec});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        contentPadding: EdgeInsets.all(8),
        onTap: () {
          Navigator.push(context, 
            MaterialPageRoute(builder: (context){
              HotelsRec hotelRecFix = HotelsRec(hotelRec.id.toString(), hotelRec.budget.toString(), hotelRec.city.toString(), hotelRec.uid.toString());
              return HotelListPage(hotelRecFix);
          }));
        },
        title: Text(hotelRec.city, style: TextStyle(fontSize: 20)),
        subtitle: Text(NumberFormat.currency(
          locale: 'id', symbol: 'Rp ', decimalDigits: 0)
        .format(double.tryParse(hotelRec.budget.toString()))),
        leading: Icon(Icons.remove_red_eye),
        //isThreeLine: true,
        trailing: IconButton(
          icon: Icon(Icons.delete_rounded),
          onPressed: () async {
            bool result = await HotelRecServices.deleteHotelRec("${hotelRec.id}");
            if (result == true) {
              Fluttertoast.showToast(
                msg: "Delete Products Success",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 20.0,
              );
              // setState(() {
              //   isLoading = false;
              // });
            } else {
              Fluttertoast.showToast(
                msg: "Failed! Try Again",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 20.0,
              );
              // setState(() {
              //   isLoading = false;
              // });
            }
          },
        ),
      )
    );
  }
}