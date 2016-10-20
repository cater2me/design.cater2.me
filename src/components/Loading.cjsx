React = require 'react'
{PropTypes} = React
FontAwesome = require('react-fa').default

SpinLoading = ->
  <FontAwesome spin name="circle-o-notch" />

loadingStyles =
  display: 'inline-block'
  width: '100%'
  margin: '8px 12px'
  fontSize: '16px'
  textAlign: 'center'

Loading = ->
  <div style={loadingStyles}>
    <SpinLoading />
  </div>

LoadingTbody = (props={})->
  colSpan = props.colSpan || 1
  <tbody>
    <tr>
      <td colSpan={colSpan} className="text-center"><Loading /></td>
    </tr>
  </tbody>

LoadingOrValue = React.createClass
  propTypes:
    isLoading: PropTypes.bool.isRequired
    children: PropTypes.any

  render: ->
    {isLoading, children} = @props
    content = isLoading && <SpinLoading /> || children
    <span> {content}</span>

module.exports = Loading
module.exports.SpinLoading = SpinLoading
module.exports.LoadingOrValue = LoadingOrValue
module.exports.LoadingTbody = LoadingTbody
