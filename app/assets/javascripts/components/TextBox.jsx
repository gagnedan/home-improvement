class TextBox extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			name: this.props.name,
			value: this.props.value
		};
	}

	render() {
		return (
			<input
				type="text"
				name={this.state.name}
				ref="textbox"
				defaultValue={this.state.value}
			/>
		);
	}
}
