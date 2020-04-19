# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (A band has many posts and a post belongs to a band. A post has many comments and a comment belongs to a post. ) 
- [x] Include at least one belongs_to relationship (A post belongs to a band. A comment belongs to a post.)
- [x] Include at least two has_many through relationships (A band has many tags through bandtags. A band has many users through userbands.)
- [x] Include at least one many-to-many relationship (A post has many users through comments. A comment belongs to a user and a post. A user has many posts through comments.)
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (comments have content)
- [x] Include reasonable validations for simple model objects (User username, Band name, Comment content)
- [x] Include a class level ActiveRecord scope method (Band.latest_posts viewable on band show page - "/bands/:id"   - displays most recent 2 posts)
- [x] Include signup (traditional form)
- [x] Include login (traditional form using sessions and oauth github)
- [x] Include logout (traditional logout button clearing session)
- [x] Include third party signup/login (OmniAuth github) -Rails portfolio project page quote, "Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc..." As I understand it signup via Github was not a requirement and my app does not support that at this time. Login via Github is supported.
- [x] Include nested resource show or index (/posts/:id/comments/new, /bands/:id/users) 
    - /post/:id/comments would have displayed the same content as /post/:id so I left the content in /post/:id.    
    - /bands/:id/users is a path that exists and works but I don't link to it or use it anywhere in my application. The users list is viewable from the band show page. 
- [x] Include nested resource "new" form (/posts/:id/comments/new)
- [x] Include form display of validation errors (/login, /users/new, /bands/:id)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate