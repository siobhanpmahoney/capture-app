import React from 'react'
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import * as Actions from '../../actions'

class JobDescription extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      job: null
    }
  }

  componentDidMount() {
    fetch(`https://api-v2.themuse.com/jobs/${this.props.museJobId}`)
    .then(response => response.json())
    .then(json => this.setState({
      job: json
    }))
  }

  contents = () => {
    return {
      __html: this.state.job.contents
    };
  }

  categories = () => {
    let categoryList = this.state.job.categories.map((c) => {
      return c.name
    })
    return categoryList.join(" | ")
  }

  levels = () => {
    let levelList = this.state.job.levels.map((lvl) => {
      return lvl.name
    })
    return levelList.join(" | ")
  }

  locations = () => {
    let locationList = this.state.job.locations.map((l) => {
      return l.name
    })
    return locationList.join(" | ")
  }

  formattedDate = () => {
    let pubDate = new Date(this.state.job.publication_date)
    return pubDate.toLocaleDateString()
  }

  saveJob = (event) => {
    event.preventDefault()
    this.props.addToSavedJobs(this.state.job)

  }

  dynamicIcon = () => {

    if (this.props.savedJobs.find((job) => {
      return job.museId == this.state.job.id
    })) {
      return (<i className="material-icons" style={{color:"#FF5370", fontSize:"100%"}}>bookmark</i>)
    } else {
      return (<i className="material-icons" onClick={this.saveJob} style={{color:"#FF5370"}}>bookmark_border</i>)
    }
  }


  render() {
    
    if (!this.state.job) {
      return <div>Loading</div>;
    }

    return (
      <div className="jobDescription">


        <h1>{this.state.job.name} {this.dynamicIcon()}</h1>
        <h2 className="jobDescriptionCompanyName">{this.state.job.company.name}</h2>
        <div className="jobDescriptionCategory">{this.categories()}</div>
        <div className="jobDescriptionLevel">{this.levels()}</div>
        <div className="jobDescriptionLocation">{this.locations()}</div>
        <div className="jobDescriptionDate">{this.formattedDate()}</div><br />
        <div className="jobDescriptionContent" dangerouslySetInnerHTML={this.contents()} />
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

export default connect(mapStateToProps, mapDispatchToProps)(JobDescription);
