path = require 'path'

module.exports =
  preset: 'zeropack-preset-coffee'
  context: path.join(__dirname, 'packages', 'storybook', 'src')
  outputPath: path.join(__dirname, 'packages', 'storybook', 'dist')
  # alias:
    # ReactComponents: path.join(__dirname, 'components')
