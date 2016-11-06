import React from 'react';

class Attendance extends React.Component {

	addMemberRow(member, i) {
		return (
			<tr key={i}>
				<td>{member.name}</td>
				<td>{member.id}</td>
			</tr>
		);
	}

	render() {
		return (
			<div>
				<h2>Attendance - {this.props.audience.length}</h2>
				<table className="table table-stripped">
					<thead>
						<tr>
							<th>Audience Member</th>
							<th>Socket ID</th>
						</tr>
					</thead>
					<tbody>
						{this.props.audience.map(this.addMemberRow)}
					</tbody>
				</table>
			</div>
		);
	}
}

Attendance.propTypes = {
  audience: React.PropTypes.array.isRequired
};

module.exports = Attendance;