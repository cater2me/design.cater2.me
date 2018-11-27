import React from 'react'
import {storiesOf, forceReRender} from '@storybook/react';
import {withKnobs, boolean, select} from '@storybook/addon-knobs';

import {Tabs, TabList, Tab, TabPanel} from './Tabs'
import {themes} from './constants'

storiesOf('Components|Tabs', module)
  .addDecorator withKnobs
  .add 'withKnobs', ->
    <Tabs
      theme={select('theme', themes, 'yellow')}
      autofill={boolean('autofill', false)}
    >
      <TabList>
        <Tab>1</Tab>
        <Tab>2</Tab>
        <Tab>3</Tab>
      </TabList>
      <TabPanel>first content</TabPanel>
      <TabPanel>second content</TabPanel>
      <TabPanel>third content</TabPanel>
    </Tabs>