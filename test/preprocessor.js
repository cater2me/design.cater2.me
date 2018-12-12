var coffee = require('coffeescript');

module.exports = {
  process: function(src, path) {
    if (coffee.helpers.isCoffee(path)) {
      return coffee.compile(src, {
        transpile: {
          plugins: [
            'transform-es2015-modules-commonjs',
            'transform-object-rest-spread'
          ],
          presets: ['jest', 'env', 'react']
        }
      });
    }
    return null;
  }
};

