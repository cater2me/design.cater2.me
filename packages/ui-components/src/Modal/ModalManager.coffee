import _ from 'lodash'

DEFAULT_CONTAINER_CLASS = 'c2me-modal-open'

addClass = (element, className) ->
  element.classList.add(className)

removeClass = (element, className) ->
  element.classList.remove(className)

class ModalManager
  constructor: ->
    @modals = []
    @containers = []

  add: (modal, container, className) =>
    modalIdx = @modals.indexOf(modal)
    containerIdx = _.findIndex(@containers, (c) -> c.container is container)
    unless modalIdx is -1
      return modalIdx

    modalIdx = @modals.length
    @modals.push(modal)

    unless containerIdx is -1
      @containers[containerIdx].modals.push(modal)
      return modalIdx

    modals = [ modal ]
    classes = if className then className.split(/\s+/) else []
    classes.unshift('modal-open')
    classes.forEach addClass.bind(null, container)
    @containers.push({container, modals, classes})

    modalIdx

  remove: (modal) =>
    modalIdx = @modals.indexOf(modal)
    return if modalIdx is -1

    containerIdx = _.findIndex(@containers, (c) ->
      c.modals.indexOf(modal) isnt -1
    )
    container = @containers[containerIdx]
    container.modals.splice(container.modals.indexOf(modal), 1)
    @modals.splice(modalIdx, 1)

    # remove classes if last modal closed inside container
    if container.modals.length is 0
      container.classes.forEach removeClass.bind(null, container.container)

    @containers.splice(containerIdx, 1)

  findIndex: (modal) =>
    @modals.indexOf(modal)

  isTopModal: (modal) =>
    !!@modals.length && @modals[@modals.length - 1] is modal

export default ModalManager
