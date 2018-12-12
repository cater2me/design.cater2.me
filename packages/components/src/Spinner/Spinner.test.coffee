import React from 'react'
import { shallow } from 'enzyme'
import Spinner from './Spinner'

describe 'Spinner suite', () ->
  className = 'custom-class-name'
  blockName = 'custom-block-name'
  size = 20
  
  it 'should have the correct defaultProps', () ->
    defaultProps = {
      thickness: 3.5,
      size: 40,
      color: '#3e3c3d',
    }
    expect(Spinner.defaultProps).toEqual(
      expect.objectContaining(defaultProps),
    )

  it 'should render spinner container with props', () ->
    custom = 'custom'
    background = '#ff0000'
    wrapper = shallow(
      <Spinner
        className={className}
        size={size}
        custom={custom}
        style={{ background }}
      />,
    )
    expect(wrapper.hasClass(className)).toEqual(true)
    expect(wrapper.prop('custom')).toEqual(custom)
    expect(wrapper.prop('style')).toMatchObject({ background })
    expect(wrapper.prop('style')).toMatchObject({
      width: "#{size}px",
      height: "#{size}px",
    })
  
  it 'should render spinner with props', () ->
    wrapper = shallow(
      <Spinner 
        className={className}
        size={size}
        blockName={blockName}
      />
    )
    spinnerWrapper = wrapper.children()
    expect(spinnerWrapper.hasClass(`${className}__spinner`)).toEqual(true)
    expect(spinnerWrapper.prop('style')).toMatchObject({
      width: "#{size}px",
      height: "#{size}px",
    })
    expect(spinnerWrapper.children().type()).toEqual('g')
    expect(
      spinnerWrapper
        .children()
        .childAt(0)
        .type(),
    ).toEqual('rect')
    expect(
      spinnerWrapper
        .children()
        .childAt(1)
        .type(),
    ).toEqual('circle')
  
  it 'should insert style sheet rule', () ->
    insertRuleMock = jest.fn()
    styleSheetsMock =
      insertRule: insertRuleMock,
      cssRules: { length: 2 },
    document.styleSheets[0] = styleSheetsMock
    shallow(<Spinner size={size} />)
    delete document.styleSheets[0]
    expect(insertRuleMock).toHaveBeenCalledTimes(1)
    expect(insertRuleMock).toHaveBeenCalledWith(
      expect.stringContaining("@keyframes c2me-spinner-#{size}"),
      styleSheetsMock.cssRules.length,
    )
  
  it 'should call renderSpinner once on render', () ->
    wrapper = shallow(<Spinner />)
    renderMock = jest.fn()
    wrapper.instance().renderSpinner = renderMock
    wrapper.setProps({ size })
    expect(renderMock).toHaveBeenCalledTimes(1)
  

  it 'should return a group with correct circle and rect', () ->
    color = '#3d84d1'
    trackColor = '#d6e5f5'
    thickness = 10
    wrapper = shallow(
      <Spinner
        color={color}
        trackColor={trackColor}
        thickness={thickness}
        size={size}
      />,
    )
    group = wrapper.children().children()
    rectProps = group.childAt(0).props()
    circleProps = group.childAt(1).props()
    expect(rectProps).toEqual(
      expect.objectContaining({
        fill: 'transparent',
        stroke: trackColor,
        strokeWidth: thickness,
        width: size - thickness,
        height: size - thickness,
        x: thickness / 2,
        y: thickness / 2,
        rx: size,
        ry: size,
      }),
    )
    expect(circleProps).toEqual(
      expect.objectContaining({
        fill: 'transparent',
        strokeLinecap: 'round',
        stroke: color,
        strokeWidth: thickness,
        strokeDasharray: Math.PI * size,
        cx: `${size / 2}`,
        cy: `${size / 2}`,
        r: `${size / 2 - thickness / 2}`,
      }),
    )
    expect(circleProps.style).toEqual(
      expect.objectContaining({
        transformOrigin: `${0.5 * size}px ${0.5 * size}px 0`,
        animationName: `nx-spinner-svg-${size}`,
        animationTimingFunction: 'linear',
        animationDuration: '2s',
        animationDelay: '0.0s',
        animationIterationCount: 'infinite',
      }),
    )