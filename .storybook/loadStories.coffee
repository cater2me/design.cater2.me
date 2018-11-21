import packageJson from '../package.json'
console.log packageJson
export default () =>
  require './global.scss'

  storiesContext = require.context '../components', true, /\.(story|stories)\.(js|coffee)$/
  storiesContext.keys().forEach storiesContext
