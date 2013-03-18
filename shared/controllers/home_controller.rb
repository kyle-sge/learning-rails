class HomeController < BasicController
  def index
  end

  def header
    response.write "<p>header</p>"
  end
  
  def footer
    response.write "<p>footer</p>"
  end
  
  def layout
    response.write "<html>"
    response.write "<body>"
    yield
    response.write "</body>"
    response.write "</html>"
  end
end