enum Environment { mock, production }

class AppConfig {
  const AppConfig({this.env = Environment.mock});

  final Environment env;
}
