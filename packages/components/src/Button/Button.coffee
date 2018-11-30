import React from 'react'
import PropTypes from 'prop-types'
import classnames from 'classnames'

import './Button.scss'

Button = ({href, children, size, className, kind, color, shadow, disabled, ...restProps}) ->
  element = if href then 'a' else 'button'
  React.createElement(element, {
      ...restProps,
      href,
      disabled,
      className: classnames(
        "c2me-btn btn btn-#{size} btn-#{kind} btn-#{color}",
        "c2me-btn-disabled": disabled,
        "c2me-btn-shadow": shadow,
        className,
      )
    },
    children
  )

Button.propTypes =
  kind: PropTypes.oneOf(['square', 'round']).isRequired
  size: PropTypes.oneOf(['sm', 'md', 'lg']).isRequired
  color: PropTypes.oneOf(['yellow', 'green', 'red', 'blue', 'white', 'light', 'transparent']).isRequired
  shadow: PropTypes.bool
  href: PropTypes.string
  className: PropTypes.string
  disabled: PropTypes.bool

Button.defaultProps =
  kind: 'round'
  size: 'md'
  color: 'light'

export default Button
