import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

class Portal extends React.PureComponent
  @propTypes:
    target: PropTypes.any.isRequired

  @defaultProps:
    target: document.body

  render: ->
    {children, target} = @props
    ReactDOM.createPortal(children, target)

export default Portal
