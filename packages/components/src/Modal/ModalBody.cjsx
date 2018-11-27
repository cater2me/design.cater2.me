import React from 'react'
import PropTypes from 'prop-types'
import classnames from 'classnames'

class ModalBody extends React.PureComponent
  @propTypes:
    className: PropTypes.string

  render: ->
    {className, children} = @props
    <div className={classnames 'c2me-dialog__body', className}>
      {children}
    </div>

export default ModalBody
