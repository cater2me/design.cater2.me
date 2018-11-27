import {forceReRender} from '@storybook/react'

export useToggle = (state) -> ->
  state.isOpen = !state.isOpen
  forceReRender()

export useClose = (state) -> ->
  state.isOpen = true
  forceReRender()
  state.isOpen = false
  forceReRender()
