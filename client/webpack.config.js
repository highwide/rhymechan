var path = require('path');

module.exports = {
  entry: {
    application: path.join(__dirname, 'src/index.js'),
  },

  output: {
    path: path.join(__dirname, '..', 'app/assets/javascripts/webpack'),
    filename: '[name].js',
  },

  module: {
    loaders: [{
      test: /\.(js|jsx)$/,
      loader: 'babel',
      exclude: /node_modules/,
      query: {
        presets: ['es2015', 'react'],
      }
    }, ]
  },
}
