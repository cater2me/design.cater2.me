import PropTypes from 'prop-types'
import React from 'react'
import classnames from 'classnames'

class SpinnerSvg extends React.PureComponent
  @propTypes:
    className: PropTypes.string
    size: PropTypes.number
    thickness: PropTypes.number
    color: PropTypes.string
    trackColor: PropTypes.string
    style: PropTypes.object

  @defaultProps:
    thickness: 3.5
    size: 40
    color: '#ffd73b'
    # trackColor: 'transparent'

  renderSpinner: ->
    {color, trackColor, thickness, size} = @props
    styleSheet = document.styleSheets[0]
    # for test with jest document.styleSheets is empty
    if styleSheet
      keyframes = "@keyframes c2me-spinner-svg-#{size} {
        0% {
          transform: rotate(0deg);
          stroke-dashoffset: #{0.66 * size}px;
        }
        50% {
          transform: rotate(720deg);
          stroke-dashoffset: #{Math.PI * size}px;
        }
        100% {
          transform: rotate(1080deg);
          stroke-dashoffset: #{0.66 * size}px;
        }
      }"
      styleSheet.insertRule(keyframes, styleSheet.cssRules.length)

    <g>
      <rect
        fill="transparent"
        stroke={trackColor}
        strokeWidth={thickness}
        width={size - thickness}
        height={size - thickness}
        x={thickness / 2}
        y={thickness / 2}
        rx={size}
        ry={size}
      />
      <circle
        style={{
          transformOrigin: "#{0.5 * size}px #{0.5 * size}px 0",
          animationName: "c2me-spinner-svg-#{size}",
          animationTimingFunction: 'linear',
          animationDuration: '2s',
          animationDelay: '0.0s',
          animationIterationCount: 'infinite',
        }}
        fill="transparent"
        stroke={color}
        strokeWidth={thickness}
        strokeLinecap="round"
        strokeDasharray={Math.PI * size}
        cx={"#{size / 2}"}
        cy={"#{size / 2}"}
        r={"#{size / 2 - thickness / 2}"}
      />
    </g>

  render: ->
    {
      className,
      size,
      style,
      color,
      trackColor,
      ...other
    } = @props
    finalClassName = classnames('c2me-spinner-svg', className)
    finalSpinnerClassName = classnames('c2me-spinner-svg__spinner', {
      ["#{className}__spinner"]: className,
    })
    blockSize =
      width: "#{size}px"
      height: "#{size}px"

    <div
      className={finalClassName}
      style={{
        ...blockSize,
        ...style,
      }}
      {...other}
    >
      <svg className={finalSpinnerClassName} style={blockSize}>
        {@renderSpinner()}
      </svg>
    </div>

export default SpinnerSvg