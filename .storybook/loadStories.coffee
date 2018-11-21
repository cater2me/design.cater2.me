export default ->
  require './global.scss'

  storiesContext = require.context '../components', true, /\.(story|stories)\.(js|coffee)$/
  storiesContext.keys().forEach storiesContext
