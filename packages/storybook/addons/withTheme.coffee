import React from 'react'
import {select} from '@storybook/addon-knobs';

export themes = ['external', 'internal']

export default (storyFn) ->
  theme = select('theme', themes, 'external')

  <div className={"theme-#{theme}"}>
    {storyFn()}
  </div>
