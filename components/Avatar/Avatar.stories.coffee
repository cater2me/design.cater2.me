import React from 'react';
import { storiesOf } from '@storybook/react';
import { action } from '@storybook/addon-actions';

import Avatar from './Avatar'

storiesOf('Components|Avatar', module)
  .add 'simple', ->
    <Avatar
      src="https://cdn3.iconfinder.com/data/icons/cinema-39/64/Avatar-Neytiri_avatar_movie_superhero-128.png"
    />

  .add 'fallback', ->
    <Avatar/>
