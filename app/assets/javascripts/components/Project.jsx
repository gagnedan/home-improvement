class Project extends React.Component {

	constructor(props, context) {
		super(props, context)
		this.state = { editable: false };
		this.handleEdit = this.handleEdit.bind(this);
	}

	handleEdit() {
		if (this.state.editable) {
			// Field value reference
			var name = this.refs.name.refs.textbox.value;
			var description = this.refs.description.refs.textbox.value;
			var id = this.props.project.id;
			var user = this.props.project.user
			var is_public = this.props.project.is_public;
			var actual_effort = this.refs.actual_effort.refs.textbox.value;
			var estimated_effort = this.refs.estimated_effort.refs.textbox.value;
			var status = this.refs.status.refs.dropdown.value;
			var project = { id: id, name: name, description: description, user: user, is_public: is_public, actual_effort: actual_effort, estimated_effort: estimated_effort, status: status};
			this.props.handleUpdate(project);
		}
		this.setState({ editable: !this.state.editable });
	}


	render() {

		const edit_button_text = "Edit";
		const submit_button_text = "Submit";


		var name = this.state.editable ? (
			<TextBox ref="name" name="name" value={this.props.project.name}/>
		) : (
			<span>{this.props.project.name}</span>
		);

		var description = this.state.editable ? (
			<TextBox ref="description" name="description" value={this.props.project.description}/>
		) : (
			<span>{this.props.project.description}</span>
		);

		var estimated_effort = this.state.editable ? (
			<TextBox ref="estimated_effort" name="estimated_effort" value={this.props.project.estimated_effort}/>
		) : (
			<span>{this.props.project.estimated_effort}</span>
		);

		var actual_effort = this.state.editable ? (
			<TextBox ref="actual_effort" name="actual_effort" value={this.props.project.actual_effort}/>
		) : (
			<span>{this.props.project.actual_effort}</span>
		);

		var status = this.state.editable ? (
			<DropDown ref="status" selected={this.props.project.status} />
		) : (
			<span>{this.props.project.status}</span>
		);


		return (
			<tr>
				<td>{name}</td>
				<td>{description}</td>
				<td>{this.props.project.user.first_name} {this.props.project.user.last_name}</td>
				<td>{this.props.project.is_public.toString()}</td>
				<td>{estimated_effort}</td>
				<td>{actual_effort}</td>
				<td>{status}</td>
				<td>
					<button onClick={this.handleEdit}>
						{this.state.editable ? submit_button_text : edit_button_text}
					</button>
				</td>
				<td />
				<td />
			</tr>
		);
	}
}
