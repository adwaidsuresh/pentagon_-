import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pentagon_1/api/api_service.dart';

final apiserviceProvider = Provider<Apiservic>((ref) {
  return Apiservic();
});

final getpostProvider = FutureProvider((ref) async {
  return ref.read(apiserviceProvider).getpost();
});

