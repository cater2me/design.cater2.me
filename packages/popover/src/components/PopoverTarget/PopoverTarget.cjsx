import _ from 'lodash'
import React from 'react'
import PropTypes from 'prop-types'
import classnames from 'classnames'
import {Target} from 'react-popper'

DEFAULT_CLASSNAME = 'c2me-popover-target'

class PopoverTarget extends React.PureComponent
  @propTypes:
    isOpen: PropTypes.bool
    className: PropTypes.string
    nodeRef: PropTypes.object
    openOnClick: PropTypes.bool.isRequired
    togglePopover: PropTypes.func
    addIgnoreClassName: PropTypes.func

  @defaultProps:
    openOnClick: true

  componentWillMount: ->
    @targetClassName = _.uniqueId(DEFAULT_CLASSNAME)
    @props.addIgnoreClassName(@targetClassName)

  onClick: (e) =>
    {openOnClick, togglePopover, isOpen} = @props
    e.stopPropagation()
    if isOpen
      togglePopover()
    else
      togglePopover() if openOnClick

  render: ->
    {className, nodeRef} = @props
    klass = classnames(DEFAULT_CLASSNAME, @targetClassName, className)
    <Target className={klass} onClick={@onClick}>
      {
        if nodeRef
          ({targetProps}) ->
            targetProps.ref(nodeRef)
            null
        else
          @props.children
      }
    </Target>


export default PopoverTarget
