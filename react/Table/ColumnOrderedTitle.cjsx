React = require 'react'
{PropTypes} = React
_ = require 'lodash'

# tmp

module.exports = React.createClass
  displayName: 'ColumnOrderedTitle'

  propTypes:
    title: PropTypes.string
    field: PropTypes.string
    ordering: PropTypes.shape
      sort_by: PropTypes.string
      sort_order: PropTypes.string
    onClick: PropTypes.func

  getInitialState: ->
    isSimple: true
    isOrdered: false
    iconName: ''
    title: ''

  componentWillMount: ->
    {onClick, field} = @props
    if _.isFunction(onClick) && field
      @setOrdering = onClick.bind(null, field)
    @fixState @props

  fixState: (props)->
    {ordering, field, title} = props
    isOrdered = false
    iconName = ''
    isSimple = !field || !@setOrdering || !ordering
    unless isSimple
      isOrdered = ordering.sort_by is field
      if isOrdered
        iconName = if ordering.sort_order is 'asc' then 'caret-down' else 'caret-up'
    @setState {isSimple, isOrdered, iconName, title}

  componentWillReceiveProps: (nextProps)->
    @fixState nextProps

  shouldComponentUpdate: (nextProps, nextState)->
    !_.isEqual(@state, nextState)

  render: ->
    {isSimple, isOrdered, iconName, title} = @state
    return  <td><span>{title}</span></td> if isSimple
    icon = isOrdered && <span><span className={'fa fa-' + iconName}/></span> || <span />
    <td>
      <span onClick={@setOrdering}>
        <span>{title}</span>
        &nbsp;
        <span>{icon}</span>
      </span>
    </td>
