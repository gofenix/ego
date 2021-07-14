defmodule Mark do
  require EEx
  @conf File.read!("#{File.cwd!()}/config.json") |> JSON.decode!()

  def init do
    IO.inspect(@conf)
    File.rm_rf!(static_dir())
    File.mkdir_p!(static_dir())
  end

  def current_dir do
    File.cwd!()
  end

  def blog_files do
    Path.wildcard("#{current_dir()}/contents/*.md")
  end

  def static_dir do
    "#{current_dir()}/public"
  end

  def index_layout do
    "#{current_dir()}/layouts/index.eex"
  end

  def blog_layout do
    "#{current_dir()}/layouts/blog.eex"
  end

  def convert do
    IO.puts("convert")
    init()

    Task.start_link(fn -> blog_files() |> gen_index() end)

    blog_files()
    |> Enum.map(fn m -> Task.async(fn -> gen_blogs(m) end) end)
    |> Task.await_many()
    |> IO.inspect()
  end

  def gen_index(blogs) do
    blogs
    |> Enum.map(fn m -> m |> get_title() |> build_title_with_href() end)
    |> eval_index()
    |> write_to("index")
  end

  def build_title_with_href(title) do
    %{:title => title, :href => get_href(title)}
  end

  def get_href(title) do
    "#{@conf["domain"]}/#{title}.html"
  end

  def eval_index(titles) do
    EEx.eval_file(index_layout(),
      assigns: [t: "zzf-blog", list: titles]
    )
  end

  def gen_blogs(m) do
    m
    |> File.read!()
    |> Earmark.as_html!()
    |> eval_blog(m)
    |> write_to(m)
  end

  def eval_blog(h, m) do
    title = get_title(m)

    EEx.eval_file(blog_layout(),
      assigns: [t: title, content: h]
    )
  end

  def write_to(d, m) do
    title = get_title(m)

    File.write!("#{static_dir()}/#{title}.html", d)
  end

  def get_title(m) do
    String.split(m, "/") |> Enum.reverse() |> hd |> String.split(".") |> hd
  end
end
