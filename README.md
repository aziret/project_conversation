# How to run the rails s locally:
- clone the repository
- bundle install
- rails db:migrate
- rails db:seed
- ./bin/dev (in order to Update assets automatically - here is the link https://github.com/rails/tailwindcss-rails)

# Open questions:
1. Q: What kind of projects we are considering? Will it contain only text data, or they can also contain any attachments like images or video?
A: - For simplicity let's say we are considering only text data.
2. Q: What statuses can a project have? 
A: - Let's say it has statuses as in a common issue tracker:
- open, in progress, done, to do, under review, approved, cancelled.
3. Q: Do users have roles? Can any user change a description of the project, its status, etc.
A: - Only owner(creator) of the task can change description, but anyone can change its status. Other users can only leave comments.
4. Q: What db should we use for this task?
A: - sqlite for simplicity
