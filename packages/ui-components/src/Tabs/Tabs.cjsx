import _ from 'lodash'
import React from 'react'
import PropTypes from 'prop-types'
import classnames from 'classnames'
import { Tabs as ReactTabs, TabList, Tab, TabPanel } from 'react-tabs'

import './Tabs.scss'

Tabs = (props) ->
  {theme, autofill} = props
  className = classnames('c2me-tabs', "theme-#{theme}", props.className,
    autofill: autofill
  )
  tabsProps = _.omit(props, ['theme', 'className', 'autofill'])
  <ReactTabs {...tabsProps} className={className} />


Tabs.propTypes =
  className: PropTypes.string
  autofill: PropTypes.bool.isRequired
  theme: PropTypes.oneOf(['default', 'gray', 'yellow']).isRequired

Tabs.defaultProps =
  theme: 'default'
  autofill: false

export {Tabs, TabList, Tab, TabPanel}
