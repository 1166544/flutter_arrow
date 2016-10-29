var React = require('react');
var Link = require('react-router').Link;

var Join = React.createClass({

	join() {
		var memberName = React.findDOMNode(this.refs.name).value;
		this.props.emit('join', { name: memberName });
	},

	render() {
		return (
			<form action="javascript:void(0)" onSubmit={this.join}>

				<label>Full Name</label>
				<input ref="name"
					   className="form-control"
				       placeholder="enter your full name..."
				       required />
				<button className="btn btn-primary">Join</button>
				<Link to="/speaker">Start the presentation</Link>
				<Link to="/board">Go to the board</Link>
			</form>
		);
	}

});

module.exports = Join;