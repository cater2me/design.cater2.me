import React from 'react';
import { storiesOf } from '@storybook/react';

import {Tooltip} from '@cater2.me/components'
import packageJson from './package.json'
requireIcons = require.context('./', true, /.svg$/)

storiesOf('Icons | ALL', module)
  .add 'default', ->
    <div>
      <h2>You can Click on icon and see path for import: ) Enjoy</h2>
      {
        requireIcons.keys().map((srcIcon, i) ->
          <Tooltip
            trigger={['click']}
            placement='right'
            overlay={<span>{packageJson.name}/{srcIcon.replace('./','')}</span>}
          >
            <img
              style={maxWidth: '50px', margin: '20px'}
              key={i}
              src={requireIcons(srcIcon, true)}
              alt={srcIcon}
            />
          </Tooltip>
        )
      }
    </div>