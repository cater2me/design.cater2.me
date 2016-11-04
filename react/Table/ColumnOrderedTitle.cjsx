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
    colSpan: PropTypes.oneOfType([PropTypes.string, PropTypes.number])

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
    {ordering, field, title, colSpan} = props
    colSpan = Number(colSpan) || undefined
    isOrdered = false
    iconName = ''
    isSimple = !field || !@setOrdering || !ordering
    unless isSimple
      isOrdered = ordering.sort_by is field
      if isOrdered
        iconName = if ordering.sort_order is 'asc' then 'caret-down' else 'caret-up'
    @setState {isSimple, isOrdered, iconName, title, colSpan}

  componentWillReceiveProps: (nextProps)->
    @fixState nextProps

  shouldComponentUpdate: (nextProps, nextState)->
    !_.isEqual(@state, nextState)

  render: ->
    {isSimple, isOrdered, iconName, title, colSpan} = @state
    if isSimple
      content = <span>{title}</span>
    else
      icon = isOrdered && <span><span className={'fa fa-' + iconName}/></span> || <span />
      content = <span onClick={@setOrdering}>
        <span>{title}</span>
        &nbsp;
        <span>{icon}</span>
      </span>

    <td colSpan={colSpan || undefined}>{content}</td>
