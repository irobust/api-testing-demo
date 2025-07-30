function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    baseURL: 'http://api.example.com'
  }
  if (env == 'dev') {
    config.baseURL = "https://www.deckofcardsapi.com/api"
    config.dataFile = 'testing-data/dev-data.csv'
  } else if (env == 'uat') {
    config.dataFile = 'testing-data/prod-data.csv'
  }
  return config;
}