import React from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import * as Actions from '../../actions'
// import CompanySearchResultList from './CompanySearchResultList'
import CompanySearchResultItem from './CompanySearchResultItem'


class CompanySuggestionContainer extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      companySearchResults: []
    }
  }

  componentDidMount() {
    fetch(`https://api-v2.themuse.com/companies?industry=${this.props.industryUrl}&api-key=82b2d1f745512b99a70044e6c6b316d86739a97719d5e88caf67a3f7fd788a00&page=1`)
      .then(response => response.json())
      .then(json => this.setState({
        companySearchResults: json["results"]
      }));
  }

  industries = () => {
    let industries = this.props.savedIndustries.map((i) => {
       i.name.split(' ').join('%20')
    })
    return industries.join("&industry=")
  }

  categories = () => {
    return this.props.savedCategories.map((c) => {
      return c.name
    })
  }

  render() {


    if (this.state.suggestedCompanies == []) {
      return <div>Loading...</div>
    }
    return (
      <div>
        <span style={{fontWeight:"700", fontSize:"28px", color:"#435362", fontFamily:"Gill Sans", padding: "0.5em"}}>Check out these Companies!</span>
        <div className="companySearchResults">
          {this.state.companySearchResults.map((company) => {
            return<div><CompanySearchResultItem company={company} key={company.id} /></div>
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

export default connect(mapStateToProps, mapDispatchToProps)(CompanySuggestionContainer);
