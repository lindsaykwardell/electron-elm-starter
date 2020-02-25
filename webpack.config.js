var path = require("path");
var webpack = require("webpack");
module.exports = {
  watch: true,
  target: "node",
  externals:{
    fs:    "commonjs fs",
    path:  "commonjs path"
},
  entry: "./src/ports.js",
  output: {
    path: path.resolve(__dirname, "src/"),
    filename: "renderer.js"
  },
  module: {
    rules: [
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        use: { loader: "elm-webpack-loader", options: {} }
      }
    ]
  },
  node: {
    fs: true
  }
};
