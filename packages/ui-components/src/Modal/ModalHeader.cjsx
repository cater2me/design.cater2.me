import React from 'react'
import PropTypes from 'prop-types'
import classnames from 'classnames'

class ModalHeader extends React.PureComponent
  @propTypes:
    className: PropTypes.string
    withoutCloseButton: PropTypes.bool.isRequired

  @defaultProps:
    withoutCloseButton: false

  @contextTypes:
    onHide: PropTypes.func.isRequired

  render: ->
    {className, withoutCloseButton, children} = @props
    <div className={classnames 'c2me-dialog__header', className}>
      {children}
      {
        unless withoutCloseButton
          <span
            onClick={@context.onHide}
            className='c2me-dialog__header__close'
          >&times;</span>
      }
    </div>

export default ModalHeader
