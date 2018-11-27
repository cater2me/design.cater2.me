import React from 'react'
import PropTypes from 'prop-types'
import { Tabs as ReactTabs, TabList, Tab, TabPanel } from 'react-tabs'
import classnames from 'classnames'
import {omit} from 'lodash/fp'

import './Tabs.scss'
import {themes} from './constants'

Tabs = (props) ->
  {theme, autofill} = props
  className = classnames('c2me-tabs', "theme-#{theme}", props.className,
    autofill: autofill
  )
  tabsProps = omit(['theme', 'className', 'autofill']) props
  <ReactTabs {...tabsProps} className={className} />


Tabs.propTypes =
  className: PropTypes.string
  autofill: PropTypes.bool.isRequired
  theme: PropTypes.oneOf(themes).isRequired

Tabs.defaultProps =
  theme: 'default'
  autofill: false

export {Tabs, TabList, Tab, TabPanel}
