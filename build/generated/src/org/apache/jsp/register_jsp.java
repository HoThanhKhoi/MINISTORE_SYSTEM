package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class register_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\" />\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n");
      out.write("    <title>Ministore</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"./css/login.css\" />\n");
      out.write("\n");
      out.write("    <!-- boostrap -->\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" />\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("\n");
      out.write("    <!-- font Inter -->\n");
      out.write("    <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\" />\n");
      out.write("    <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin />\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css2?family=Inter&display=swap\" rel=\"stylesheet\" />\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css2?family=Inter:wght@400;800&display=swap\" rel=\"stylesheet\" />\n");
      out.write("   \n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("    <div class=\"container-fluid login\">\n");
      out.write("        <div class=\"row\">\n");
      out.write("\n");
      out.write("            <!-- part 1 -->\n");
      out.write("            <div class=\"col right-side\">\n");
      out.write("                <div class=\"login-container\">\n");
      out.write("                    <div class=\"login-header\">\n");
      out.write("                        <h3>Register</h3>\n");
      out.write("                        <p>Let's get things started!</p>\n");
      out.write("                    </div>\n");
      out.write("                    <form action=\"\">\n");
      out.write("                        <div class=\"mb-2 mt-3\">\n");
      out.write("                            <input type=\"name\" id=\"name\" placeholder=\"Enter name\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"mb-2 mt-3\">\n");
      out.write("                            <input type=\"email\" id=\"email\" placeholder=\"Enter email\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"mb-2 mt-3\">\n");
      out.write("                            <input type=\"phone\" id=\"phone\" placeholder=\"Enter phone\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"mb-2 mt-3\">\n");
      out.write("                            <input type=\"password\"  id=\"pwd\" placeholder=\"Enter password\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"mb-2 mt-3\">\n");
      out.write("                            <input type=\"password\"  id=\"confirmPwd\" placeholder=\"Enter confirm password\">\n");
      out.write("                        </div>                        \n");
      out.write("                        <div class=\"button\">\n");
      out.write("                            <button type=\"submit\" class=\"btn\">Register</button>\n");
      out.write("                        </div>\n");
      out.write("                    </form>\n");
      out.write("                    <div class=\"login-footer\">\n");
      out.write("                        Already have an account? <a>Login</a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <!-- part 2 -->\n");
      out.write("            <div class=\"col left-side\">\n");
      out.write("                <img src=\"./image/image 8.png\" alt=\"\" />\n");
      out.write("                <div class=\"overlay\"></div>\n");
      out.write("                <div class=\"left-side-title\">\n");
      out.write("                    <h1>MINISTORE</h1>\n");
      out.write("                    <p>\n");
      out.write("                        SHOP <i><u>EVERYTHING</u></i> WITH YOUR FINGERTIPS!\n");
      out.write("                    </p>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
