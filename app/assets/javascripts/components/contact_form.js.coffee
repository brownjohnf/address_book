@ContactForm = React.createClass
  getInitialState: ->
    first_name: ''
    last_name: ''

  handleSubmit: (e) ->
    e.preventDefault()
    $.post "/contacts", { contact: @state }, (data) =>
      @props.handleNewContact data
      @setState @getInitialState()
    , 'JSON'

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  valid: ->
    @state.first_name && @state.last_name

  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'row'
        React.DOM.div
          className: 'col s12'
          React.DOM.div
            className: 'row'
            React.DOM.div
              className: 'input-field col s4'
              React.DOM.input
                type: 'text'
                className: 'form-control'
                placeholder: 'First Name'
                name: 'first_name'
                value: @state.first_name
                onChange: @handleChange
              React.DOM.label
                for: 'first_name'
                'First Name'
            React.DOM.div
              className: 'input-field col s5'
              React.DOM.input
                type: 'text'
                className: 'form-control'
                placeholder: 'Last Name'
                name: 'last_name'
                value: @state.last_name
                onChange: @handleChange
              React.DOM.label
                for: 'last_name'
                'Last Name'
            React.DOM.div
              className: 'input-field col s3'
              React.DOM.button
                type: 'submit'
                className: 'btn btn-primary'
                disabled: !@valid()
                'Create contact'
