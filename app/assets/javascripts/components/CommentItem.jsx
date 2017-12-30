class CommentItem extends React.Component {
	constructor(props, context) {
		super(props, context);
	}

	render() {
		return (
			<tr key={this.props.index}>
				<td className="col-sm-12">
					<div>
						<i className="glyphicon glyphicon-user" />
						<span className="push-5-l">
							{this.props.comment.user.first_name}{" "}
							{this.props.comment.user.last_name}
						</span>
					</div>
					<div className="push-10-t">{this.props.comment.body}</div>
				</td>
			</tr>
		);
	}
}
