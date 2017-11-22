# Group5README

# Beta Release

## Implementation and Contributions

Daniel Pimentel: 50%

Design and implementation of location, music, emotion, date, time, description posting/tracking for memories as well as settings. 

Andrew Chen: 50%

Design and implementation of the realtime database. Configured reading and writing memories/users to firebase. 

## Grading Level:

Same grade for all members.

Daniel Pimentel: 100%

Andrew Chen: 100%

## Differences:

A member of our team dropped so we are now down to two. The features that we initially planned to implement may not be completed. The revised plan is as follows:

### Beta Release:

Memory Posting: Memories are posted with features such as music, location, date, time, description, and emotion.

Database connection: Intially, we planned to use the core data as main storage, but we realized it would be better to use a universal method that could be accessed by all users connected to the internet. Core data would restrict the user to hold all their data and memories on their local phone. 

Data Flow and Logic: We decided to map out two entities. There are users and their associated memories. Many memories can associate with one user. As it turns out, the realtime databse from firebase follows NoSQL convention so there are no keys or relations. The data was stored in a dictionary like JSON object and users were associated with memories using their unique email. 


With the release of the beta version, users should now be able to post and view memories. 

## Special Instructions
The initial page is the login. It also includes actions to register for an account and request a password reset link. 
Users will be able to create or view memories once authenticated and logged in.
