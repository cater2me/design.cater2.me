import _ from 'lodash'
import React from 'react'
import PropTypes from 'prop-types'
import {Manager} from 'react-popper'

import PopoverTarget from './PopoverTarget'
import PopoverContent from './PopoverContent'

import './Popover.scss'

class Popover extends React.PureComponent
  @propTypes:
    className: PropTypes.string
    children: PropTypes.array.isRequired # [PopoverTarget, PopoverBody]
    isOpen: PropTypes.bool.isRequired
    ignoreClassNamesOnOuterClick: PropTypes.arrayOf(PropTypes.string).isRequired
    onOuterAction: PropTypes.func
    togglePopover: PropTypes.func
    # popper - props for popper.js
    # https://popper.js.org/popper-documentation.html
    popper: PropTypes.object

  @defaultProps:
    isOpen: false
    ignoreClassNamesOnOuterClick: []

  constructor: (props) ->
    super(props)
    @state =
      isOpen: props.isOpen
      ignoreClassNamesOnOuterClick: [...props.ignoreClassNamesOnOuterClick]

  componentWillReceiveProps: (nextProps) ->
    unless @props.isOpen is nextProps.isOpen
      @setState {isOpen: nextProps.isOpen}

  addIgnoreClassName: (className) =>
    if className
      @setState {ignoreClassNamesOnOuterClick: [...@state.ignoreClassNamesOnOuterClick, className]}

  togglePopover: (event) =>
    event?.stopPropagation()
    if @props.togglePopover
      @props.togglePopover()
    else
      @setState {isOpen: !@state.isOpen}

  render: ->
    {popper, className, onOuterAction} = @props
    {isOpen, ignoreClassNamesOnOuterClick} = @state
    <Manager tag={false}>
      {
        React.Children.map(@props.children, (child) =>
          updatedProps = _.assign({}, child.props, {
            isOpen,
            ignoreClassNamesOnOuterClick,
            popper,
            togglePopover: @togglePopover,
            addIgnoreClassName: @addIgnoreClassName,
            popperClassName: className
            onOuterAction
          })
          React.cloneElement(child, updatedProps)
      )
    }
    </Manager>

Popover.Target = PopoverTarget
Popover.Content = PopoverContent

export default Popover
