import React from 'react'
import PropTypes from 'prop-types'
import onClickOutside from 'react-onclickoutside'
import {some} from 'lodash/fp'

isHTML = (target) ->
  target.tagName == 'HTML'

containsClassNames = (classnames) ->
  some (originClassName) ->
    classnames.includes(originClassName)

targetHasClassNames = (target, classnames) ->
  return false if isHTML(target)

  containsClassNames(classnames)(target.classList) ||
  targetHasClassNames(target.parentElement, classnames)


defaultIgnoreClass = 'ignore-react-onclickoutside'
# use defaultIgnoreClass like in react-onclickoutside
# https://github.com/Pomax/react-onclickoutside

class ClickOutside extends React.PureComponent
  @propTypes:
    onClickOutside: PropTypes.func.isRequired
    ignoreClassNames: PropTypes.arrayOf(PropTypes.string.isRequired).isRequired

  @defaultProps:
    onClickOutside: () => {},
    ignoreClassNames: []

  handleClickOutside: (event) =>
    {ignoreClassNames} = @props
    if targetHasClassNames(event.target, [defaultIgnoreClass, ...ignoreClassNames])
      return
    @props.onClickOutside(event)

  render: () ->
    {children} = @props
    return null unless children
    React.Children.only(children)

export default onClickOutside(ClickOutside)
