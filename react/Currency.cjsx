React = require 'react'
{PropTypes} = React
_ = require 'lodash'

Currency = (props)->
  if !_.isFinite(props.children) && _.isEmpty(props.children)
    return <span/>
  n = Number(props.children)
  value = n.toLocaleString('en-US', { style: 'currency', currency: 'USD' })
  <span>{value}</span>

Currency.propTypes =
  children: PropTypes.oneOfType([PropTypes.number, PropTypes.string])

module.exports = Currency
