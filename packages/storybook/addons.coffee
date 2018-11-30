import React from 'react'
import {select, number} from '@storybook/addon-knobs';

import {themes} from './constants';

export withTheme = (defaultTheme = 'external') ->
  (storyFn) ->
    theme = select('theme', themes, defaultTheme)
    <div
      className={"theme-#{theme}"}
    >
      {storyFn()}
    </div>

export withMargin = (marginLeft = 0, marginTop = 0, options = {}) ->
  xOptions = {
    min: 0
    max: 500
    step: 10
    range: true
  }
  yOptions = {...xOptions, max: 300}

  # merge with user options
  xOptions = {...xOptions, ...options}
  yOptions = {...yOptions, ...options}

  (storyFn) ->
    <div
      style={
        marginLeft: number('marginLeft', marginLeft, xOptions)
        marginTop: number('marginTop', marginTop, yOptions)
      }
    >
      {storyFn()}
    </div>
