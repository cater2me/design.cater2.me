import React from 'react'
import PropTypes from 'prop-types'
import {Popper, Arrow} from 'react-popper'
import ResizeDetector from 'react-resize-detector'
import classnames from 'classnames'
import _ from 'lodash'

import Portal from '../Portal'
import ClickOutside from '../ClickOutside'

class PopoverContent extends React.PureComponent
  @propTypes:
    arrow: PropTypes.any
    isOpen: PropTypes.bool
    ignoreClassNamesOnOuterClick: PropTypes.arrayOf(PropTypes.string)
    onOuterAction: PropTypes.func
    popper: PropTypes.object
    className: PropTypes.string
    popperClassName: PropTypes.string
    style: PropTypes.object

  @defaultProps:
    arrow: <Arrow />

  handleClickOutside: (e) =>
    {onOuterAction, togglePopover} = @props
    onOuterAction && onOuterAction(e)
    togglePopover(e)

  render: ->
    {isOpen, arrow, popper, className, popperClassName, style, ignoreClassNamesOnOuterClick} = @props
    return null unless isOpen
    <Portal>
      <ClickOutside
        onClickOutside={@handleClickOutside}
        ignoreClassNames={ignoreClassNamesOnOuterClick}
      >
        <Popper {..._.merge(modifiers: {offset: {offset: '0, 10'}}, popper)}>
          {({ scheduleUpdate, popperProps }) =>
            <div
              className={classnames('c2me-popover', 'ignore-react-onclickoutside', popperClassName)}
              {...popperProps}
            >
              {
                arrow && React.cloneElement(arrow,
                  className: classnames('c2me-popover__arrow', arrow.props.className),
                )
              }
              <div
                className={classnames('c2me-popover__body', className)}
                style={style}
              >
                {@props.children}
              </div>
              <ResizeDetector
                handleHeight
                handleWidth
                onResize={scheduleUpdate}
              />
            </div>
          }
        </Popper>
      </ClickOutside>
    </Portal>

export default PopoverContent
