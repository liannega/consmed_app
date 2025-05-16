import 'package:consmed_app/data/datasources/api.dart';
import 'package:consmed_app/domain/repositories/remote_repository.dart';
import 'package:riverpod/riverpod.dart';

final apiProvider = Provider<RemoteRepository>((ref) => ApiConsumer());