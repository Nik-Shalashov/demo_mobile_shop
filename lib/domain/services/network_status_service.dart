abstract class NetworkStatusService {
  Future<bool> get isOnline;

  Stream<bool> get onStatusChanged;
}