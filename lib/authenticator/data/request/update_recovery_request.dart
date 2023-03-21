class UpdateRecoveryRequest {
  final String userId;
  final String secret;
  final String password;
  final String passwordAgain;

  UpdateRecoveryRequest(
      this.userId, this.secret, this.password, this.passwordAgain);
}
