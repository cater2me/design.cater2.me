React = require 'react'
{PropTypes} = React

Currency = (props)->
  n = Number(props.children)
  value = n.toLocaleString('en-US', { style: 'currency', currency: 'USD' })
  <span>{value}</span>

Currency.propTypes =
  children: PropTypes.oneOfType([PropTypes.number, PropTypes.string])

module.exports = Currency
