part of 'widgets.dart';

class HotelCard extends StatelessWidget {
  final Hotels hotel;
  var budget;
  HotelCard({this.hotel, this.budget});

  @override
  Widget build(BuildContext context) {
    if(double.parse(hotel.price) <= budget){
      return GestureDetector(
        onTap: (){
          Navigator.push(context, 
            MaterialPageRoute(builder: (context){
              return HotelDetailsPage(hotel);
          }));
        },
        child: Container(
          margin: EdgeInsets.all(10),
          height: 300,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 2.0,
                spreadRadius: 0.0,
                offset: Offset(2.0, 2.0)
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height : 150,
                margin: EdgeInsets.fromLTRB(0,0,0,5),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(hotel.photo1),   
                    fit: BoxFit.fill
                  )
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ListView(
                      // scrollDirection: Axis.horizontal,
                      Text(hotel.hotel_name,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    // ),
                    Row(
                      children: [
                        Icon(Icons.location_pin, color: Colors.blue,),
                        Text(hotel.city+", "+hotel.state, style: TextStyle(fontSize: 17),)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.star_rounded, color: Colors.yellow[700],),
                        Text(hotel.star_rating, style: TextStyle(fontSize: 17),)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.message_rounded, color: Colors.grey[500],),
                        Text(hotel.rating_average+" ("+hotel.number_of_reviews+")", style: TextStyle(fontSize: 17),)
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(NumberFormat.currency(
                          locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                            .format(double.tryParse(hotel.price)),
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text("  *After Discount", style: TextStyle(color: Colors.red[400]),)
                      ],  
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }else{
      return Container();
    }
    
    
      

  }
}