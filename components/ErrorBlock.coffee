React = require 'react'
PropTypes = require 'prop-types'
{isEmpty, isString} = require 'lodash'

ErrorsBlock = (props)->
  {errors, error} = props
  return <span/> if isEmpty(errors) && isEmpty(error)

  errorStr = error && <div className='alert alert-danger' >{error}</div> || <span/>
  errorsDiv = for i, msg of errors
    msg = JSON.stringify(msg) unless isString(msg)
    <div key={i} className='alert alert-danger'>
      <b>{i}</b>: {msg}
    </div>
  <div  style={padding: '1em 0'}>
    {errorStr}
    {errorsDiv}
  </div>

ErrorsBlock.propTypes =
  errors: PropTypes.object
  error: PropTypes.string

module.exports = ErrorsBlock
