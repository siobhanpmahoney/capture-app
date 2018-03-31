import React from 'react'
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { HashRouter, Link } from 'react-router-dom'
import { withRouter } from 'react-router'
import * as Actions from '../../actions'
import MyCompanyListItem from './MyCompanyListItem'
import MyCompanyDetail from './MyCompanyDetail'


class MyCompanyContainer extends React.Component {

  constructor(props) {
    super(props)

    this.state = {
      displayedCompany: null
    }
  }

  loadCompanyDetail = (event) => {
    let coId = event.target.id
    let selectedCompany = this.props.savedCompanies.find((company) => {
      return company.id == coId
    })
    this.setState({
      displayedCompany: selectedCompany
    })
  }



  render() {
    if (!this.props.savedCompanies) {
      return <div>Loading...</div>
    }

    return (
      <div>
        <h1>Saved Companies</h1>
        <div className="myCompanyList">
          {this.props.savedCompanies.map((company) => {
            return <div className="companySearchResultCard">
              {company.image_link &&
                <img src={company.image_link} style={{width:"350px"}} />
              }

              <h4>{company.name}</h4>
                <div className="location">{company.location}</div>
                <div className="industryList">{company.industry_name}</div>
                <Link to={`/mycompanies/${company.id}`} key={company.id} onClick={this.loadCompanyDetail}>
              Read More</Link>
            </div>
          })}
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

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(MyCompanyContainer));
