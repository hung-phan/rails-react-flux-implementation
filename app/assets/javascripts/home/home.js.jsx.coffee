###* @jsx React.DOM ###
define [
  "react-with-addons"
], (React) ->
  React.createClass
    getInitialState: ->
      text: "Click Me!"

    clickMeUpdate: (e) ->
      @setState text: @state.text.split("").reverse().join("")
      return

    render: ->
      `<div className="container">
          <div className="header">
              <ul className="nav nav-pills pull-right">
                  <li className="active"><a href="#">Home</a>
                  </li>
                  <li><a href="#">About</a>
                  </li>
                  <li><a href="#">Contact</a>
                  </li>
              </ul>
              <h3 className="text-muted">ReactJs <i className="fa fa-cog fa-spin"></i></h3>
          </div>

          <div className="jumbotron">
              <h1>'Allo, 'Allo!</h1>
              <p className="lead">Always a pleasure scaffolding your apps.</p>
              <p><a className="btn btn-lg btn-success" href="#">Splendid!</a>
              </p>
          </div>

          <div className="row marketing">
              <div className="col-lg-6">
                  <h4>HTML5 Boilerplate</h4>
                  <p>HTML5 Boilerplate is a professional front-end template for building fast, robust, and adaptable web apps or sites.</p>

                  <h4>Bootstrap</h4>
                  <p>Sleek, intuitive, and powerful mobile first front-end framework for faster and easier web development.</p>

                  <h4>Modernizr</h4>
                  <p>Modernizr is an open-source JavaScript library that helps you build the next generation of HTML5 and CSS3-powered websites.</p>

                  <h4>ReactJs</h4>
                  <h1 onClick={this.clickMeUpdate}>{this.state.text}</h1>
              </div>
              <div className="col-lg-6">
                  <h4>RequireJs</h4>
                  <p>RequireJS is a JavaScript file and module loader. It is optimized for in-browser use, but it can be used in other JavaScript environments, like Rhino and Node. Using a modular script loader like RequireJS will improve the speed and quality
                      of your code.</p>
              </div>
          </div>

          <div className="footer">
              <p>♥ from the Yeoman team</p>
          </div>

      </div>`
