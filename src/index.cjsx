require 'file?name=[name].[ext]!./index.html'
require 'file?name=[name].[ext]!./favicon.ico'
require './app.scss'

React = require 'react'
ReactDOM = require 'react-dom'

App =
  <div>
    <button className="btn btn-lg btn-primary">Hello World! <span className="glyphicon glyphicon-flag"/></button>
  </div>

AppNode = document.getElementById 'app'

ReactDOM.render App, AppNode
