enum Routes {
  login,
  home,
  dashboard,
  products;

  String get path {
    switch (this) {
      case Routes.login:
        return "/login";
      case Routes.dashboard:
        return "/";
      case Routes.home:
        return "/home";
      case Routes.products:
        return "/products";
    }
  }
}
