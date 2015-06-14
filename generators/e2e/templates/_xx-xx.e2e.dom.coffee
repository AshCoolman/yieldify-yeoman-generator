fs = require 'fs'
nl = '\r\n'
EOL = require('os').EOL
Dom = require '<%= root_loc %>/dom.coffee'

wait = browser.wait
ptr = protractor
til = ptr.until

<%= name_pascal %> = (settings, after) ->
    Dom.call @, settings, after
    @
    
<%= name_pascal %>:: = Object.create Dom::,

    ###*
     * @type {String}   Folder that test data
    ###
    dataPath:
        enumerable: true
        value: "test/e2e/spec/<%= file_loc %>/data/"

    ###*
     * @type {Object}   CSS selectors for elements involved in the tests.
    ###
    css:
        value: cssHandle: '[e2e-semantic-handle-attr]'

    ###*
     * Ensures the overlay appears and then dissappears
    ###
    isPresent:
        value: ->
            @flow.execute =>
                describe "Presence", =>
                    el = @el 'cssHandle'
                    it "exists", =>
                        expect browser.isElementPresent el
                            .toEqual true

module.exports = <%= name_pascal %>