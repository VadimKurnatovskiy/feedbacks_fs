# README

Link to Heroku app:
##### Admin credentials
Login: admin@example.com
Password: 123456
___
# Дополнительное тестовое задание

## Условие задачи

Необходимо разработать web-приложение "Форма обратной связи" на основе данных user stories.

Требуется:

- Использовать [rails-base](https://github.com/fs/rails-base) как основу проекта.
- Сделать простой приятный дизайн.
- Задеплоить разработанное приложение на Heroku.
- При необходимости - использовать стандартные для компании библиотеки (Devise, Pundit / ActivePolicy, Draper, Interactor, Simple Form)
- Все user story покрыть автоматическими тестами (RSpec, Capybara, ChromeDriver)

```
As Visitor I want to leave feedback
  When I open New Feedback page
  Then I see form with required fields: name, email, text
  When I fill all 3 fields
  And When I click "Submit feedback"
  I should see message "Feedback was successfully send!"
  And email with feedback sent to admin@example.com

As User I want to see pre-filled name and email in feedback form
  Given I am authenticated as John Smith (john@example.com)
  When I open New Feedback page
  Then I should see name field pre-filled with "John Smith"
  And I should see email field pre-filled with "john@example.com"

As Admin User I want to see list of all Feedbacks
  Given I am authenticated as Admin (admin@example.com)
  And there are Feedbacks in database
  When I open Feedbacks page
  Then I see table with list of all feedbacks sorted by "newest first"
  And I see pagination under the table

As Admin User I want to search through feedbacks
  Given I am authenticated as Admin (admin@example.com)
  And there are feedback with text "Hello" from John Smith (john@example.com) in database
  And there are feedback with text "Help" from Michael Brown (misha@example.com) in database
  When I open Feedbacks page
  Then I see Search Form with text input and submit button
  When I fill search input with "john"
  Then I see feedback from John Smith
  And I do not see feedback from Michael
  When I fill search input with "Help"
  Then I see feedback from Michael
  And I do not see feedback from John Smith
```
