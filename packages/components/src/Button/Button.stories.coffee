import React from 'react';
import { storiesOf } from '@storybook/react';
import { action } from '@storybook/addon-actions';

import {withTheme} from '@cater2me/storybook/addons'

import Button from './Button'

storiesOf('Components|Button', module)
  .addDecorator withTheme 'internal'
  .add 'Default', ->
    <Button>Default</Button>
  .add 'All buttons', ->
    <React.Fragment>
      <Button kind="square" color="yellow">
        Square Large Yellow
      </Button>
      <br/><br/>
      <Button color="yellow">
        Yellow Button
      </Button>
      <br/><br/>
      <Button color="light">
        Light Button
      </Button>
      <br/><br/>
      <Button color="blue">
        Blue Button
      </Button>
      <br/><br/>
      <Button color="green">
        Green Button
      </Button>
      <br/><br/>
      <Button color="transparent">
        Transparent Button
      </Button>
    </React.Fragment>