React = require 'react'
PropTypes = require 'prop-types'

SpinLoading = ->
  <span>
   <span className="fa fa-spin fa-circle-o-notch"/>
  </span>

loadingStyles =
  display: 'inline-block'
  width: '100%'
  margin: '8px 12px'
  fontSize: '16px'
  textAlign: 'center'

Loading = ->
  <div style={loadingStyles}>
    <SpinLoading />
  </div>

LoadingTbody = (props={})->
  colSpan = props.colSpan || 1
  <tbody>
    <tr>
      <td colSpan={colSpan} className="text-center"><Loading /></td>
    </tr>
  </tbody>

# example for LoadMore
  # renderLoadMoreOrders: ->
  #   {pagination, isLoading, isLoadingMore, loadMoreOrders} = @props
  #   <LoadMore show={pagination.hasMore && !isLoading}
  #     disabled={isLoadingMore}
  #     isLoading={isLoadingMore}
  #     loadMore={loadMoreOrders}
  #   >
  #     Load more orders
  #   </LoadMore>
LoadMore = (props)->
  {show, loadMore, disabled, isLoading, children} = props
  return <span/> unless show

  btn = <button
    className="btn btn-primary"
    disabled={disabled}
    onClick={loadMore}>{children}</button>
  btn = <Loading /> if isLoading
  <div className="text-center">{btn}</div>

LoadingOrValue = React.createClass
  propTypes:
    isLoading: PropTypes.bool.isRequired
    children: PropTypes.any

  render: ->
    {isLoading, children} = @props
    content = isLoading && <SpinLoading /> || children
    <span> {content}</span>

module.exports = Loading
module.exports.SpinLoading = SpinLoading
module.exports.LoadingOrValue = LoadingOrValue
module.exports.LoadingTbody = LoadingTbody
module.exports.LoadMore = LoadMore
