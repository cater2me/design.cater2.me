React = require 'react'
{PropTypes} = React

TrEmptyList = (props)->
  colSpan = Number(props.colSpan) || 1
  <tr>
    <td colSpan={colSpan} className='text-center'>
      <h5>empty list</h5>
    </td>
  </tr>

TrEmptyList.propTypes =
  colSpan: PropTypes.oneOfType([PropTypes.number, PropTypes.string])

module.exports = TrEmptyList
