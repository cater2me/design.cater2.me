path = require 'path'

module.exports =
  preset: 'zeropack-preset-coffee'
  context: path.join(__dirname, 'packages', 'popover', 'src')
  outputPath: path.join(__dirname, 'packages', 'popover', 'dist')
  # alias:
    # ReactComponents: path.join(__dirname, 'components')
