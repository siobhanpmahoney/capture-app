import { combineReducers } from 'redux';
import { CURRENT_USER, ADD_NEW_JOB, EDIT_JOB, DELETE_JOB, ADD_NEW_NOTE, EDIT_NOTE, ADD_NEW_BOOKMARK } from '../actions'

const user = (state = {currentUser: null, savedJobs: [], savedCompanies: [], savedNotes: [], savedBookmarks: [], savedCategories:[], savedIndustries: []}, action) => {
  switch(action.type) {
    case CURRENT_USER:
      state = Object.assign({},
        state,
        {
          currentUser: action.currentUser,
          savedJobs: action.savedJobs,
          savedCompanies: action.savedCompanies,
          savedNotes: action.savedNotes,
          savedBookmarks: action.savedBookmarks,
          savedCategories: action.savedCategories,
          savedIndustries: action.savedIndustries
        }
      );
      return state;




    case ADD_NEW_JOB:
    console.log("in reducer")
      state = Object.assign({},
        state,
        {
          savedJobs: action.savedJobs,
          savedCompanies: action.savedCompanies
        }
      );
      console.log(state)
    return state;

    case EDIT_JOB:
      let index = state.savedJobs.findIndex((job) => {
        return job.id == action.job.id
      })
      const savedJobs = [...state.savedJobs.slice(0, index),
        action.job,
        ...state.savedJobs.slice(index + 1)
      ];
      return Object.assign({},
        state,
        {
          savedJobs,
        },
      );

    case DELETE_JOB:
      console.log("in DELETE_JOB reducer")
      const jobs = state.savedJobs.filter((job) => {
        return job.id != action.selectedJobId
      })
      console.log("in DELETE_JOB reducer, jobs", jobs)
      debugger
      state = Object.assign({},
        state, {
          savedJobs: jobs,
        }
      )
      return state;

    case ADD_NEW_NOTE:
      let userNotes = state.savedNotes
      state=Object.assign({},
        state,
        {
          savedNotes: [...userNotes, action.newNote],
        }
      );
      return state;

    case EDIT_NOTE:
      let noteIndex = state.savedNotes.findIndex((note) => {
        return note.id == action.note.id
      })
      const savedNotes = [
        ...state.savedNotes.slice(0, noteIndex),
        action.note,
        ...state.savedNotes.slice(noteIndex + 1)
      ];
      return Object.assign({},
      state,
      {
        savedNotes,
      },
    );


    case ADD_NEW_BOOKMARK:
      let userBookmarks = state.savedBookmarks

      state = Object.assign({},
        state,
        {
          savedBookmarks: [...userBookmarks, action.newBookmark],
        }
      );

      return state;


    default:
      return state;
  }
}

const rootReducer = combineReducers({
  user,
    // ,[ANOTHER REDUCER], [ANOTHER REDUCER] ....
});

export default rootReducer;
