class CommentForm extends React.Component {
	constructor(props) {
		super(props);
		project_id: props.project_id
		comment: props.comment
		this.handleSubmit = this.handleSubmit.bind(this);
	}

	componentDidMount() {

	}

	handleSubmit(event) {
    event.preventDefault();
    var project_id = this.props.project_id
    const data = event.target.comment_body.value;
    
    

    $.ajax({
			url: "/projects/" + project_id + "/comments",
			type: "POST",
			data: {"comment[body]": data },
			headers: {
				"X-CSRF-Token": $('meta[name="csrf-token"]').attr("content")
			}
		});
  }

	render() {
		return (
			<form
				className="new_comment"
				id="new_comment"
				onSubmit={this.handleSubmit}
			>
				<div className="form-group">
					<label htmlFor="comment_body">Ajouter un commentaire</label>
          <textarea id="comment_body" className="form-control" rows="2" name="comment[body]"></textarea>
        </div>
       	<div className="pull-right">
					<input type="submit" name="commit" value="Submit" className="btn btn-primary" data-disable-with="Submit" />
				</div>
			</form>
		);
	}
}
