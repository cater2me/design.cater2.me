import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

import classnames from 'classnames'
import ClickOutside from '../ClickOutside'
import ModalManager from './ModalManager'

ESCAPE = 27

class Dialog extends React.PureComponent
  @propTypes:
    disableCloseOnClickOutside: PropTypes.bool.isRequired
    hasError: PropTypes.bool.isRequired
    backdrop: PropTypes.bool.isRequired
    className: PropTypes.string
    onHide: PropTypes.func.isRequired
    onEntered: PropTypes.func
    onKeyDown: PropTypes.func
    size: PropTypes.oneOf ['sm', 'md', 'lg']
    manager: PropTypes.instanceOf(ModalManager).isRequired
    # Container func should return ref to container
    # () => this.refToNode, we will add to current container class 'open-modal'
    # which prevent scrolling inside container
    container: PropTypes.func
    containerClassName: PropTypes.string
    ignoreClassNamesOnOuterClick: PropTypes.array.isRequired

  @defaultProps:
    backdrop: true
    size: 'md'

  getContainer: ->
    if typeof @props.container is 'function'
      ReactDOM.findDOMNode @props.container()
    else
      document.body

  componentDidMount: ->
    {manager, containerClassName, onEntered} = @props
    manager.add(@, @getContainer(), containerClassName)
    document.addEventListener 'keydown', @handleKeyDown
    onEntered && onEntered()

  componentWillUnmount: ->
    @props.manager.remove(@)
    document.removeEventListener 'keydown', @handleKeyDown

  handleKeyDown: (e) =>
    {onHide, onKeyDown, manager} = @props
    if manager.isTopModal(@)
      if e.key is ESCAPE || e.keyCode is ESCAPE
        onHide()
      onKeyDown && onKeyDown(e)

  onClickOutside: (e) =>
    if e.button is 2 # right click
      e.preventDefault()
      return
    if @props.manager.isTopModal(@)
      @props.onHide()

  ref: (node) =>
    @dialog = node

  renderContent: ->
    {children, hasError, size} = @props
    <div
      className={classnames 'c2me-dialog-content', size,
        'has-errors': hasError}
    >
      {children}
    </div>

  render: ->
    {backdrop, className, manager, disableCloseOnClickOutside, ignoreClassNamesOnOuterClick} = @props
    <div
      ref={@ref}
      className={classnames 'c2me-dialog', className}
      tabIndex={manager.findIndex(@)}
    >
      {backdrop && <div className='c2me-dialog-backdrop' />}
      <div className='c2me-dialog-autosize'>
        {
          if !disableCloseOnClickOutside
            <ClickOutside
              onClickOutside={@onClickOutside}
              ignoreClassNames={ignoreClassNamesOnOuterClick}
            >
              {@renderContent()}
            </ClickOutside>
          else
            @renderContent()
        }
      </div>
    </div>

export default Dialog
