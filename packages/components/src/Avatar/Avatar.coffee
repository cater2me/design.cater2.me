import React from 'react'
import PropTypes from 'prop-types'

import './Avatar.scss'
import avatarPlaceholder from './assets/avatar-placeholder.png'

class Avatar extends React.PureComponent
  @propTypes:
    src: PropTypes.string
    size: PropTypes.number

  @defaultProps:
    src: avatarPlaceholder
    size: 100

  ref: (img) =>
    return unless img
    #TODO: Chrome bug with image size
    sizeInPx = "#{@props.size}px"
    # img drawed incorrect first time when set style prop
    # need setTimeout with 20ms which is a little bit more than 1 draw frame (16.6ms)
    setTimeout ->
      img.style.height = sizeInPx
      img.style.width = sizeInPx
    , 20

  render: ->
    <img
      ref={@ref}
      className='c2me-avatar'
      src={@props.src}
    />

export default Avatar
