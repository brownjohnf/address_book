@Contacts = React.createClass
  getInitialState: ->
    contacts: @props.data

  getDefaultProps: ->
    contacts: []

  addContact: (contact) ->
    contacts = React.addons.update(@state.contacts, { $push: [contact] })
    @setState contacts: contacts

  updateContact: (contact, data) ->
    index = @state.contacts.indexOf contact
    contacts = React.addons.update(@state.contacts, { $splice: [[index, 1, data]] })
    @replaceState contacts: contacts

  deleteContact: (contact) ->
    index = @state.contacts.indexOf contact
    contacts = React.addons.update(@state.contacts, { $splice: [[index, 1]] })
    @replaceState contacts: contacts

  render: ->
    React.DOM.div
      className: 'contacts'
      React.DOM.h2
        className: 'title'
        'Contacts'
      React.createElement ContactForm, handleNewContact: @addContact
      React.DOM.hr null
      React.DOM.div
        'click to edit'
      React.DOM.table
        className: 'table table-hover'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'First Name'
            React.DOM.th null, 'Last Name'
            React.DOM.th null, 'Actions'
        React.DOM.tbody null,
          for contact in @state.contacts
            React.createElement Contact, key: contact.id, contact: contact, handleDeleteContact: @deleteContact, handleEditContact: @updateContact
