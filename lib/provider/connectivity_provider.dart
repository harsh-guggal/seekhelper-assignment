import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityProvider extends ChangeNotifier {
  bool _isOnline = true;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _subscription;

  bool get isOnline => _isOnline;

  ConnectivityProvider() {
    _startMonitoring();
  }

  void _startMonitoring() async {
    _subscription = _connectivity.onConnectivityChanged.listen((results) async {
      final result = results.isNotEmpty ? results.first : ConnectivityResult.none;
      _isOnline = result != ConnectivityResult.none;
      notifyListeners();
    });

    final result = await _connectivity.checkConnectivity();
    _isOnline = result != ConnectivityResult.none;
    notifyListeners();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
