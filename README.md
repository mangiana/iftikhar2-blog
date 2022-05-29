# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...




 <% if< @article.errors.any? %>
    h4>Following are the Erros preventing Article to save</h4>
    <ul>
    <% @article.errors.full_messages.each do |msg|%>
      <li><%=msg%></li>
    <%end%>
    </ul>
  <%end%>