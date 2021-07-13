defmodule Layout do
  @blog """
  <html>
  <head>
      <title>
          <%= @t %>
      </title>

  <link
    rel="stylesheet"
    href="https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@11.1.0/build/styles/default.min.css"
  />
  <script src="https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@11.1.0/build/highlight.min.js"></script>

  <script>
    hljs.highlightAll();
  </script>

  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <style>
    .markdown-body {
      box-sizing: border-box;
      min-width: 200px;
      max-width: 980px;
      margin: 0 auto;
      padding: 45px;
    }

    @media (max-width: 767px) {
      .markdown-body {
        padding: 15px;
      }
    }
  </style>
  </head>

  <body>
      <div>
          <article class="markdown-body">
              <%= @content %>
          </article>
      </div>
  </body>
  </html>
  """

  @index """
  <html>
  <head>
      <title>
          <%= @t %>
      </title>

  <link
    rel="stylesheet"
    href="https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@11.1.0/build/styles/default.min.css"
  />
  <script src="https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@11.1.0/build/highlight.min.js"></script>

  <script>
    hljs.highlightAll();
  </script>

  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <style>
    .markdown-body {
      box-sizing: border-box;
      min-width: 200px;
      max-width: 980px;
      margin: 0 auto;
      padding: 45px;
    }

    @media (max-width: 767px) {
      .markdown-body {
        padding: 15px;
      }
    }
  </style>
  </head>

  <body>
      <div>
          <article class="markdown-body">

                  <%= for item <- @list do %>
                      <p>
                         <a href="<%= item[:href] %>"> <%= item[:title] %> </a>
                      </p>
                  <% end %>

          </article>
      </div>
  </body>
  </html>


  """

  @hello_word """
  # Hello World

  ```go
  packge main

  import "fmt"

  func main(){

    fmt.Println("hello world")
  }
  ```

  ## this is for you !

  """

  @config """
  {
    "domain": "http://127.0.0.1:4000"
  }
  """

  def blog do
    @blog
  end

  def index do
    @index
  end

  def hello_world do
    @hello_word
  end

  def config do
    @config
  end
end
