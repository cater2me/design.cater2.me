import React from 'react'
import PropTypes from 'prop-types'
import classnames from 'classnames'

class ModalTitle extends React.PureComponent
  @propTypes:
    element: PropTypes.string.isRequired
    className: PropTypes.string

  @defaultProps:
    element: 'h4'

  render: ->
    {className, children, element} = @props
    React.createElement(element, {
      className: classnames 'c2me-dialog__header__title', className,
    }, ...children)

export default ModalTitle
