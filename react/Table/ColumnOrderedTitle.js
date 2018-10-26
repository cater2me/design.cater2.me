'use strict';

// Generated by CoffeeScript 2.3.1
var PropTypes, React, _;

React = require('react');

PropTypes = require('prop-types');

_ = require('lodash');

require('../../scss/ColumnOrderedTitle.scss');

module.exports = require('create-react-class')({
  displayName: 'ColumnOrderedTitle',
  propTypes: {
    className: PropTypes.string,
    title: PropTypes.oneOfType([PropTypes.string, PropTypes.element]),
    field: PropTypes.string,
    ordering: PropTypes.shape({
      sort_by: PropTypes.string,
      sort_order: PropTypes.string
    }),
    onClick: PropTypes.func,
    colSpan: PropTypes.oneOfType([PropTypes.string, PropTypes.number])
  },
  getInitialState: function getInitialState() {
    return {
      isSimple: true,
      isOrdered: false,
      iconName: '',
      title: ''
    };
  },
  componentWillMount: function componentWillMount() {
    var field, onClick;
    var _props = this.props;
    onClick = _props.onClick;
    field = _props.field;

    if (_.isFunction(onClick) && field) {
      this.setOrdering = onClick.bind(null, field);
    }
    return this.fixState(this.props);
  },
  fixState: function fixState(props) {
    var colSpan, field, iconName, isOrdered, isSimple, ordering, title;
    ordering = props.ordering;
    field = props.field;
    title = props.title;
    colSpan = props.colSpan;

    colSpan = Number(colSpan) || void 0;
    isOrdered = false;
    iconName = '';
    isSimple = !field || !this.setOrdering || !ordering;
    if (!isSimple) {
      isOrdered = ordering.sort_by === field;
      if (isOrdered) {
        iconName = ordering.sort_order === 'asc' ? 'caret-down' : 'caret-up';
      }
    }
    return this.setState({ isSimple: isSimple, isOrdered: isOrdered, iconName: iconName, title: title, colSpan: colSpan });
  },
  componentWillReceiveProps: function componentWillReceiveProps(nextProps) {
    return this.fixState(nextProps);
  },
  shouldComponentUpdate: function shouldComponentUpdate(nextProps, nextState) {
    return !_.isEqual(this.state, nextState);
  },
  render: function render() {
    var colSpan, content, icon, iconName, isOrdered, isSimple, tdClassName, title, titleKlass;
    tdClassName = this.props.className || '';
    var _state = this.state;
    isSimple = _state.isSimple;
    isOrdered = _state.isOrdered;
    iconName = _state.iconName;
    title = _state.title;
    colSpan = _state.colSpan;

    if (isSimple) {
      content = React.createElement(
        'span',
        { className: 'ColumnOrderedTitle__title-without-ordering' },
        title
      );
      return React.createElement(
        'td',
        { colSpan: colSpan || void 0, className: tdClassName + ' ColumnOrderedTitle__td' },
        content
      );
    }
    if (isOrdered) {
      icon = React.createElement('span', { className: 'fa fa-' + iconName });
      titleKlass = 'ColumnOrderedTitle__title-ordered';
    } else {
      icon = React.createElement(
        'span',
        null,
        '\xA0'
      );
      titleKlass = 'ColumnOrderedTitle__title-with-ordering';
    }
    return React.createElement(
      'td',
      { colSpan: colSpan || void 0, onClick: this.setOrdering, title: 'Order by \'' + title + '\'', className: tdClassName + ' ColumnOrderedTitle__td-active' },
      React.createElement(
        'span',
        { className: titleKlass },
        title
      ),
      React.createElement(
        'span',
        { className: 'ColumnOrderedTitle__icon' },
        icon
      )
    );
  }
});