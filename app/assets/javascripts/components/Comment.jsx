class Comment extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			project_id: props.project_id,
			is_admin: props.is_admin,
			comments: []
		};
		this.onSubmit = this.onSubmit.bind(this);
	}

	onSubmit(comment) {
		$.ajax({
			url: "/projects/" + this.props.project_id + "/comments",
			type: "POST",
			data: { comment },
			dataType: "json",
			headers: {
				"X-CSRF-Token": $('meta[name="csrf-token"]').attr("content")
			},

			success: function(response) {
				// Get All object in the current comment state
				// whthout the actual project updated
				var comments = this.state.comments.filter(i => {
					return i.id != comment.id;
				});

				// push the current comment in the array
				comments.push(response);

				// update state !
				this.setState({ comments: comments });
			}.bind(this)
		});
	}

	componentDidMount() {
		var project_id = this.props.project_id;
		this.serverRequest = $.getJSON("/projects/" + project_id + "/comments", response => {
			this.setState({ comments: response });
		});
	}

	componentWillUnmount() {
		alert('unmount');
    this.serverRequest.abort();
  }


	render() {
		var allComments = this.state.comments.map(function(comment, index) {
			return <CommentItem key={index} comment={comment} />;
		}, this);

		
		var commentForm = null;
		if(!this.state.is_admin) {
			commentForm = <CommentForm
						key={this.props.project_id}
						project_id={this.props.project_id}
						handleSubmit={this.onSubmit.bind(this)}
					/>;
		}


		return (
			<table className="table push-10-t">
				<tbody>
					{allComments}
					{commentForm}
				</tbody>
			</table>
		);
	}
}
