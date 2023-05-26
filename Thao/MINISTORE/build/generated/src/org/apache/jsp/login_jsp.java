package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Login Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            Cookie arr[] = request.getCookies();
            for (Cookie c : arr) {
                if (c.getName().equals("emailC")) {
                    request.setAttribute("email", c.getValue());
                }

                if (c.getName().equals("passC")) {
                    request.setAttribute("password", c.getValue());
                }
            }
        
      out.write("\n");
      out.write("<!--\n");
      out.write("        <form action=\"MainController\" method=\"post\">\n");
      out.write("            <table>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Email</td>\n");
      out.write("                    <td><input type=\"email\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${email}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" required=\"\" name=\"email\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Password</td>\n");
      out.write("                    <td><input type=\"password\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${password}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" required=\"\" name=\"password\"></td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("            <input type=\"checkbox\" name=\"remember\" value=\"1\"> Remember me\n");
      out.write("            <button type=\"submit\" value=\"login\" name=\"action\">Login</button>\n");
      out.write("        </form>\n");
      out.write("-->\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("\n");
      out.write("                <!-- part 1 -->\n");
      out.write("                <div class=\"col left-side\">\n");
      out.write("                    <img src=\"./image/image 8.png\" alt=\"\" />\n");
      out.write("                    <div class=\"overlay\"></div>\n");
      out.write("                    <div class=\"left-side-title\">\n");
      out.write("                        <h1>MINISTORE</h1>\n");
      out.write("                        <p>\n");
      out.write("                            SHOP <i><u>EVERYTHING</u></i> WITH YOUR FINGERTIPS!\n");
      out.write("                        </p>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <!-- part 2 -->\n");
      out.write("                <div class=\"col right-side\">\n");
      out.write("                    <div class=\"login-container\">\n");
      out.write("                        <div class=\"login-header\">\n");
      out.write("                            <h3 class=\"mt-3\">Login</h3>\n");
      out.write("                        </div>\n");
      out.write("                        <form action=\"MainController\" method=\"post\">\n");
      out.write("                            <div class=\"mb-5 mt-3\">\n");
      out.write("                                <input type=\"email\" id=\"email\" placeholder=\"Enter email\" name=\"email\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${email}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"mb-5\">\n");
      out.write("                                <input type=\"password\"  id=\"pwd\" placeholder=\"Enter password\" name=\"password\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${password}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-check mb-3\">\n");
      out.write("                                <label class=\"form-check-label\">\n");
      out.write("                                    <input class=\"form-check-input\" type=\"checkbox\" name=\"remember\" value=\"1\"> Remember me\n");
      out.write("                                </label>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"button\">\n");
      out.write("                                <button type=\"submit\" class=\"btn\" value=\"login\" name=\"action\">Login</button>\n");
      out.write("                            </div>\n");
      out.write("                        </form>\n");
      out.write("                        <div class=\"login-footer\">\n");
      out.write("                            Don't have an account? <a>Register</a>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
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