import React from 'react';
import { storiesOf } from '@storybook/react';
import { action } from '@storybook/addon-actions';
import { withKnobs, select } from '@storybook/addon-knobs';

import Tooltip from './Tooltip'

storiesOf('Components|Tooltip', module)
  .addDecorator(withKnobs)
  .add 'default', ->
    <React.Fragment>
      implement on &nbsp;
      <b>
        <a 
          src="https://github.com/react-component/tooltip"
          target="_blank"
        >
          rc-tooltip
        </a>
      </b>
      <br/><br/><br/><br/>
      <Tooltip
        trigger={['click']}
        placement={select 'placement', ['top', 'right', 'bottom', 'left'], 'top' }
        overlay={<span>I am Tooltip :))</span>}
      >
        <span>
          Hello, click on me! :)
        </span>
      </Tooltip>
    </React.Fragment>
# onPopupAlign={() => copy(data)}