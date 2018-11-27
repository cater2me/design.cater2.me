import React from 'react'
import {storiesOf, forceReRender} from '@storybook/react';
import {withKnobs, select} from '@storybook/addon-knobs';
import Popper from 'popper.js'

import {withMargin} from '@cater2me/storybook/addons'
import {useToggle} from '@cater2me/storybook/utils'

import Popover from './Popover'

state =
  isOpen: true

togglePopover = useToggle state

storiesOf('Components|Popover', module)
  .addDecorator withKnobs
  .addDecorator withMargin(150, 50)
  .add 'withKnobs', ->
    <Popover
      isOpen={state.isOpen}
      popper={
        placement: select('placement', Popper.placements, 'left')
      }
      togglePopover={togglePopover}
    >
      <Popover.Target>
        <span className="fa fa-book" />
      </Popover.Target>
      <Popover.Content>
        Popover.Content
      </Popover.Content>
    </Popover>
