import React from 'react';
import { storiesOf } from '@storybook/react';
import { action } from '@storybook/addon-actions';

import Button from './Button'

storiesOf('Components|Button', module)
  .add 'default', ->
    <Button>Default</Button>

  .add 'square lg yellow', ->
    <Button kind="square" size="lg" color="yellow">
      Square Large Yellow
    </Button>
