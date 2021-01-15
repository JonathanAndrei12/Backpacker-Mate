part of 'models.dart';

class Budgets extends Equatable {
  final String id;
  final String name;
  final String total;
  final String uid;

  Budgets(this.id, this.name, this.total, this.uid);
  @override
  List<Object> get props => [id, name, total, uid];
}
