page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

helpers do
  def inline_svg(filename, options = {})
    path = Middleman::Application.root_path.join('source', 'images', filename)
    raise "Requested file cannot be found: '#{filename}'" unless File.exists?(path)

    svg = File.read(path)
    svg = svg.gsub(/fill=".+?(?=")"/, '').gsub(/stroke=".+?(?=")"/, '').gsub(/width="\d+px"/, '').gsub(/height="\d+px"/, '')
    svg = svg.gsub('<svg', "<svg class=\"#{options[:class]}\"") if options.has_key?(:class)

    svg
  end
end

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
end
