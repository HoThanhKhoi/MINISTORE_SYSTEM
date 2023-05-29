package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class editCustomerProfile_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>Document</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"./css/customerProfile.css\">\n");
      out.write("\n");
      out.write("    \n");
      out.write("\n");
      out.write("    <!-- boostrap -->\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" />\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("    <div class=\"container-fluid\">\n");
      out.write("        <div class=\"row\">\n");
      out.write("\n");
      out.write("            <!-- left side: Menu -->\n");
      out.write("            <div class=\"col-3 menu\">\n");
      out.write("                <div class=\"title text-center\">My Account</div>\n");
      out.write("                <div class=\"sub-menu text-center\">\n");
      out.write("                    <div class=\"item\">\n");
      out.write("                        <a class=\"item fw-bold\" href=\"\">Overview</a>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"item\">\n");
      out.write("                        <a class=\"item\" href=\"\">Change Password</a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <!-- right side: User information -->\n");
      out.write("            <div class=\"col-8 form-container\">\n");
      out.write("                <form action=\"\">\n");
      out.write("                    <div class=\"form-item my-5 d-flex align-items-center justify-content-center\">\n");
      out.write("                        <div class=\"col-1 mx-5\">\n");
      out.write("                            <label for=\"\">Name</label>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-11\">\n");
      out.write("                            <input type=\"name\" id=\"name\"  >\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"form-item my-5 d-flex align-items-center justify-content-center\">\n");
      out.write("                        <div class=\"col-1 mx-5\">\n");
      out.write("                            <label for=\"\">Email</label>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-11\">\n");
      out.write("                            <input type=\"email\" id=\"email\" >\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-item my-5 d-flex align-items-center justify-content-center\">\n");
      out.write("                        <div class=\"col-1 mx-5\">\n");
      out.write("                            <label for=\"\">Phone</label>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-11\">\n");
      out.write("                            <input type=\"phone\" id=\"phone\" >\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-item my-5 d-flex align-items-center justify-content-center\">\n");
      out.write("                        <div class=\"col-1 mx-5\">\n");
      out.write("                            <label for=\"\">Address</label>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-11\">\n");
      out.write("                            <input type=\"password\" id=\"pwd\" >\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"save-btn d-flex justify-content-center\">\n");
      out.write("                        <button type=\"submit\" class=\"btn btn-primary mt-3 px-3 py-2 mx-3 fw-bold\">Save Changes</button>\n");
      out.write("                        <button type=\"reset\" class=\"btn btn-primary mt-3 px-3 py-2  fw-bold\">Cancel</button>\n");
      out.write("                    </div>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
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
