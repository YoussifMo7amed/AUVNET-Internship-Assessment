import 'package:equatable/equatable.dart';

// Define the event classes
abstract class GetProductsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class StartedEvent extends GetProductsEvent {}

class FetchProductsEvent extends GetProductsEvent {}
