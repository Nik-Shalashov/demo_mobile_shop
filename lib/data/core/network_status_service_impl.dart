import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:demo_mobile_shop/domain/services/network_status_service.dart';

class NetworkStatusServiceImpl implements NetworkStatusService {
  final Connectivity _connectivity;

  NetworkStatusServiceImpl({Connectivity? connectivity})
      : _connectivity = connectivity ?? Connectivity();

  @override
  Future<bool> get isOnline async {
    final results = await _connectivity.checkConnectivity();
    return _hasConnection(results);
  }

  @override
  Stream<bool> get onStatusChanged {
    return _connectivity.onConnectivityChanged
        .map(_hasConnection)
        .distinct();
  }

  bool _hasConnection(List<ConnectivityResult> results) {
    return results.any((result) => result != ConnectivityResult.none);
  }
}