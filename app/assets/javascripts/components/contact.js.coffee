@Contact = React.createClass
	render: ->
		React.DOM.tr null,
			React.DOM.td null, @props.contact.first_name
			React.DOM.td null, @props.contact.last_name
