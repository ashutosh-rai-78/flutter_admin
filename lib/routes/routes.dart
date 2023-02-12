
enum Routes {
  login,
  home,
  products;

  String get path {
    switch(this){
      case Routes.login:
        return "/login";
      case Routes.home:
        return "/";
        case Routes.products : 
        return "/products";
    }
  }
}


