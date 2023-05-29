package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import DTO.Product;
import DTO.Product;
import DAO.ProductDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public final class homePage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_forEach_var_items;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_if_test;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_forEach_var_items_end_begin;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_forEach_var_items = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_c_if_test = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_c_forEach_var_items_end_begin = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_forEach_var_items.release();
    _jspx_tagPool_c_if_test.release();
    _jspx_tagPool_c_forEach_var_items_end_begin.release();
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
      out.write("        <title>Ministore</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"./css/homepage.css\">\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- boostrap -->\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" />\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- 1. cdn min.css carousel-->\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css\"\n");
      out.write("              integrity=\"sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g==\"\n");
      out.write("              crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\" />\n");
      out.write("\n");
      out.write("        <!-- 2. own carousel theme min.css -->\n");
      out.write("        <link rel=\"stylesheet\"\n");
      out.write("              href=\"https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css\"\n");
      out.write("              integrity=\"sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw==\"\n");
      out.write("              crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\" />\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <!-- Banner -->\n");
      out.write("        <div class=\"container-fluid \">\n");
      out.write("            <!-- Header -->\n");
      out.write("            <div class=\"header\">\n");
      out.write("                <nav>\n");
      out.write("                    <ul>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"\">Home</a>\n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"#hot-deal\">Hot Deals</a>\n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"#best-selling\">Best Sellers</a>\n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"#category\">Category</a>\n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"\">Register</a>\n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"\">Login</a>\n");
      out.write("                        </li>\n");
      out.write("                    </ul>\n");
      out.write("                </nav>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <!-- Banner -->\n");
      out.write("            <div class=\"banner\">\n");
      out.write("                <video class=\"w-100\" autoplay loop muted>\n");
      out.write("                    <source src=\"./image/mixkit-surface-covered-with-many-fruits-and-vegetables-seen-in-detail-10433-medium.mp4\" type=\"video/mp4\" />\n");
      out.write("                </video>\n");
      out.write("                <!-- <img src=\"./image/banner_homepage.png\" alt=\"\"> -->\n");
      out.write("                <div class=\"overlay\"></div>\n");
      out.write("                <div class=\"banner-title text-center d-flex align-items-center\">\n");
      out.write("                    <h1>Ministore </br>\n");
      out.write("                        Shop <u><em>Everything!</em></u>\n");
      out.write("                    </h1>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        ");
      //  c:if
      org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
      _jspx_th_c_if_0.setPageContext(_jspx_page_context);
      _jspx_th_c_if_0.setParent(null);
      _jspx_th_c_if_0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.page == 1 || requestScope.list == null}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_if_0 = _jspx_th_c_if_0.doStartTag();
      if (_jspx_eval_c_if_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("            <!-- Hot Deal -->\n");
          out.write("            <div class=\"container-fluid hot-deal\" id=\"hot-deal\">\n");
          out.write("                <div class=\"hot-deal-title \">\n");
          out.write("                    <img src=\"./image/logo-1_hot-deal.png\" alt=\"\">\n");
          out.write("                    <h1 class=\"pt-5 pb-5 text-center\">Hot <u class=\"fw-bold\"><em>deal</em></u> right now!</h1>\n");
          out.write("                    <img src=\"./image/logo-2_hot-deal.png\" alt=\"\">\n");
          out.write("                </div>\n");
          out.write("\n");
          out.write("                <div class=\"item-list mx-5\">\n");
          out.write("                    <div class=\"row mx-5\">\n");
          out.write("                        <div class=\"owl-carousel owl-theme\">\n");
          out.write("                            ");

                                ArrayList<Product> list = ProductDAO.getProducts();
                                for (int i = 0; i <= 6; i++) {
          out.write("\n");
          out.write("                            <div class=\"item mb-4 text-center\">\n");
          out.write("                                <div class=\"card border-0 shadow\">\n");
          out.write("                                    <img src=\"./image/Item.png\" class=\"card-img-top\" alt=\"\">\n");
          out.write("                                    <div class=\"card-body\">\n");
          out.write("                                        <h5 class=\"card-title mb-3 fw-bold\"><a href=\"MainController?action=viewProduct&pid=");
          out.print( list.get(i).getProductID());
          out.write('"');
          out.write('>');
          out.print( list.get(i).getProductName());
          out.write("</a></h5>\n");
          out.write("                                        <span class=\"bricked-price mx-2\">");
          out.print( list.get(i).getPrice());
          out.write("</span>\n");
          out.write("                                        <span class=\"price fw-bold mx-2\">$1.19</span></br>\n");
          out.write("                                        <a href=\"#\" class=\"btn btn-primary mt-3 px-3 py-2 fw-bold\" name=\"action\">Add To Cart</a>\n");
          out.write("                                    </div>\n");
          out.write("                                </div>\n");
          out.write("                            </div>                        \n");
          out.write("                            ");
 }
          out.write("\n");
          out.write("                            <!-- begin item -->\n");
          out.write("\n");
          out.write("                            <!-- end item -->\n");
          out.write("                        </div>\n");
          out.write("                    </div>\n");
          out.write("                </div>\n");
          out.write("                <div class=\"hot-deal-footer\">\n");
          out.write("                    <h2 class=\"py-4 text-center\"><em>Deals end in XX:XX</em></h2>\n");
          out.write("                </div>\n");
          out.write("                <div class=\"hot-deal-banner\">\n");
          out.write("                    <img src=\"./image/image 21.png\" alt=\"\">\n");
          out.write("                </div>           \n");
          out.write("            ");
          int evalDoAfterBody = _jspx_th_c_if_0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_if_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_0);
        return;
      }
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_0);
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- Categories -->\n");
      out.write("        <div class=\"container-fluid category\" id=\"category\">\n");
      out.write("            <div class=\"row pt-5 mx-5\">\n");
      out.write("                <div class=\"col ad-banner mx-3\">\n");
      out.write("                    <img src=\"./image/Ad banner 1.png\" alt=\"\">\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"col row category-list mx-3 d-flex flex-wrap justify-content-between\">\n");
      out.write("                    <div class=\"col-4 col-sm-4 \" style=\"width: 30%\">\n");
      out.write("                        ");
      if (_jspx_meth_c_forEach_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                        <!-- begin item -->\n");
      out.write("                        <!-- begin item -->\n");
      out.write("                        <!-- begin item -->\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"col-4 col-sm-4 \" style=\"width: 30%\">\n");
      out.write("                        <!-- begin item -->\n");
      out.write("                        <div class=\"item mb-4 text-center\">\n");
      out.write("                            <div class=\"card border-0 shadow\">\n");
      out.write("                                <img src=\"./image/category-2.png\" class=\"card-img-top\" alt=\"\">\n");
      out.write("                                <div class=\"overlay\"></div>\n");
      out.write("                                <div class=\"card-content\">\n");
      out.write("                                    <h5 class=\"card-title mb-3 fw-bold\">Chicken Egg</h5>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <!-- begin item -->\n");
      out.write("\n");
      out.write("                        <!-- begin item -->\n");
      out.write("                        <div class=\"item mb-4 text-center\">\n");
      out.write("                            <div class=\"card border-0 shadow\">\n");
      out.write("                                <img src=\"./image/Item image.png\" class=\"card-img-top\" alt=\"\">\n");
      out.write("                                <div class=\"overlay\"></div>\n");
      out.write("                                <div class=\"card-content\">\n");
      out.write("                                    <h5 class=\"card-title mb-3 fw-bold\">Chicken Egg</h5>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <!-- begin item -->\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"col-4 col-sm-4 \" style=\"width: 30%\">\n");
      out.write("                        <!-- begin item -->\n");
      out.write("                        <div class=\"item mb-4 text-center\">\n");
      out.write("                            <div class=\"card border-0 shadow\">\n");
      out.write("                                <img src=\"./image/Item image.png\" class=\"card-img-top\" alt=\"\">\n");
      out.write("                                <div class=\"overlay\"></div>\n");
      out.write("                                <div class=\"card-content\">\n");
      out.write("                                    <h5 class=\"card-title mb-3 fw-bold\">Chicken Egg</h5>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <!-- begin item -->\n");
      out.write("\n");
      out.write("                        <!-- begin item -->\n");
      out.write("                        <div class=\"item mb-4 text-center\">\n");
      out.write("                            <div class=\"card border-0 shadow\">\n");
      out.write("                                <img src=\"./image/Item image.png\" class=\"card-img-top\" alt=\"\">\n");
      out.write("                                <div class=\"overlay\"></div>\n");
      out.write("\n");
      out.write("                                <div class=\"card-content\">\n");
      out.write("                                    <h5 class=\"card-title mb-3 fw-bold\">Chicken Egg</h5>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <!-- begin item -->\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"row pb-3 mx-5\">\n");
      out.write("                <div class=\"col row category-list mx-3 d-flex flex-wrap justify-content-between\">\n");
      out.write("                    <div class=\"col-4 col-sm-4\" style=\"width: 30%\">\n");
      out.write("                        <!-- begin item -->\n");
      out.write("                        <div class=\"item mb-4 text-center\">\n");
      out.write("                            <div class=\"card border-0 shadow\">\n");
      out.write("                                <img src=\"./image/category-1.png\" class=\"card-img-top\" alt=\"\">\n");
      out.write("                                <div class=\"overlay\"></div>\n");
      out.write("                                <div class=\"card-content\">\n");
      out.write("                                    <h5 class=\"card-title mb-3 fw-bold\">Chicken Egg</h5>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <!-- end item -->\n");
      out.write("\n");
      out.write("                        <!-- begin item -->\n");
      out.write("                        <div class=\"item mb-4 text-center\">\n");
      out.write("                            <div class=\"card border-0 shadow\">\n");
      out.write("                                <img src=\"./image/category-2.png\" class=\"card-img-top\" alt=\"\">\n");
      out.write("                                <div class=\"overlay\"></div>\n");
      out.write("                                <div class=\"card-content\">\n");
      out.write("                                    <h5 class=\"card-title mb-3 fw-bold\">Chicken Egg</h5>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <!-- end item -->\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"col-4 col-sm-4 \" style=\"width: 30%\">\n");
      out.write("                        <!-- begin item -->\n");
      out.write("                        <div class=\"item mb-4 text-center\">\n");
      out.write("                            <div class=\"card border-0 shadow\">\n");
      out.write("                                <img src=\"./image/category-2.png\" class=\"card-img-top\" alt=\"\">\n");
      out.write("                                <div class=\"overlay\"></div>\n");
      out.write("                                <div class=\"card-content\">\n");
      out.write("                                    <h5 class=\"card-title mb-3 fw-bold\">Chicken Egg</h5>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <!-- end item -->\n");
      out.write("\n");
      out.write("                        <!-- begin item -->\n");
      out.write("                        <div class=\"item mb-4 text-center\">\n");
      out.write("                            <div class=\"card border-0 shadow\">\n");
      out.write("                                <img src=\"./image/Item image.png\" class=\"card-img-top\" alt=\"\">\n");
      out.write("                                <div class=\"overlay\"></div>\n");
      out.write("                                <div class=\"card-content\">\n");
      out.write("                                    <h5 class=\"card-title mb-3 fw-bold\">Chicken Egg</h5>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <!-- end item -->\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"col-4 col-sm-4 \" style=\"width: 30%\">\n");
      out.write("                        <!-- begin item -->\n");
      out.write("                        <div class=\"item mb-4 text-center\">\n");
      out.write("                            <div class=\"card border-0 shadow\">\n");
      out.write("                                <img src=\"./image/Item image.png\" class=\"card-img-top\" alt=\"\">\n");
      out.write("                                <div class=\"overlay\"></div>\n");
      out.write("                                <div class=\"card-content\">\n");
      out.write("                                    <h5 class=\"card-title mb-3 fw-bold\">Chicken Egg</h5>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <!-- end item -->\n");
      out.write("\n");
      out.write("                        <!-- begin item -->\n");
      out.write("                        <div class=\"item mb-4 text-center\">\n");
      out.write("                            <div class=\"card border-0 shadow\">\n");
      out.write("                                <img src=\"./image/Item image.png\" class=\"card-img-top\" alt=\"\">\n");
      out.write("                                <div class=\"overlay\"></div>\n");
      out.write("                                <div class=\"card-content\">\n");
      out.write("                                    <h5 class=\"card-title mb-3 fw-bold\">Chicken Egg</h5>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <!-- end item -->\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"col ad-banner mx-3\">\n");
      out.write("                    <img src=\"./image/Ad banner 1.png\" alt=\"\">\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!-- BEST SELLING -->\n");
      out.write("        <div class=\"best-selling\" id=\"best-selling\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("\n");
      out.write("                <div class=\"best-selling-title \">\n");
      out.write("                    <h1 class=\"pt-5 pb-5 text-center fw-bold\"><em>Best selling</em></h1>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"item-list mx-5\">\n");
      out.write("                    <div class=\"row \">\n");
      out.write("                        ");
      if (_jspx_meth_c_if_1(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <nav aria-label=\"Page navigation example\">\n");
      out.write("\n");
      out.write("                    <ul class=\"pagination justify-content-center\">\n");
      out.write("                        <li class=\"page-item\">\n");
      out.write("                            <a class=\"page-link\" href=\"MainController?action=showPage&page=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.page-1}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">Previous</a>\n");
      out.write("                        </li>\n");
      out.write("                        ");
 int totalProduct = ProductDAO.getTotalProduct();
                            int element = 20;
                        
      out.write("\n");
      out.write("                        ");
for (int i = 1; i <= (int) Math.ceil(totalProduct / element); i++) {
      out.write("\n");
      out.write("                        <li class=\"page-item\"><a class=\"page-link\" href=\"MainController?action=showPage&page=");
      out.print(i);
      out.write('"');
      out.write('>');
      out.print(i);
      out.write("</a></li>\n");
      out.write("                            ");
 }
      out.write("\n");
      out.write("                        <li class=\"page-item\">\n");
      out.write("                            <a class=\"page-link\" href=\"MainController?action=showPage&page=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.page+1}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">Next</a>\n");
      out.write("                        </li>\n");
      out.write("                    </ul>\n");
      out.write("                </nav>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- CDN jquery -->\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js\"\n");
      out.write("                integrity=\"sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==\"\n");
      out.write("        crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\"></script>\n");
      out.write("\n");
      out.write("        <!-- CDN carousel -->\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js\"\n");
      out.write("                integrity=\"sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw==\"\n");
      out.write("        crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\"></script>\n");
      out.write("\n");
      out.write("        <!-- Init Own Carousel -->\n");
      out.write("        <script>\n");
      out.write("            $('.owl-carousel').owlCarousel({\n");
      out.write("                loop: true, //loop the carousel from the last item -> first item \n");
      out.write("                margin: 10,\n");
      out.write("                nav: true, //make reference to the nav controls button (prev and next button)\n");
      out.write("                responsive: {\n");
      out.write("                    0: {\n");
      out.write("                        items: 1\n");
      out.write("                    },\n");
      out.write("                    600: {\n");
      out.write("                        items: 3\n");
      out.write("                    },\n");
      out.write("                    1000: {\n");
      out.write("                        items: 5\n");
      out.write("                    }\n");
      out.write("                }\n");
      out.write("            })\n");
      out.write("\n");
      out.write("\n");
      out.write("        </script>\n");
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

  private boolean _jspx_meth_c_forEach_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_forEach_0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _jspx_tagPool_c_forEach_var_items_end_begin.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_forEach_0.setPageContext(_jspx_page_context);
    _jspx_th_c_forEach_0.setParent(null);
    _jspx_th_c_forEach_0.setVar("cate");
    _jspx_th_c_forEach_0.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${CategoryDAO.getCategories()}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    _jspx_th_c_forEach_0.setBegin(0);
    _jspx_th_c_forEach_0.setEnd(2);
    int[] _jspx_push_body_count_c_forEach_0 = new int[] { 0 };
    try {
      int _jspx_eval_c_forEach_0 = _jspx_th_c_forEach_0.doStartTag();
      if (_jspx_eval_c_forEach_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("                            <div class=\"item mb-4 text-center\">\n");
          out.write("                                <div class=\"card border-0 shadow\">\n");
          out.write("                                    <img src=\"./image/category-1.png\" class=\"card-img-top\" alt=\"\">\n");
          out.write("                                    <div class=\"overlay\"></div>\n");
          out.write("                                    <div class=\"card-content\">\n");
          out.write("                                        <h5 class=\"card-title mb-3 fw-bold\">");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${cate.CateName}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</h5>\n");
          out.write("                                    </div>\n");
          out.write("\n");
          out.write("                                </div>\n");
          out.write("                            </div>\n");
          out.write("                        ");
          int evalDoAfterBody = _jspx_th_c_forEach_0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_forEach_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_forEach_0[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_forEach_0.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_forEach_0.doFinally();
      _jspx_tagPool_c_forEach_var_items_end_begin.reuse(_jspx_th_c_forEach_0);
    }
    return false;
  }

  private boolean _jspx_meth_c_if_1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_1 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_1.setPageContext(_jspx_page_context);
    _jspx_th_c_if_1.setParent(null);
    _jspx_th_c_if_1.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${ProductDAO.getProducts() != null}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_1 = _jspx_th_c_if_1.doStartTag();
    if (_jspx_eval_c_if_1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("                            ");
        if (_jspx_meth_c_if_2((javax.servlet.jsp.tagext.JspTag) _jspx_th_c_if_1, _jspx_page_context))
          return true;
        out.write("\n");
        out.write("                            ");
        if (_jspx_meth_c_if_3((javax.servlet.jsp.tagext.JspTag) _jspx_th_c_if_1, _jspx_page_context))
          return true;
        out.write("\n");
        out.write("\n");
        out.write("                        ");
        int evalDoAfterBody = _jspx_th_c_if_1.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_if_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_1);
      return true;
    }
    _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_1);
    return false;
  }

  private boolean _jspx_meth_c_if_2(javax.servlet.jsp.tagext.JspTag _jspx_th_c_if_1, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_2 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_2.setPageContext(_jspx_page_context);
    _jspx_th_c_if_2.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_if_1);
    _jspx_th_c_if_2.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.list == null}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_2 = _jspx_th_c_if_2.doStartTag();
    if (_jspx_eval_c_if_2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("                                ");
        if (_jspx_meth_c_forEach_1((javax.servlet.jsp.tagext.JspTag) _jspx_th_c_if_2, _jspx_page_context))
          return true;
        out.write("\n");
        out.write("                            ");
        int evalDoAfterBody = _jspx_th_c_if_2.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_if_2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_2);
      return true;
    }
    _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_2);
    return false;
  }

  private boolean _jspx_meth_c_forEach_1(javax.servlet.jsp.tagext.JspTag _jspx_th_c_if_2, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_forEach_1 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _jspx_tagPool_c_forEach_var_items_end_begin.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_forEach_1.setPageContext(_jspx_page_context);
    _jspx_th_c_forEach_1.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_if_2);
    _jspx_th_c_forEach_1.setVar("product");
    _jspx_th_c_forEach_1.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${ProductDAO.getProducts()}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    _jspx_th_c_forEach_1.setBegin(0);
    _jspx_th_c_forEach_1.setEnd(19);
    int[] _jspx_push_body_count_c_forEach_1 = new int[] { 0 };
    try {
      int _jspx_eval_c_forEach_1 = _jspx_th_c_forEach_1.doStartTag();
      if (_jspx_eval_c_forEach_1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("                                    <div class=\"col\">\n");
          out.write("                                        <!-- begin item -->\n");
          out.write("                                        <div class=\"item mb-4 text-center\">\n");
          out.write("                                            <div class=\"card border-0 shadow\">\n");
          out.write("                                                <img src=\"./image/Item.png\" class=\"card-img-top\" alt=\"\">\n");
          out.write("                                                <div class=\"card-body\">\n");
          out.write("                                                    <h5 class=\"card-title mb-3 fw-bold\"><a href='MainController?action=viewProduct&pid=");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${product.productID}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write('\'');
          out.write('>');
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${product.productName}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</a></h5>\n");
          out.write("                                                    <span class=\"bricked-price mx-2\">");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${product.price}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</span>\n");
          out.write("                                                    <span class=\"price fw-bold mx-2\">$1.19</span></br>\n");
          out.write("                                                    <a href=\"#\" class=\"btn btn-primary mt-3 px-3 py-2 fw-bold\">Add To Cart</a>\n");
          out.write("                                                </div>\n");
          out.write("                                            </div>\n");
          out.write("                                        </div>\n");
          out.write("                                        <!-- end item -->\n");
          out.write("                                    </div>\n");
          out.write("\n");
          out.write("                                ");
          int evalDoAfterBody = _jspx_th_c_forEach_1.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_forEach_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_forEach_1[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_forEach_1.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_forEach_1.doFinally();
      _jspx_tagPool_c_forEach_var_items_end_begin.reuse(_jspx_th_c_forEach_1);
    }
    return false;
  }

  private boolean _jspx_meth_c_if_3(javax.servlet.jsp.tagext.JspTag _jspx_th_c_if_1, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_3 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_3.setPageContext(_jspx_page_context);
    _jspx_th_c_if_3.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_if_1);
    _jspx_th_c_if_3.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.list != null}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_3 = _jspx_th_c_if_3.doStartTag();
    if (_jspx_eval_c_if_3 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("                                ");
        if (_jspx_meth_c_forEach_2((javax.servlet.jsp.tagext.JspTag) _jspx_th_c_if_3, _jspx_page_context))
          return true;
        out.write("\n");
        out.write("                            ");
        int evalDoAfterBody = _jspx_th_c_if_3.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_if_3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_3);
      return true;
    }
    _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_3);
    return false;
  }

  private boolean _jspx_meth_c_forEach_2(javax.servlet.jsp.tagext.JspTag _jspx_th_c_if_3, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_forEach_2 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _jspx_tagPool_c_forEach_var_items.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_forEach_2.setPageContext(_jspx_page_context);
    _jspx_th_c_forEach_2.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_if_3);
    _jspx_th_c_forEach_2.setVar("product");
    _jspx_th_c_forEach_2.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.list}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    int[] _jspx_push_body_count_c_forEach_2 = new int[] { 0 };
    try {
      int _jspx_eval_c_forEach_2 = _jspx_th_c_forEach_2.doStartTag();
      if (_jspx_eval_c_forEach_2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("                                    <div class=\"col\">\n");
          out.write("                                        <!-- begin item -->\n");
          out.write("                                        <div class=\"item mb-4 text-center\">\n");
          out.write("                                            <div class=\"card border-0 shadow\">\n");
          out.write("                                                <img src=\"./image/Item.png\" class=\"card-img-top\" alt=\"\">\n");
          out.write("                                                <div class=\"card-body\">\n");
          out.write("                                                    <h5 class=\"card-title mb-3 fw-bold\">");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${product.productName}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</h5>\n");
          out.write("                                                    <span class=\"bricked-price mx-2\">");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${product.price}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</span>\n");
          out.write("                                                    <span class=\"price fw-bold mx-2\">$1.19</span></br>\n");
          out.write("                                                    <a href=\"#\" class=\"btn btn-primary mt-3 px-3 py-2 fw-bold\">Add To Cart</a>\n");
          out.write("                                                </div>\n");
          out.write("                                            </div>\n");
          out.write("                                        </div>\n");
          out.write("                                        <!-- end item -->\n");
          out.write("                                    </div>\n");
          out.write("\n");
          out.write("                                ");
          int evalDoAfterBody = _jspx_th_c_forEach_2.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_forEach_2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_forEach_2[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_forEach_2.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_forEach_2.doFinally();
      _jspx_tagPool_c_forEach_var_items.reuse(_jspx_th_c_forEach_2);
    }
    return false;
  }
}
