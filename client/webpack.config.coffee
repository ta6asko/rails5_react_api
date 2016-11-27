webpack = require('webpack')
path = require('path')
WriteFilePlugin = require('write-file-webpack-plugin')

module.exports =
  entry: './index.js'

  output:
    path: __dirname
    filename: 'app.js'
    publicPath: '/static/'

  module: loaders: [
    {
      test: /\.js$/
      loader: 'babel'
      exclude: /node_modules/
      include: __dirname
      query: presets: [
        'es2015'
        'react'
        'react-hmre'
      ]
    }
    {
      test: /.cjsx$/
      loader: 'cjsx-loader'
      exclude: /node_modules/
      include: __dirname
    }
    {
      test: /.coffee$/
      loader: 'coffee-loader'
      exclude: /node_modules/
      include: __dirname
    }
  ]

  plugins: [
    new (webpack.NoErrorsPlugin)
    new WriteFilePlugin(
      test: /\app.js$/
      useHashIndex: true)
  ]

  devServer: outputPath: path.join(__dirname, '../public/')
