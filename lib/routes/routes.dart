enum Routes {
  login,
  home,
  main,
  products;

  String get path {
    switch (this) {
      case Routes.login:
        return "/login";
      case Routes.main:
        return "/";
      case Routes.home:
        return "/home";
      case Routes.products:
        return "/products";
    }
  }
}
