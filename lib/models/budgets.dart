part of 'models.dart';

class Budgets extends Equatable {
  final String id;
  final String name;
  final String total;

  Budgets(this.id, this.name, this.total);
  @override
  List<Object> get props => [id, name, total];
}
