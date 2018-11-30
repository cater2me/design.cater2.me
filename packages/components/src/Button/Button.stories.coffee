import React from 'react';
import { storiesOf } from '@storybook/react';
import { withKnobs } from '@storybook/addon-knobs';

import { withTheme } from '@cater2.me/storybook/addons'

import Button from './Button'

# comment for testing publish
storiesOf('Components|Button', module)
  .addDecorator withKnobs
  .addDecorator withTheme
  .add 'Default', ->
    <Button>Default</Button>
  .add 'All buttons', ->
    <React.Fragment>
      <Button kind="square" color="transparent">
        Square Large Transparent
      </Button>
      <br/><br/>
      <Button color="yellow">
        Yellow Button
      </Button>
      <br/><br/>
      <Button color="green">
        Green Button
      </Button>
      <br/><br/>
      <Button color="red">
        Red Button
      </Button>
      <br/><br/>
      <Button color="blue">
        Blue Button
      </Button>
    </React.Fragment>
