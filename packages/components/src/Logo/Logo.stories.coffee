import React from 'react';
import { storiesOf } from '@storybook/react';

import Logo from './Logo'

storiesOf('Components|Logos', module)
  .add 'default', ->
    <div style={width: 100}>
      <Logo variant='black' />
      <Logo variant='white' />
      <div style={background: '#ccc'}>
        <Logo variant='yellow-white' />
      </div>
      <Logo variant='yellow-black' />
    </div>
