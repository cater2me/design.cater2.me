import React from 'react'
import PropTypes from 'prop-types'

import Portal from '../Portal'

import './Modal.scss'
import ModalManager from './ModalManager'
import Dialog from './Dialog'
import Body from './ModalBody'
import Footer from './ModalFooter'
import Header from './ModalHeader'
import Title from './ModalTitle'

manager = new ModalManager

class Modal extends React.PureComponent
  constructor: (props) ->
    super(props)
    @state = isOpen: props.isOpen

  @propTypes:
    isOpen: PropTypes.bool.isRequired
    onHide: PropTypes.func
    hasError: PropTypes.bool.isRequired
    disableClose: PropTypes.bool.isRequired
    ignoreClassNamesOnOuterClick: PropTypes.array.isRequired
    disableCloseOnClickOutside: PropTypes.bool.isRequired
    manager: PropTypes.instanceOf ModalManager

  @defaultProps:
    disableCloseOnClickOutside: false
    ignoreClassNamesOnOuterClick: []
    hasError: false
    isOpen: false
    disableClose: false
    manager: manager

  @childContextTypes:
    onHide: PropTypes.func.isRequired

  getChildContext: =>
    onHide: @onHide

  componentWillReceiveProps: (nextProps) ->
    if nextProps.isOpen isnt @state.isOpen
      @toggleModal()

  toggleModal: ->
    @setState isOpen: !@state.isOpen

  onHide: =>
    {disableClose, onHide} = @props
    return if disableClose
    @toggleModal()
    onHide && onHide()

  render: ->
    {isOpen} = @state
    return null unless isOpen
    <Portal>
      <Dialog {...@props} onHide={@onHide} />
    </Portal>

Modal.Title = Title
Modal.Header = Header
Modal.Body = Body
Modal.Footer = Footer

export default Modal
