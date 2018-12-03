import React from 'react'
import PropTypes from 'prop-types'
import classnames from 'classnames'

import './Logo.scss'

Logo = ({variant, className}) ->
  <div className={classnames 'c2me-logo', className, 
    "c2me-logo--#{variant}": variant
  }>
    <svg viewBox='0 0 841.9 595.3'>
      <path className='st0' d='M393.2,283.3c-14.3,1.6-26.1-1.6-35.4-12.9c-21.2,18.3-45.7,22.5-72.1,16.5c-21.4-4.8-38.3-17-51.2-34.5 c-25.9-35-21.8-83.3,8.5-115.1c29.2-30.6,82.2-37,114.7-8.1c9.2-10.9,21.1-14.5,35.5-12.5C393.2,172.2,393.2,227.5,393.2,283.3z M352,199.5c-0.1-25.1-19.8-44.7-44.9-44.7c-25.2,0-45.7,20.2-45.5,44.9c0.2,25.5,20.5,45.7,45.7,45.5 C332.3,245,352.1,224.8,352,199.5z'/>
      <path className='st0' d='M585.5,214.6c6.6,16.2,17.3,26.2,33.4,29.5c16.3,3.4,30.5-1.2,42.2-13.1c1.5-1.6,3-2.8,5.4-2.7 c13.5,0.1,27.1,0,40.6,0c1.6,0,3.1,0,4.2,1.8c1,2.3-0.6,4.3-1.4,6.3c-15.1,35.2-53.4,56.2-91.5,52.5c-37.3-3.6-71.3-35.3-78.3-72.2 c-10.1-53.2,30.4-104.6,84.5-106c30.3-0.8,55.3,9.8,73.4,34.2c9.6,12.8,14.6,27.5,11.1,44.1c-2.9,13.8-14,24.6-28,25.1 c-19.9,0.7-39.8,0.5-59.7,0.6C609.9,214.6,598.3,214.6,585.5,214.6z M586.3,182.7c25,0,48.9,0.1,72.8-0.1c4.8,0,7.2-4,5.5-8.5 c-0.6-1.7-1.9-3.4-3.1-4.8c-11.1-12.4-25.3-16.7-41.3-14C604.5,158,593.6,167.4,586.3,182.7z'/>
      <path className='st0' d='M188.1,224.7c3.3,1.2,2.9,3.5,2.9,5.6c0,11.4,0.1,22.8,0,34.2c-0.1,10.8-3.5,15.5-13.7,18.8 c-76.2,24.9-145.1-25.1-158-91.1c-11.9-61.1,23.6-120.5,83-139.4c27.7-8.8,62.4-6.2,88.3,6.8c0,17.2,0,34.7,0,51.9 c-3.5,1.6-5.1-0.8-7-2.3C143.4,77.9,82.1,97.1,67,145.7c-9.9,31.9,1.6,65.1,29.3,84.8c25.2,17.9,61.3,16.9,87.1-2.5 C184.9,226.9,186.5,225.8,188.1,224.7z'/>
      <path className='st0' d='M474.5,116.2c14.3,0,27.8,0,42.2,0c-0.1,12.1,1,23.6-0.7,35c-0.9,5.8-6.8,9-14.5,9.1c-8.7,0.1-17.4,0-25.7,0 c-1.7,1.6-1.2,3.2-1.2,4.7c0,20.3-0.1,40.6,0,60.9c0,11.7,4.1,16.4,15.5,18.6c8.7,1.7,16.8-0.3,25.9-4.6c1.6,16,0.5,31.2,0.7,46.2 c-35.1,10.9-85-6.6-85.9-55.6c-1-52.2-0.3-104.4-0.3-156.5c0-1,0.2-1.9,0.3-3.4c13-2.1,24.2,0.7,33.7,10.2 C474,90.5,475.4,102.5,474.5,116.2z'/>
      <path className='st0' d='M825,113.1c0,15.2,0,30,0,44.6c-2.3,1.6-3.9,0.6-5.7-0.2c-6.9-3.4-14.3-3.3-21.5-2.2 c-10.1,1.6-14.5,7.1-14.5,17.6c-0.1,26.3,0,52.5,0,78.8c0,8.5,0,17,0,25.5c0,1.9,0.5,3.9-1.3,6c-13.6,0-27.6,0-41.7,0 c-1.5-1.2-1.1-3.1-1.1-4.7c0-35.9-0.3-71.8,0.1-107.8c0.4-33.3,25.6-58.6,58.9-59.9C807,110.5,815.8,110,825,113.1z'/>
      <path className='st0' d='M152,500.7c17,0,33,0,49,0c11.3,0,16,4.7,16.1,16c0,10,0,19.9,0,29.4c-2.1,2.2-4.2,1.6-6.1,1.6 c-42.9,0-85.8,0-128.7,0.1c-5.3,0-9.6-1.3-12.1-6.4c-2.6-5.2-0.7-9.3,2.4-13.5c31.2-41.7,62.3-83.4,93.4-125.1 c5.3-7,9.4-14.5,8.1-23.7c-2-13.4-12-22.6-25.2-23.7c-12.2-1-23.5,6.8-27.7,19.2c-0.5,1.5-1,2.9-1.6,4.8c-15.2,0-30.3,0-45.7,0 c-1.5-6.9,0.4-13.1,2.4-19.1c11.4-33.6,40.5-54,75.3-51.7c37.2,2.4,64.8,29.5,69.1,65c2.7,22-4.4,40.7-17.3,57.9 c-16.4,21.9-32.8,43.9-49.2,65.8C153.7,498,153.2,498.8,152,500.7z'/>
      <path className='st0' d='M371,509.8c-14.1,0-28.1,0-41.9,0c-1.8-1.6-1.4-3.5-1.4-5.2c0-34.9-0.2-69.8,0-104.6 c0.2-29.9,16.1-52.3,44.9-60.9c29-8.6,57.2-6.7,83.1,11.7c20.8-15.9,44.8-18.6,70-14.9c36,5.3,57.3,29.3,57.9,66 c0.6,34.3,0.1,68.6,0.1,102.9c0,1.6,0,3.1-1.5,5.1c-10.4,0-21.4,0.5-32.2-0.2c-5.8-0.4-9.8-4.6-10.8-10.8c-0.4-2.5-0.5-5.1-0.5-7.6 c0-29-0.2-58,0.1-87c0.2-14.9-3.4-21.1-20.1-24.3c-8.5-1.6-17.2-1.3-25.6,1c-10.7,3-14.9,8.7-15,20.1c-0.1,33.7,0,67.4-0.1,101.1 c0,2.3,0.6,4.7-1.2,7.3c-13.9,0-28.1,0-42.4,0c-1.9-2.1-1.2-4.8-1.2-7.2c0-32.5,0-65.1,0-97.6c0-16.5-4.6-22.4-20.8-24.8 c-9.1-1.4-18.4-1.4-27.3,2c-9,3.4-12.7,8.6-12.7,18.2c0,34.1,0,68.2-0.1,102.3C372.4,504.7,373.1,507.2,371,509.8z'/>
      <path className='st0' d='M656.9,440c11.1,32,51,41.1,74.9,18c3.1-3,6-4.3,10.3-4.2c11.9,0.3,23.9,0.1,35.9,0.1c2.1,0,4.4-0.6,6,1.4 c1.3,2.3-0.2,4.2-0.9,6.1c-14.7,35.8-54.2,57.8-92.8,54c-38.3-3.7-72.5-36.3-79.5-73c-10.3-54.3,30.7-106.3,85.9-107.7 c30.7-0.8,56,10.2,74.3,34.9c9.5,12.8,14.5,27.6,11.1,44.2c-3,14.3-14.2,25.3-28.8,25.7c-26.2,0.7-52.5,0.4-78.8,0.6 C668.8,440,663.2,440,656.9,440z M657.3,407.7c25.3,0,49.3,0.1,73.4-0.1c5.5,0,8-4.3,5.8-9.3c-0.8-1.7-2-3.3-3.3-4.7 c-11.1-12-25.2-16.2-40.9-13.8C676,382.4,664.8,392,657.3,407.7z'/>
      <circle className='st1' cx='272.4' cy='474.4' r='34.7' />
    </svg>
  </div>

Logo.propTypes =
  className: PropTypes.string
  variant: PropTypes.oneOf(['white', 'yellow-white', 'yellow-black', 'black']).isRequired

Logo.defaultProps =
  variant: 'black'

export default Logo