# Capture.

Job search management tool. Search job opportunities, track application and interview progress, and organize research and notes.

## Demo

## Usage and Features

Capture. streamlines the job search by offering a single platform for finding job opportunities, collecting research, organizing notes, tracking progress with applications and interviews.

* Run targeted searches for job opportunities based on criteria specific to position and company
* Save job listings and track application progress
* Collect company research sources using live company press feeds and bookmarking tool
* Digital notepad and advanced note organizational tool
* Review recommended opportunities based on previously bookmarked listings

## Prerequisites

### Backend
* Rails 5
* PostgreSQL

### Frontend:
* React
* Redux
* React Router
* Redux Thunk middleware
* Custom JWT authentication system integrates with JWT auth on the Rails API side.

### APIs

* The Muse (job and company listings)
* News API (company press feeds)

## Installing

### Backend

After cloning this repo, first run the Rails server:

1.

```
cd capture-app-api
bundle install
```

2. Database installation:

```
rake db:create
rake db:migrate
rake db:seed
```

3. Run Rails server:

```
rails s
```

### Frontend

Once the Rails server is running, launch the frontend components on http://localhost:3001:

```
cd ..
cd capture-app-frontend
npm install && npm start
```

*Note: when prompted, reply* `y` *when asked:* ?
```Something is already running on port 3000

Would you like to run the app on another port instead? (Y/n)  
```

## License


The MIT License (MIT)

Copyright (c) 2018 Siobhan Mahoney

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
