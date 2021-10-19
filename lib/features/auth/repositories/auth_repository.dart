/// Repository contract which manages user authentication.
abstract class AuthRepository {
  Future<void> signUp(
      {required String name, required String email, required String password});
  Future<void> logInWithEmailAndPassword(
      {required String email, required String password});
  Future<void> logInWithGoogle();
  Future<void> forgotPassword(String email);
  Future<void> logOut();
  Future<void> deleteAccount();
}
