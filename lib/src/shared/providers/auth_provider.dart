// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../exceptions/_export_exceptions.dart';
import '../repositories/_export_repositories.dart';
import '../utils/constants.dart';

class AuthProvider with ChangeNotifier {
  String? _uid;
  String? _token;
  String? _email;
  // DateTime? _expiryDate;
  Timer? _logoutTimer;

  bool get isAuth {
    // ignore: no_leading_underscores_for_local_identifiers
    // final _isValid = _expiryDate?.isAfter(DateTime.now()) ?? false;
    return _token != null;
  }

  String? get token {
    return isAuth ? _token : null;
  }

  String? get email {
    return isAuth ? _email : null;
  }

  String? get uid {
    return isAuth ? _uid : null;
  }

  Future<void> _authenticate(
      String email, String password, String urlFragment) async {
    final url = '${Constants.authBaseUrl}$urlFragment';
    print('Entrei _authenticate');
    print(url);

    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    final body = jsonDecode(response.body);

    if (body['error'] != null) {
      throw AuthException(body['error']['message']);
    } else {
      const url2 = '${Constants.authBaseUrl}me';

      _token = body['access_token'];

      final response2 = await http.get(
        Uri.parse(url2),
        headers: {'authorization': "Bearer $_token "},
      );

      final body2 = jsonDecode(response2.body);

      if (body2['error'] != null) {
        throw AuthException(body2['error']['message']);
      } else {
        _uid = body2['id'].toString();
        _email = body2['email'];

        // _expiryDate = DateTime.now().add(
        //   Duration(seconds: int.parse(body['expiresIn'])),
        // );

        SPRepository.saveMap(
          'userData',
          {
            'uid': _uid,
            'token': _token,
            'email': _email,
            // 'expiryDate': _expiryDate!.toIso8601String(),
          },
        );

        // _autoLogout();
        notifyListeners();
      }
    }
  }

  Future<void> singIn(String email, String password) async {
    print('Entrei singIn');
    return _authenticate(email, password, 'auth');
  }

  Future<void> singUp(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> tryAutoLogin() async {
    if (isAuth) return;

    final userData = await SPRepository.getMap('userData');
    if (userData.isEmpty) return;

    // final expiryDate = DateTime.parse(userData['expiryDate']);
    // if (expiryDate.isBefore(DateTime.now())) return;

    _token = userData['token'];
    _email = userData['email'];
    _uid = userData['uid'];
    // _expiryDate = expiryDate;

    // _autoLogout();
    notifyListeners();
  }

  void logout() {
    _token = null;
    _email = null;
    _uid = null;
    // _expiryDate = null;

    _clearLogoutTimer();
    SPRepository.remove('userData').then((_) => notifyListeners());
  }

  void _clearLogoutTimer() {
    _logoutTimer?.cancel();
    _logoutTimer = null;
  }

  // void _autoLogout() {
  //   _clearLogoutTimer();
  //   final timeToLogout = _expiryDate?.difference(DateTime.now()).inSeconds;
  //   _logoutTimer = Timer(Duration(seconds: timeToLogout ?? 0), logout);
  // }
}
