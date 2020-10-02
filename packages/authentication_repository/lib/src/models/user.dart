import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class User extends Equatable {

  const User({
    @required this.email,
    @required this.id,
    @required this.name,
    @required this.photo,
  }) : assert(email != null),
       assert(id != null);

  final String email;

  final String id;

  final String name;

  /// Profile pic url
  final String photo;

  static const empty = User(email: '', id: '', name: null, photo: null);

  @override
  List<Object> get props => [email, id, name, photo];
}