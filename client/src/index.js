import React, { Component } from 'react'
import { render } from 'react-dom'

class HelloReact extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <h1>
          { this.props.title }
        </h1>
      </div>
    );
  }
}

render(
  <HelloReact title="Hello React !!!" />,
  document.getElementById('hello-react'))

HelloReact.propTypes = {
  title: React.PropTypes.string
};

HelloReact.defaultProps = {
  title: 'Hello React'
};
