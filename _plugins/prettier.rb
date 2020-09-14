# Post-render hooks for formatting Jekyll outputs with prettier; runs if
# prettier is installed, eg:
# ```
#   npm install --global prettier
# ```
# or, with Yarn:
# ```
#   yarn global add prettier
# ```
# =============================
# brentyi@berkeley.edu

require 'open3'

def command?(command)
  system("which #{ command} > /dev/null 2>&1")
end

if !command?("prettier")
  puts "!!!"
  puts "`prettier` not found; output formatting will be skipped\e[0m"
  puts "!!!"
end

Jekyll::Hooks.register :documents, :post_render do |doc|
  if command?("prettier")
    puts "Running prettier on doc: " + doc.url
    args = ["prettier", "--parser", "html"]
    Open3.popen2(*args) do |stdin, stdout, wait_thru|
      stdin.print doc.output
      stdin.close
      doc.output = stdout.read
    end
  end
end

Jekyll::Hooks.register :pages, :post_render do |page|
  if command?("prettier")
    puts "Running prettier on page: " + page.url
    if page.html?
      args = ["prettier", "--parser", "html"]
    else
      args = ["prettier", "--stdin-filepath", page.relative_path]
    end
    Open3.popen2(*args) do |stdin, stdout, wait_thru|
      stdin.print page.output
      stdin.close
      page.output = stdout.read
    end
  end
end
