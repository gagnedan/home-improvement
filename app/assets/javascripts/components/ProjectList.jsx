class ProjectList extends React.Component {
	constructor(props, context) {
		super(props, context);
		this.state = { project: [] };
		this.onUpdate = this.onUpdate.bind(this);
	}

	componentDidMount() {
		$.getJSON("/projects", response => {
			this.setState({ project: response });
		});
	}

	onUpdate(project) {
		console.log(project);
		$.ajax({
			url: "/projects/" + project.id,
			type: "PUT",
			data: { project },
			dataType: "json",
			headers: {
				"X-CSRF-Token": $('meta[name="csrf-token"]').attr("content")
			},
			success: function() {
				// Get All object in the current project state
				// whthout the actual project updated
				var projects = this.state.project.filter((i) => { return i.id != project.id });
				
				// push the current project in the array
				projects.push(project)

				// re-order the array
				projects.sort(function(a,b){return a.id - b.id});

				// update state !
				this.setState({ project: projects });
			}.bind(this)
		});
	}

	render() {
		var projectNodes = this.state.project.map(function(project, index) {
			return (
				<Project
					key={index}
					project={project}
					handleUpdate={this.onUpdate.bind(this)}
				/>
			);
		}, this);

		return (
			<table className="table table-striped">
				<thead className="">
					<tr>
						<th>Name</th>
						<th>Description</th>
						<th>User</th>
						<th>Public</th>
						<th>Estimated Effort</th>
						<th>Actual Effort</th>
						<th>Status</th>
						<th colSpan="3">Action</th>
					</tr>
				</thead>
				<tbody>{projectNodes}</tbody>
			</table>
		);
	}
}
