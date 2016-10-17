require 'file?name=[name].[ext]!./index.html'
require 'file?name=[name].[ext]!./favicon.ico'
require './app.scss'

React = require 'react'
ReactDOM = require 'react-dom'

App = <h1>C2ME Finance!</h1>
AppNode = document.getElementById 'app'

ReactDOM.render App, AppNode
