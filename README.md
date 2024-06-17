## ATS with Event Sourcing

## Getting Started
There is a test task with implementing STI for ```Job``` and ```Application``` events.

# Setup
1. Clone the repo
```
git clone https://github.com/NazarKachmar/ats_with_event_sourcing.git
```
2. Check your enciroment
  Application requires Ruby 3.3.3 and MySql (recommended 8.3.0)
3. Install dependencies using ```bundle install```
4. Create and setup the database with ```rails db:setup```
5. Boot up a server ```rails s```

### Tests
```
bundle exec rspec

bundle exec rubocop
```

### Usage
__Currently only two endpoints available__

- GET `/applications` - *returns list of applications with active jobs*
  - ```id```
  - ```candidate_name```
  - ```status```
  - ```job_name```
  - ```notes_count```
  - ```last_interview_at```
  
- GET `/jobs` - *returns list of all jobs*
  - ```id```
  - ```title```
  - ```description```
  - ```status```
  - ```hired_candidates_count```
  - ```rejected_candidates_count```
  - ```ongoing_candidates_count```
