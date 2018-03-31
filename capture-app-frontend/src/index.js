import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import { BrowserRouter } from 'react-router-dom'
import registerServiceWorker from './registerServiceWorker';
import { createStore, applyMiddleware } from 'redux';
import thunk from 'redux-thunk';
import { Provider } from 'react-redux';
import reducers from './reducers';
import throttle from 'lodash/throttle'
import * as Actions from './actions'
import { loadState, saveState } from './localStorage'

import { composeWithDevTools } from 'redux-devtools-extension';
import 'draft-js/dist/Draft.css';


const persistedState = loadState();

// function configureStore(){
//   return createStore(
//     rootReducer,
//     persistedState,
//     composeWithDevTools(applyMiddleware(thunk))}
//
// const store = configureStore()

const store = createStore(reducers, persistedState,
  composeWithDevTools(applyMiddleware(thunk))
);


store.subscribe(throttle(() => {
  saveState(store.getState())
}, 1000));

// Connect our store to the reducers


ReactDOM.render(
  <Provider store={store}>
    <BrowserRouter>
      <App />
    </BrowserRouter>
  </Provider>, document.getElementById('root'));
registerServiceWorker();
