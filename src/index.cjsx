require 'file?name=[name].[ext]!./favicon.ico'
require '../scss/design.cater2.me.scss'
require './app.scss'

React = require 'react'
ReactDOM = require 'react-dom'

App =
  <div>
    <div>
        <h1>h1. Bootstrap 3</h1>
        <h2>h2. Heading 2</h2>
        <h3>h3. Heading 3</h3>
        <h4>h4. Heading 4</h4>
        <h5>h5. Heading 5</h5>
        <h6>h6. Heading 6</h6>
    </div>
    <div>
      <p>p - paragraph <span className="fa fa-plus"/></p>
    </div>
    <button className="btn btn-lg btn-primary">Hello World! <span className="glyphicon glyphicon-flag"/></button>
  </div>

AppNode = document.getElementById 'app'

ReactDOM.render App, AppNode
