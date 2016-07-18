util = require './util.coffee'
fs = require 'fs'

exports.print_files = ->
  fs.readdir '.', (error, files) ->
    files.forEach (file) ->
      if util.get_file_ext(file) == 'coffee'
        fs.readFile file, (error, data) ->
          if error
            return console.error(error)
          file_lines = data.toString().split('\n')
          console.log file + ':'
          console.log '---------------------------------------'
          for line, index in file_lines
            console.log '|' + index + '|' + line
          console.log '\n'
