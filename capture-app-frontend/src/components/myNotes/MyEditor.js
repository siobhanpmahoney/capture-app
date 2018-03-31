import React from 'react';
import {Editor, EditorState, RichUtils} from 'draft-js';

import { withRouter } from 'react-router'
import 'draft-js/dist/Draft.css';


const styles = {
  root: {
    fontFamily: 'Avenir',
    padding: 20,
    width: 600,
  },
  editor: {
    border: '1px solid #ccc',
    cursor: 'text',
    minHeight: 80,
    padding: 10,
  },
  button: {
    marginTop: 10,
    textAlign: 'center',
  },
};



class MyEditor extends React.Component {

  constructor(props) {
    super(props);
    this.state = {editorState: EditorState.createEmpty()};
    this.onChange = (editorState) => this.setState({editorState});
    this.logState = () => console.log(this.state.editorState.toJS());
    this.setDomEditorRef = ref => this.domEditor = ref;
  }
  //
  // componentDidMount(){
  //   this.domEditor.focus()
  // }

  handleKeyCommand(command, editorState) {
    const newState = RichUtils.handleKeyCommand(editorState, command);
    if (newState) {
      this.onChange(newState);
      return 'handled';
    }
    return 'not-handled';
  }

  _onBoldClick() {
    this.onChange(RichUtils.toggleInlineStyle(this.state.editorState, 'BOLD'));
  }

  _onItalicClick() {
    this.onChange(RichUtils.toggleInlineStyle(this.state.editorState, 'ITALIC'))
  }

  _onUnderlineClick() {
    this.onChange(RichUtils.toggleInlineStyle(this.state.editorState, 'UNDERLINE'))
  }


  render() {
    const toolbarConfig = {
  display: ['INLINE_STYLE_BUTTONS', 'BLOCK_TYPE_BUTTONS', 'LINK_BUTTONS', 'BLOCK_TYPE_DROPDOWN', 'HISTORY_BUTTONS'],
  INLINE_STYLE_BUTTONS: [
    {label: 'Bold', style: 'BOLD', className: 'custom-css-class'},
    {label: 'Italic', style: 'ITALIC'},
    {label: 'Underline', style: 'UNDERLINE'}
  ],
  BLOCK_TYPE_DROPDOWN: [
    {label: 'Normal', style: 'unstyled'},
    {label: 'Heading Large', style: 'header-one'},
    {label: 'Heading Medium', style: 'header-two'},
    {label: 'Heading Small', style: 'header-three'}
  ],
  BLOCK_TYPE_BUTTONS: [
    {label: 'UL', style: 'unordered-list-item'},
    {label: 'OL', style: 'ordered-list-item'}
  ]
}
    return (
      <div>Editor

      <div classNames="styleButtons" style={{fontFamily:"Droid Serif"}}>
        <button onClick={this._onBoldClick.bind(this)} style={{fontWeight:"600", fontFamily:"Droid Serif", width: "24px", padding:"4px", margin:"3px", borderRadius:"6px"}}> B </button>
        <button onClick={this._onItalicClick.bind(this)} style={{fontStyle:"italic", fontFamily:"Droid Serif", width: "24px", padding:"4px", margin:"3px", borderRadius:"6px"}}> I </button>
            <button onClick={this._onUnderlineClick.bind(this)} style={{textDecoration: "underline", fontFamily:"Droid Serif", width: "24px", padding:"4px", margin:"3px", borderRadius:"6px"}}> U </button>
      </div>
        <div style={styles.root}>
          <div style={styles.editor} onClick={this.focus}>
            <Editor
            toolbarConfig={toolbarConfig}
              editorState={this.state.editorState}
              onChange={this.onChange}
              placeholder="Enter some text..."
              ref={this.setDomEditorRef}
            />
          </div>

      <input
        onClick={this.logState}
        style={styles.button}
        type="button"
        value="Log State"
      />

    </div>
  </div>
    );
  }
}


export default withRouter(MyEditor);
