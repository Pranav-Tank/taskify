import 'package:local_auth/local_auth.dart';

class AuthService {
  final LocalAuthentication _auth = LocalAuthentication();

  Future<bool> authenticate() async {
    bool canCheckBiometrics = await _auth.canCheckBiometrics;
    if (!canCheckBiometrics) return false;

    return await _auth.authenticate(
      localizedReason: "Authenticate to access your tasks",
      options: const AuthenticationOptions(biometricOnly: true),
    );
  }
}
