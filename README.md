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





<h1>Showing Article Details</h1>
<p><strong>Title:</strong><%= @article.title%></p>
<p><strong>Description:</strong><%= @article.body%></p>
<%= link_to "Edit", edit_article_path(@article)%> |
<%= link_to "Delete", article_path(@article), method: :delete, data:{
    confirm: "Are you Sure"
}%> |
<%= link_to "Back to Articles Listing", articles_path%>