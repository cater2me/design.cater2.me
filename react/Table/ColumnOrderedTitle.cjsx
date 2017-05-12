React = require 'react'
PropTypes = require 'prop-types'
_ = require 'lodash'

require './ColumnOrderedTitle.scss'

module.exports = require('create-react-class')
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
      content = <span className='ColumnOrderedTitle__title-without-ordering'>{title}</span>
      return <td colSpan={colSpan || undefined} className='ColumnOrderedTitle__td'>{content}</td>

    if isOrdered
      icon = <span className={'fa fa-' + iconName}/>
      titleKlass = 'ColumnOrderedTitle__title-ordered'
    else
      icon = <span>&nbsp;</span>
      titleKlass = 'ColumnOrderedTitle__title-with-ordering'

    <td colSpan={colSpan || undefined}
      onClick={@setOrdering}
      title={"Order by '#{title}'"}
      className='ColumnOrderedTitle__td-active'
    >
      <span className={titleKlass}>{title}</span>
      <span className='ColumnOrderedTitle__icon'>{icon}</span>
    </td>
