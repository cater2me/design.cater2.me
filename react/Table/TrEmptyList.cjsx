React = require 'react'
PropTypes = require 'prop-types'

TrEmptyList = (props)->
  colSpan = Number(props.colSpan) || 1
  message = props.message || 'empty list'
  <tr>
    <td colSpan={colSpan} className='text-center'>
      <h5>{message}</h5>
    </td>
  </tr>

TrEmptyList.propTypes =
  colSpan: PropTypes.oneOfType([PropTypes.number, PropTypes.string])

module.exports = TrEmptyList
