import React from 'react'
import PropTypes from 'prop-types'
import RCTooltip from 'rc-tooltip'

import classnames from 'classnames'

import 'rc-tooltip/assets/bootstrap.css';
import './Tooltip.scss'

Tooltip = (props) ->
  <RCTooltip
    {...props}
    overlayClassName={classnames 'c2me-tooltip', props.overlayClassName}
  />

Tooltip.defaultProps =
  placement: "bottom"

Tooltip.propTypes =
  placement: PropTypes.string.isRequired

export default Tooltip
