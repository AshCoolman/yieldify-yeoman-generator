Dom = require '<%= root_loc %>/dom.coffee'
utils = require '<%= root_loc %>/e2e.dom.utils.coffee'

{ wait, til } = utils


<%= name_pascal %> = (settings, after) ->
    Dom.call @, settings, after
    @name = '<%= name_camel %>'
    @
    
<%= name_pascal %>:: = Object.create Dom::,

    ###*
     * @type {String}   Folder for test data
    ###
    dataPath:
        enumerable: true
        value: "test/e2e/spec/<%= file_loc %>/data/"

    ###*
     * @type {Object}   CSS selectors for elements involved in the tests
    ###
    css:
        value:
            <%= name_camel %>: '[e2e-<%= name_dash %>]'


    ###*
    * Ensures the overlay appears and then dissappears
    ###
    exist: 
        get: =>
            ->
                el = @el '<%= name_camel %>'
                expect browser.isElementPresent el
                    .toEqual true


module.exports = <%= name_pascal %>