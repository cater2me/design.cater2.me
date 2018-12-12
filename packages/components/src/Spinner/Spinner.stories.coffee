import React from 'react'
import { storiesOf } from '@storybook/react'
import { withKnobs, number, color} from '@storybook/addon-knobs';

import Spinner from './Spinner'

storiesOf('Components|Spinner', module)
  .addDecorator withKnobs
  .add 'default', ->
    options = {
      range: true,
      min: 10,
      max: 100,
      step: 1,
    }
    <Spinner 
      size={number('size', 40, options)}
      thickness={number('thickness', 3.5, {...options, step: 0.1, min: 1, max: 10})}
      color={color('color', '#3e3c3d')}
      trackColor={color('trackColor', '')}
    />