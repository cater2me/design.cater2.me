React = require 'react'
{PropTypes} = React
{isEmpty} = require 'lodash'

ErrorsBlock = (props)->
  {errors, error} = props
  return <span/> if isEmpty(errors) && isEmpty(error)

  errorStr = error && <div className='alert alert-danger' >{error}</div> || <span/>
  errorsDiv = for i, error of errors
    <div key={i} className='alert alert-danger'>
      {error}
    </div>
  <div  style={padding: '1em 0'}>
    {errorStr}
    {errorsDiv}
  </div>

ErrorsBlock.propTypes =
  errors: PropTypes.object
  error: PropTypes.string

module.exports = ErrorsBlock

