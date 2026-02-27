enum AppRoutes {
  home('/'),
  profile('/profile'),
  createNote('/createNote'),
  onboard('/onboard'),
  signIn('/signIn'),
  signUp('/signUp');

  final String path;
  const AppRoutes(this.path);
}
