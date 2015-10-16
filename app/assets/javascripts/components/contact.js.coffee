@Contact = React.createClass
  getInitialState: ->
    edit: false

  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  handleEdit: (e) ->
    e.preventDefault()
    data =
      first_name: React.findDOMNode(@refs.first_name).value
      last_name: React.findDOMNode(@refs.last_name).value
    # jQuery doesn't have a $.put shortcut method either
    $.ajax
      method: 'PUT'
      url: "/contacts/#{ @props.contact.id }"
      dataType: 'JSON'
      data:
        contact: data
      success: (data) =>
        @setState edit: false
        @props.handleEditContact @props.contact, data

  handleDelete: (e) ->
    e.preventDefault()
    # yeah... jQuery doesn't have a $.delete shortcut method
    $.ajax
      method: 'DELETE'
      url: "/contacts/#{ @props.contact.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteContact @props.contact

  contactRow: ->
    React.DOM.tr null,
      React.DOM.td
        className: ''
        onClick: @handleToggle
        @props.contact.first_name
      React.DOM.td
        onClick: @handleToggle
        @props.contact.last_name
      React.DOM.td
        className: 'text-right'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'

  contactForm: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.contact.first_name
          ref: 'first_name'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.contact.last_name
          ref: 'last_name'
      React.DOM.td
        className: 'text-right'
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleEdit
          'Update'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleToggle
          'Cancel'

  render: ->
    if @state.edit
      @contactForm()
    else
      @contactRow()
