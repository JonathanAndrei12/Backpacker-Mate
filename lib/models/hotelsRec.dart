part of 'models.dart';

class HotelsRec extends Equatable {
  final String id;
  final String budget;
  final String city;
  final String uid;

  HotelsRec(this.id, this.budget, this.city, this.uid);
  @override
  List<Object> get props => [id, budget, city, uid];
}
