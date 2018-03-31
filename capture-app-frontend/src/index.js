import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import { BrowserRouter as Router, Route, } from 'react-router-dom'

import registerServiceWorker from './registerServiceWorker';
import { createStore, applyMiddleware } from 'redux';
import thunk from 'redux-thunk';
import { Provider } from 'react-redux';
import reducers from './reducers';
import throttle from 'lodash/throttle'
import * as Actions from './actions'
import { loadState, saveState } from './localStorage'

import { composeWithDevTools } from 'redux-devtools-extension';

const persistedState = loadState();


const store = createStore(reducers, persistedState,
  composeWithDevTools(applyMiddleware(thunk))
);


store.subscribe(throttle(() => {
  saveState(store.getState())
}, 1000));

// Connect our store to the reducers


ReactDOM.render(
  <Provider store={store}>
    <Router>
      <App />
    </Router>
  </Provider>, document.getElementById('root'));
registerServiceWorker();
