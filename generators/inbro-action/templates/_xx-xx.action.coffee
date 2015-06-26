create = (bt) =>

    # Action info
    name = "<%= name_camel %>"
    FAIL_SAFE = name + " timed out"

    # Action
    <%= name_camel %>: (input) =>

        { } = input

        # State
        outputs = []

        addOutput = (state, details) =>
            outputs.push { state, details }

        # Work
        new Promise (fulfill, reject) =>

            fulfill { outputs, duration }

            setTimeout (=> reject FAIL_SAFE), 10*1000

`export default create`


###*

    # Overview 
    
    - Run test, collect pass/fail with details (Doesn't report)
    - Async operations are promised
    - Stupid
    - Can be messy, but must be short


    # Usage

    Actions build an array of output objects (to be injected outside the action)
    The recommended output object: { state: true|false, details: "verbose explanation"}


    # Steps

    1. Add to asynModules:

    importAndExtend bt , 'actions' , 'action/test-campaign-modal.action'        


    2. Perform the tests 
    
    asyncTests.push actions.clientSeesOnlyWhatTheyShould().then (testResult) =>
        { outputs } = testResult
        _.each testResult.outputs (r) ->addTest "[X1]", "I choose this in mainbro", r.state, r.state.details
        
    
    # Concerns

    ## Not instanced:

    The action is not instanced at every invovation, so there is some shared memory.
    I'm a bit worried this might limit parrallel tests.
    Better to have a function that returns an instance with everything encapsulated.

    # Design consideration:

    ## Test crashing:

    I think if one tests crashes, it should crash the entire suite, rather than limping along.
    This will make it easier to 

    ## Teardown:

    Unsure about this, but we may run into a situation were tests neeed to rewind themselves

    # Future    

    ## Instrumentation
    
    We will need to add things like `test duration` to return back to the `inbro.e2e` protractor tasks
    This way we can see if the tests sudden go from taking ~10-12 seconds, down to 4 seconds - something broke.
    
    ## Test suite

    We will end up making collections of tests (multiple `main.inbro`)
        - overview.inbro.coffee
        - tables.inbro.coffee

    And these will be configured with different settings:e.g. 
        - doInBrowserTests(clientJson)
        - doInBrowserTests(fullDevTestJson)






###