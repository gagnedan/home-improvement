class DropDown extends React.Component {
  constructor(props) {
    super(props);
    this.state = { value: this.props.selected };
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange() {
    var value = this.refs.dropdown.value;
    this.setState({ value: value });

  }

  render() {
    return (
      <select
        name="status"
        value={this.state.value}
        ref="dropdown"
        onChange={this.handleChange}
      >
        <option value="created">created</option>
        <option value="started">started</option>
        <option value="stopped">stopped</option>
        <option value="completed">completed</option>
      </select>
    );
  }
}
