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
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'First Name'
          name: 'first_name'
          value: @state.first_name
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Last Name'
          name: 'last_name'
          value: @state.last_name
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Create contact'
