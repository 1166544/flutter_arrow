import React from 'react';
import Display from './Display';

class Ask extends React.Component {

	constructor() {
        super();
		this.state = {
			choices: [],
			answer: undefined
		};
	}

	componentWillMount() {
		this.setUpChoices();
	}

	componentWillReceiveProps() {
		this.setUpChoices();
	}

	setUpChoices() {
		const choices = Object.keys(this.props.question);
		choices.shift();
		this.setState({ 
			choices: choices,
			answer: sessionStorage.answer
		});
	}

	select(choice) {
		this.setState({ answer: choice });
		sessionStorage.answer = choice;
		this.props.emit('answer', {
			question: this.props.question,
			choice: choice
		});
	}

	addChoiceButton(choice, i) {

		const buttonTypes = ['primary', 'success', 'warning', 'danger'];

		return (
			<button key={i} 
			        className={"col-xs-12 col-sm-6 btn btn-" + buttonTypes[i]}
			        onClick={this.select.bind(null, choice)}>
				{choice}: {this.props.question[choice]}
			</button>
		);
	}

	render() {
		return (
			<div id="currentQuestion">

				<Display if={this.state.answer}>
					<h3>You answered: {this.state.answer}</h3>
					<p>{this.props.question[this.state.answer]}</p>
				</Display>

				<Display if={!this.state.answer}>
					<h2>{this.props.question.q}</h2>
					<div className="row">
						{this.state.choices.map(this.addChoiceButton)}
					</div>
				</Display>

			</div>
		);
	}
}

Ask.propTypes = {
    question: React.PropTypes.object.isRequired,
    emit: React.PropTypes.func.isRequired
}

module.exports = Ask;