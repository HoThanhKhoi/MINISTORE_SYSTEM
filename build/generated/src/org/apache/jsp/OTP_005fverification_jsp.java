package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class OTP_005fverification_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>Ministore</title>\n");
      out.write("\n");
      out.write("    <link rel=\"stylesheet\" href=\"./css/OTP_verification.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"./js/OTP_verification.js\">\n");
      out.write("\n");
      out.write("    <!-- font Inter -->\n");
      out.write("    <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\" />\n");
      out.write("    <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin />\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css2?family=Inter&display=swap\" rel=\"stylesheet\" />\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css2?family=Inter:wght@400;800&display=swap\" rel=\"stylesheet\" />\n");
      out.write("\n");
      out.write("    <!-- boostrap -->\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" />\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("    <div class=\"container-fluid height-100 d-flex justify-content-center align-items-center\">\n");
      out.write("        <!-- <div class=\"position-relative\"> -->\n");
      out.write("            <div class=\"card p-2 text-center\">\n");
      out.write("                <h6 class=\"mb-5\">Please enter the one time password to verify your account</h6>\n");
      out.write("                <div> <span>OTP is sent to email</span> <small>*******@gmail.com</small> </div>\n");
      out.write("                <div id=\"otp\" class=\"inputs d-flex flex-row justify-content-center mt-2\"> <input\n");
      out.write("                        class=\"m-2 text-center form-control rounded\" type=\"text\" id=\"first\" maxlength=\"1\" /> <input\n");
      out.write("                        class=\"m-2 text-center form-control rounded\" type=\"text\" id=\"second\" maxlength=\"1\" /> <input\n");
      out.write("                        class=\"m-2 text-center form-control rounded\" type=\"text\" id=\"third\" maxlength=\"1\" /> <input\n");
      out.write("                        class=\"m-2 text-center form-control rounded\" type=\"text\" id=\"fourth\" maxlength=\"1\" /> <input\n");
      out.write("                        class=\"m-2 text-center form-control rounded\" type=\"text\" id=\"fifth\" maxlength=\"1\" /> <input\n");
      out.write("                        class=\"m-2 text-center form-control rounded\" type=\"text\" id=\"sixth\" maxlength=\"1\" /> </div>\n");
      out.write("                <div class=\"mt-4 button\"> \n");
      out.write("                    <button class=\"btn px-4 validate\">Verify</button> \n");
      out.write("                </div>\n");
      out.write("                <div class=\"text-center mt-5\">\n");
      out.write("                    <span class=\"d-block mobile-text\" id=\"countdown\"></span>\n");
      out.write("                    <span class=\"d-block mobile-text\" id=\"resend\"></span>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- </div> -->\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <script src=\"./js/OTP_verification.js\"></script>\n");
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
