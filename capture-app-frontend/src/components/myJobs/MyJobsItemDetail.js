import React from 'react'
import { HashRouter } from 'react-router-dom'
import { withRouter } from 'react-router'
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import * as Actions from '../../actions'
import NotesContainer from '../myNotes/NotesContainer'
import NoteCreate from '../myNotes/NoteCreate'



import BookmarkList from '../myBookmarks/BookmarkList'
import MyJobsDetailDashboard from './MyJobsDetailDashboard'
import MyJobsResourceFeedInterviews from './MyJobsResourceFeedInterviews'
import MyCompanyDetail from '../myCompanies/MyCompanyDetail'


class MyJobsItemDetail extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      job: null,
      company: [],
      notes: [],
      bookmarks: [],
      displayNote: {},
      savedInfoDisplay: {},
      noteStatusNew: false
    }
  }

  componentDidMount() {
    console.log(this.props)
    let p = this.props
    console.log(p.jobs)

    let j = this.props.job
    let c = this.props.savedCompanies.find((co) => {
      return co.id == this.props.job.company_id
    })
    let job_notes = this.props.savedNotes.filter((note) => {
      return note.company_id == j.company_id
    })
    let job_bks = this.props.savedBookmarks.filter((bk) => {
      return bk.company_id == j.company_id
    })
    // let company
    this.setState({
      job: j,
      company: c,
      notes: job_notes,
      bookmarks: job_bks,
      savedInfoDisplay: "job",
      noteStatusNew: true
    })
    // let url = `http://localhost:3000/api/v1/users/${this.props.currentUser.user.id}/jobs/${this.props.match.params.jobId}`
    // fetch(url)
    // .then(response => response.json())
    // .then(json => {
    //   this.setState({
    //     job: json,
    //     company: json.company,
    //     notes: json.notes,
    //     bookmarks: json.bookmarks,
    //     savedInfoDisplay: "job",
    //     noteStatusNew: true
    //     });
    //   });

  }
        // job: this.props.savedJobs.find((job) => job.id == this.props.jobId),
        // company: this.props.savedCompanies.find((company) => company.id == this.props.job.company_id),
        // notes: json.notes.sort((a,b) => b.id - a.id),
      //   fetch(`https://api-v2.themuse.com/companies/${json.company.id}`)
      //     .then(r => r.json())
      //     .then(thisJson => this.setState({
      //       company: thisJson
      //     }));

    // let notes = json.notes.filter((note) => note.job_id === json.id)


  contents = () => {
    return {
      __html: this.state.job.contents
    };
  }

  // };
  formattedDate = () => {
    let pubDate = new Date(this.state.job.date_saved)
    return pubDate.toLocaleDateString()
  }

  deleteJob = () => {
    let userId = this.props.currentUser.user.id
    let jobId = this.state.job.id
    this.setState({
      saved: false
    })

    this.props.deleteJob(userId, jobId)
    window.location = '/myjobs'

  }

  dashboardListener = (event) => {
    console.log("dashboardConfessional")
    let value = event.target.type === 'checkbox' ? event.target.checked : event.target.value
    let name = event.target.name

    let currentJobState = this.state.job
    console.log(currentJobState[name] = value)
    currentJobState[name] = value
    this.setState({
      job: currentJobState
    })
  }

  dashboardEditSubmit = (event) => {
    event.preventDefault()
    let userId = this.props.currentUser.user.id
    let updatedJob = this.state.job
    this.props.editJob(userId, updatedJob)
  }

  renderNewNoteForm = (event) => {
    event.preventDefault()

    let clearDisplayNote = {}
    this.setState({
      displayNote: clearDisplayNote,
      noteStatusNew: true
    })
  }

  noteTypeRender = () => {

    if (this.state.noteStatusNew) {
      return (
        <div className="newNoteForm">
          <NoteCreate noteEditSubmit={this.noteEditSubmit} noteEditListener={this.noteEditListener} addTestNewNote={this.addTestNewNote}/>
        </div>
      )
    } else {
      return (
        <div>
          <form>
            <button onClick={this.noteEditSubmit}>Save</button><textarea className="noteTitle" name="title" value={this.state.displayNote.title} type="contentEditable" onChange={this.noteEditListener}>
            </textarea>

            <textarea className="noteContent" name="content" value={this.state.displayNote.content} type="contentEditable" onChange={this.noteEditListener}>
            </textarea>

          </form>
        </div>
      )
    }
  }

  addTestNewNote = (event) => {
    event.preventDefault()
    console.log(this.state.displayNote, this.props.currentUser.id, this.state.company.id, this.state.job.id)
    this.props.addNewNote(this.state.displayNote, this.props.currentUser.user.id, this.state.company.id, this.state.job.id)
  }


  displayNote = (event) => {

    event.preventDefault()
    let selectedNote = this.relevantNotes().find((note) => note.id == event.target.id)

    this.setState({
      displayNote: selectedNote,
      noteStatusNew: false
    })
  }

  noteEditListener = (event) => {
    let value = event.target.value
    let name = event.target.name
    let currentNoteState = Object.assign({}, this.state.displayNote)
    currentNoteState[name] = value
    this.setState({
      displayNote: currentNoteState
    })
  }

  // (selectedNote, noteUserId, noteJobId, noteCompanyId)

  noteEditSubmit = (event) => {
    event.preventDefault()
    // window.location = `/myjobs/${this.state.jobId}`
    this.props.editNote(this.state.displayNote, this.props.currentUser.user.id, this.state.job.id, this.state.company.id)
  }

  relevantNotes = () => {

    return this.props.savedNotes.filter((note) => {

      return note.company_id == this.props.job.company_id
    })
  }

  relevantBookmarks = () => {
    return this.props.savedBookmarks.filter((bookmark) => {
      return bookmark.company_id == this.props.job.company_id
    })
  }

  infoDisplay=(event) => {
    const relevantNotes = this.relevantNotes()
    const relevantBookmarks = this.relevantBookmarks()
    if (this.state.savedInfoDisplay === "notes") {
      return(
        <div className = "notes">
        <h2>Notes <button onClick={this.renderNewNoteForm}>+</button></h2>

        {relevantNotes.map((note) => {
          return <div className="noteTitleList" id={note.id} onClick={this.displayNote}>
            {note.title}

            <button className="openButton"><i className="material-icons" style={{fontSize:"15px"}}>launch</i></button>
          </div>
        })}
      </div>
    )}
    else if (this.state.savedInfoDisplay==="bookmarks") {
      return(
        <div classname="bookmarks">
          <h2>Bookmarks</h2>
          <BookmarkList bookmarks={relevantBookmarks}/>
        </div>
      )}
      else if (this.state.savedInfoDisplay==="company") {
        return(
          <div className="company">

          <MyCompanyDetail user={this.props.currentUser} addBookmark = {this.props.addBookmark} companyId={this.props.jobcompany_id}/>
        </div>
      )}
    else {
      return(
        <div className="myJobDetailDescrip" >

          <h2>Job Description</h2>
          <div dangerouslySetInnerHTML={this.contents()}></div>

      </div>
      )
    }
  }

  infoSelect=(event)=>{
    event.preventDefault()
    let selection = event.target.name
    this.setState({
      savedInfoDisplay: selection
    })
  }




  render() {

  debugger
  if (!this.state.job) {
    return <div>Loading</div>;
      }



      return (
        <div className="myJobDetail">
          <div className="header">
          <h2 className="myJobTitle">{this.state.job.title}</h2>
          <h3 className="myJobDetailCompanyName">{this.state.company.name}</h3>
          </div>

          <div className="myJobDetailDashboard">
            <p><label>Date Saved: <input type="text" value={this.formattedDate()} readOnly /></label></p>

            <p><label>Applied? <input type="checkbox" name="applied_status" checked={this.state.job.applied_status} onChange={ this.dashboardListener } /></label></p>




            {this.state.job.applied_status &&

              <p><label>Date Applied: <input type="text" name="date_applied" onChange={this.dashboardListener} value={this.state.job.date_applied}/></label></p>

            }

            {this.state.job.applied_status &&
              <p><label>Response:
                <select name="application_response_status" value={this.state.job.application_response_status} onChange={this.dashboardListener} >
                  <option value=''>Select...</option>
                  <option value="interview invite">Interview Invite</option>
                  <option value="rejected">Rejected</option>
                </select>
              </label></p>
            }

            <div className="interview1Status">
              {this.state.job.application_response_status == "interview invite" &&
                <div className="firstInterview">
                  <h4>Interviews</h4>
                  <p><b>First Round: </b></p>
                  <span> <label>Interview Date: <input type="text" name="interview_1_date" onChange={this.dashboardListener} value={this.state.job.interview_1_date}/></label>

                  <label>  Interview Type:
                    <select name="interview_1_type" value = {this.state.job.interview_1_type} onChange={this.dashboardListener}>
                      <option value=''>Select...</option>
                      <option value="telephone">Telephone Screening</option>
                      <option value="video">Video Conference</option>
                      <option value="in person">In Person</option>
                    </select>
                  </label>

                  <label>  Technical Interview?
                    <input type="checkbox" name="interview_1_technical" checked={this.state.job.interview_1_technical} onChange={this.dashboardListener} /></label>

                    <label>  Outcome:
                      <select name="interview_1_response" value ={this.state.job.interview_1_response} onChange={this.dashboardListener}>
                        <option value=''>Select...</option>
                        <option value="job offer">Job Offer</option>
                        <option value="next interview round">Next Round Interview</option>
                        <option value="rejected">Rejected</option>
                      </select>
                    </label>
                  </span>
                </div>
              }

              {this.state.job.interview_1_response == "next interview round" &&
                <div className="interview2status">
                  <p><b>Second Round:</b></p>
                  <span> <label>  Interview Date:<input type="text" name="interview_2_date" onChange={this.dashboardListener} value={this.state.job.interview_2_date}/></label>

                  <label>  Interview Type:
                    <select name="interview_2_type" value = {this.state.job.interview_2_type} onChange={this.dashboardListener}>
                      <option value=''>Select...</option>
                      <option value="telephone">Telephone Screening</option>
                      <option value="video">Video Conference</option>
                      <option value="in person">In Person</option>
                    </select>
                  </label>

                  <label>  Technical Interview?
                    <input type="checkbox" name="interview_2_technical" checked={this.state.job.interview_2_technical} onChange={this.dashboardListener} /></label>

                    <label>  Outcome:
                      <select name="interview_2_response" value = {this.state.job.interview_2_response} onChange={this.dashboardListener}>
                        <option value=''>Select...</option>
                        <option value="job offer">Job Offer</option>
                        <option value="next interview round">Next Round Interview</option>
                        <option value="rejected">Rejected</option>
                      </select>
                    </label>
                  </span>
                </div>
              }

              { this.state.job.interview_2_response == "next interview round" &&
                <div className="interview3status">
                  <p><b>  Third Round:</b></p>
                  <span> <label>Interview Date:<input type="text" name="interview_3_date" onChange={this.dashboardListener} value={this.state.job.interview_3_date}/></label>

                  <label>  Interview Type:
                    <select value = {this.state.job.interview_3_type} onChange={this.dashboardListener}>
                      <option name="interview_3_type" value=''>Select...</option>
                      <option name="interview_3_type" value="telephone">Telephone Screening</option>
                      <option name="interview_3_type" value="video">Video Conference</option>
                      <option name="interview_3_type" value="in person">In Person</option>
                    </select>
                  </label>

                  <label>  Technical Interview?
                    <input type="checkbox" name="interview_3_technical" checked={this.state.job.interview_3_technical} onChange={this.dashboardListener} /></label>

                    <label>  Outcome:
                      <select value = {this.state.job.interview_3_response} onChange={this.dashboardListener}>
                        <option name="interview_3_response" value=''>Select...</option>
                        <option name="interview_3_response" value="job offer">Job Offer</option>
                        <option name="interview_3_response" value="next interview round">Next Round Interview</option>
                        <option name="interview_3_response" value="rejected">Rejected</option>
                      </select>
                    </label>
                  </span>
                </div>
              }

              <div>

                {this.state.job.interview_1_response == "job offer" || this.state.job.interview_2_response == "job offer" || this.state.job.interview_3_response == "job offer" &&
                  <div className="acceptOfferStatus">
                    <label>Accepted Offer?
                      <input type="checkbox" name="offer_status" checked={this.state.job.offer_status} onChange={this.dashboardListener} />
                    </label>
                  </div>
                }
              </div>



              <button onClick={this.dashboardEditSubmit}>Save Updates</button>

              <button onClick={this.deleteJob}> Delete</button>

            </div>
          </div>


    <div className="myJobDetailSavedInfo">
<div className="buttons" style={{alignment:"center"}}>

  <button name="job" onClick={this.infoSelect}>Job</button>
    <button name="company" onClick={this.infoSelect}>Company</button>
  <button name="notes" onClick={this.infoSelect}>Notes</button>
  <button name="bookmarks" onClick={this.infoSelect}>Bookmarks</button>

  </div>

  {this.infoDisplay()}

 </div>

 <div className="myJobDetailNote">
     {this.noteTypeRender()}
 </div>



        </div>


      )
    }
  }


  function mapStateToProps(state, props) {
    return {
      currentUser: state.user.currentUser,
      savedJobs: state.user.savedJobs,
      savedCompanies: state.user.savedCompanies,
      savedNotes: state.user.savedNotes,
      savedBookmarks: state.user.savedBookmarks,
      savedCategories: state.user.savedCategories,
      savedIndustries: state.user.savedIndustries
    }
  }

  function mapDispatchToProps(dispatch) {
    return bindActionCreators(Actions, dispatch);
  }

  export default withRouter(connect(mapStateToProps, mapDispatchToProps)(MyJobsItemDetail));
