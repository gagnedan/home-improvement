class Comment extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			project_id: props.project_id,
			comments: [] 
		};
	}

	componentDidMount() {
		var project_id = this.props.project_id
		$.getJSON("/projects/" + project_id + "/comments", response => {
			this.setState({ comments: response });
		});
	}

	render() {
	var projectNodes = this.state.comments.map(function(comment, index) {
			return (
              <tr key={index}>
                <td className="col-sm-12">
                  <div><i className="glyphicon glyphicon-user"></i>
                    <span className="push-5-l">{ comment.user.first_name } { comment.user.last_name }</span>
                  </div>
                  <div className="push-10-t">
                    {comment.body}
                  </div>
                </td>
              </tr>
			);
		}, this);

		return(<table className="table bg-gray-lighter push-10-t"><tbody>{projectNodes}</tbody></table>)
	}
}
