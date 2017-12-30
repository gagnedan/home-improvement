class CommentForm extends React.Component {
	constructor(props) {
		super(props);
		this.handleSubmit = this.handleSubmit.bind(this);
	}

	handleSubmit() {
		var body = this.refs.body.value;
		var comment = { body: body };
		this.props.handleSubmit(comment);

		// clean textarea
		this.refs.body.value = "";
	}

	render() {
		return (
			<tr key={this.props.index}>
				<td className="col-sm-12">
					<div className="form-group">
						<label htmlFor="comment_body">Add Comment</label>
						<textarea
							id="body"
							className="form-control"
							rows="2"
							name="body"
							ref="body"
						/>
					</div>
					<div className="pull-right">
						<button
							onClick={this.handleSubmit}
							className="btn btn-primary"
							data-disable-with="Submit"
						>
							Create
						</button>
					</div>
				</td>
			</tr>
		);
	}
}
