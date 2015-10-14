@Contacts = React.createClass
  getInitialState: ->
    contacts: @props.data

  getDefaultProps: ->
    contacts: []

  addContact: (contact) ->
    contacts = @state.contacts.slice()
    contacts.push contact
    @setState contacts: contacts

  render: ->
    React.DOM.div
      className: 'contacts'
      React.DOM.h2
        className: 'title'
        'Contacts'

      React.createElement ContactForm, handleNewContact: @addContact
      React.DOM.hr null
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'First Name'
            React.DOM.th null, 'Last Name'
        React.DOM.tbody null,
          for contact in @state.contacts
            React.createElement Contact, key: contact.id, contact: contact
