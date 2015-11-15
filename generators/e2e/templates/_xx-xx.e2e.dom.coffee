Dom = require '<%= root_loc %>/dom.coffee'
utils = require '<%= root_loc %>/e2e.dom.utils.coffee'

{ wait, til } = utils


<%= namePascal %> = (settings, after) ->
    Dom.call @, settings, after
    @dom = {}
    @name = '<%= nameCamel %>'
    @
    
<%= namePascal %>:: = Object.create Dom::,

    ###*
     * @type {String}   Folder for test data
    ###
    dataPath:
        enumerable: true
        value: "test/e2e/spec/<%= fileLoc %>/data/"

    ###*
     * @type {Object}   CSS selectors for elements involved in the tests
    ###
    css:
        value:
            <%= nameCamel %>: '[e2e-<%= nameDash %>]'


    ###*
    * Ensures the overlay appears and then dissappears
    ###
    exist: 
        get: =>
            ->
                el = @el '<%= nameCamel %>'
                expect browser.isElementPresent el
                    .toEqual true

    ###*
     * Small "programs" built from children methods (on `this.dom`)
    ###
    cmds:
        get: =>
            ->
                task: -> #

module.exports = <%= namePascal %>