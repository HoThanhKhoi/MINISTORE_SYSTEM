package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class productInfo_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_if_test;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_if_test = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_if_test.release();
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <title>Document</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"./css/productDetail.css\">\n");
      out.write("\n");
      out.write("        <!-- boostrap -->\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" />\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- font icon cdn -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css\"\n");
      out.write("              integrity=\"sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==\"\n");
      out.write("              crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\" />\n");
      out.write("\n");
      out.write("        <link rel=\"stylesheet\" href=\"./js/index.js\">\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- HEADER PATH -->\n");
      out.write("        <nav class=\"navbar navbar-expand-lg header-path mb-4\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <nav aria-label=\"breadcrumb\">\n");
      out.write("                    <ol class=\"breadcrumb\">\n");
      out.write("                        <li class=\"breadcrumb-item\">\n");
      out.write("                            <a href=\"MainController?action=backToHome\">Home</a>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"breadcrumb-item\">\n");
      out.write("                            <a href=\"#\">Category</a>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"breadcrumb-item active\" aria-current=\"page\">\n");
      out.write("                            <a href=\"#\"></a>\n");
      out.write("                        </li>\n");
      out.write("                    </ol>\n");
      out.write("                </nav>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("        <!-- PRODUCT DETAIL -->\n");
      out.write("        <div class=\"container product-detail\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-5 product-detail-img\">\n");
      out.write("                    <img src=\"./image/Item.png\" alt=\"\">\n");
      out.write("                </div>\n");
      out.write("                ");
      if (_jspx_meth_c_if_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                \n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!-- RELATED PRODUCT -->\n");
      out.write("        <div class=\"container-fluid related-product my-5\">\n");
      out.write("            <div class=\"title text-center mb-5\">Related Products</div>\n");
      out.write("            <div class=\"item-list mx-5\">\n");
      out.write("                <div class=\"row \">\n");
      out.write("                    <div class=\"col\">\n");
      out.write("                        <!-- begin item -->\n");
      out.write("                        <div class=\"item mb-4 text-center\">\n");
      out.write("                            <div class=\"card border-0 shadow\">\n");
      out.write("                                <img src=\"./image/Item.png\" class=\"card-img-top\" alt=\"\">\n");
      out.write("                                <div class=\"card-body\">\n");
      out.write("                                    <h5 class=\"card-title mb-3 fw-bold\">Chicken Egg</h5>\n");
      out.write("                                    <span class=\"bricked-price mx-2\">$1.36</span>\n");
      out.write("                                    <span class=\"price fw-bold mx-2\">$1.19</span></br>\n");
      out.write("                                    <a href=\"#\" class=\"btn btn-primary mt-3 px-3 py-2 fw-bold\">Add To Cart</a>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <!-- end item -->\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!-- back to top -->\n");
      out.write("        <button type=\"button\" class=\"btn btn-danger btn-floating btn-lg\" id=\"btn-back-to-top\">\n");
      out.write("            <i class=\"fas fa-arrow-up\"></i>\n");
      out.write("        </button>\n");
      out.write("\n");
      out.write("    </body>\n");
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

  private boolean _jspx_meth_c_if_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_0.setPageContext(_jspx_page_context);
    _jspx_th_c_if_0.setParent(null);
    _jspx_th_c_if_0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.product != null}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_0 = _jspx_th_c_if_0.doStartTag();
    if (_jspx_eval_c_if_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("                    <div class=\"col-6\">\n");
        out.write("                    <div class=\"title mb-4\">");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${product.productName}", java.lang.String.class, (PageContext)_jspx_page_context, null));
        out.write("</div>\n");
        out.write("                    <div class=\"description mb-4\">\n");
        out.write("                        ");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${product.description}", java.lang.String.class, (PageContext)_jspx_page_context, null));
        out.write("\n");
        out.write("                    </div>\n");
        out.write("\n");
        out.write("                    <div class=\"d-flex group-price mb-4\">\n");
        out.write("                        <div class=\"bricked-price\">$");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${product.price}", java.lang.String.class, (PageContext)_jspx_page_context, null));
        out.write("</div>\n");
        out.write("                        <div class=\"price\">$0.81</div>\n");
        out.write("                    </div>\n");
        out.write("                    <div class=\"d-flex\">\n");
        out.write("                        <div class=\"group-quantity\">\n");
        out.write("                            <button class=\"btn btn-link px-2\" onclick=\"this.parentNode.querySelector('input[type=number]').stepDown()\">\n");
        out.write("                                <i class=\"fas fa-minus\"></i>\n");
        out.write("                            </button>\n");
        out.write("                            <input class=\"quantity fw-bold text-black\" min=\"0\" name=\"quantity\" value=\"1\" type=\"number\">\n");
        out.write("                            <button class=\"btn btn-link px-2\" onclick=\"this.parentNode.querySelector('input[type=number]').stepUp()\">\n");
        out.write("                                <i class=\"fas fa-plus\"></i>\n");
        out.write("                            </button>\n");
        out.write("                        </div>\n");
        out.write("\n");
        out.write("                        <div class=\"notification\">\n");
        out.write("                            <p>Only <span>");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${product.stockQuantity}", java.lang.String.class, (PageContext)_jspx_page_context, null));
        out.write("</span> items left!</p>\n");
        out.write("                        </div>\n");
        out.write("                    </div>\n");
        out.write("                    <div class=\"cart-btn\">\n");
        out.write("                        <a href=\"#\" class=\"btn btn-primary mt-3 px-3 py-2 fw-bold\">Add To Cart</a>\n");
        out.write("                    </div>\n");
        out.write("                </div>\n");
        out.write("                ");
        int evalDoAfterBody = _jspx_th_c_if_0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_if_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_0);
      return true;
    }
    _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_0);
    return false;
  }
}
