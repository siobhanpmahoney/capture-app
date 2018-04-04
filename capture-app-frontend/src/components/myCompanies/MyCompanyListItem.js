import React from 'react'
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { withRouter } from 'react-router'
import * as Actions from '../../actions'
import MyCompanyDetail from './MyCompanyDetail'


class MyCompanyListItem extends React.Component {

  render() {

    return (
      <div className="companySearchResultCard" style={{background:"white"}}>

       <h4> {this.props.company.name}</h4>
     <div className="location">{this.props.company.location}</div>
     <div className="industryList">{this.props.company.industry_name}</div>
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

export default connect(mapStateToProps, mapDispatchToProps)(MyCompanyListItem);
