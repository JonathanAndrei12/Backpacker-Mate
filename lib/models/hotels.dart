part of 'models.dart';

class Hotels extends Equatable {
  final String hotel_id;
  final String hotel_name;
  final String address;
  final String city;
  final String state;
  final String star_rating;
  final String url;
  final String photo1;
  final String photo2;
  final String photo3;
  final String photo4;
  final String photo5;
  final String overview;
  final String number_of_reviews;
  final String rating_average;
  final String price;

  Hotels(this.hotel_id, this.hotel_name, this.address, this.city, this.state, this.star_rating, this.url, this.photo1, this.photo2, this.photo3, this.photo4, this.photo5, this.overview, this.number_of_reviews, this.rating_average, this.price);
  @override
  List<Object> get props => [hotel_id, hotel_name, address, city, state, star_rating, url, photo1, photo2, photo3, photo4, photo5, overview, number_of_reviews, rating_average, price];
}