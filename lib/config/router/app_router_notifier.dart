import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoy_no_circulas/features/auth/presentation/providers/auth_provider.dart';

import '../../features/main/presentation/providers/providers.dart';

final goRouterNotifierProvider = Provider((ref) {
  final authNotifier = ref.read(authProvider.notifier);

  final gpsNotifier = ref.read(gpsProvider.notifier);
  return GoRouterNotifier(authNotifier, gpsNotifier);
});

class GoRouterNotifier extends ChangeNotifier {
  final AuthNotifier _authNotifier;
  final GpsNotifier _gpsNotifier;

  AuthStatus _authStatus = AuthStatus.checking;
  bool _isAllGrantedStatus = false;
  bool _isGpsEnabled = false;
  bool _isGpsPermissionGranted = false;

  GoRouterNotifier(this._authNotifier, this._gpsNotifier) {
    // escuchar los cambios del notifier
    _authNotifier.addListener((state) {
      authStatus = state.authStatus;
    });

    _gpsNotifier.addListener((state) {
      isAllGrantedStatus = state.isAllGranted;
    });

    _gpsNotifier.addListener((state) {
      isGpsEnabled = state.isGpsEnabled;
    });

    _gpsNotifier.addListener((state) {
      isGpsPermissionGranted = state.isGpsPermissionGranted;
    });

    _gpsNotifier.addListener((state) {
      isAllGrantedStatus = state.isAllGranted;
    });
  }

  set authStatus(AuthStatus value) {
    _authStatus = value;
    notifyListeners();
  }

  set isAllGrantedStatus(bool value) {
    _isAllGrantedStatus = value;
    notifyListeners();
  }

  set isGpsEnabled(bool value) {
    _isGpsEnabled = value;
    notifyListeners();
  }

  set isGpsPermissionGranted(bool value) {
    _isGpsPermissionGranted = value;
    notifyListeners();
  }

  AuthStatus get authStatus => _authStatus;
  bool get isAllGrantedStatus => _isAllGrantedStatus;
  bool get isGpsEnabled => _isGpsEnabled;
  bool get isGpsPermissionGranted => _isGpsPermissionGranted;
}
