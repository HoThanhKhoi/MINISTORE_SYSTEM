
<%@page import="dao.CategoryDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ministore</title>
        <link rel="stylesheet" href="./css/managerScreen.css" />

        <!-- Icon CDN -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />


        <!-- boostrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

        <!-- font Inter -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@200;300;400;500;600;700;800&display=swap"
              rel="stylesheet">
    </head>

    <body>

        <!--HEADER-->
        <header>
            <c:import url="header_managerDashboard.jsp" />
        </header>

        <div class="container-fluid">
            <div class="row">

                <!-- menu -->
                <div class="menu-btn">
                    <input type="checkbox" id="nav-toggle">
                </div>


                <div class="col-2 side-bar">
                    <!--                    <header>
                                            <div class="close-btn">
                                                <i class="fa-sharp fa-solid fa-circle-xmark"></i>
                                            </div>
                                        </header>-->


                    <div class="menu">
                        <div class="item">
                            <a class="sub-btn">
                                <i class="fa-solid fa-user mx-3"></i>
                                User
                                <i class="fa-solid fa-angle-right dropdown"></i>
                            </a>
                            <div class="sub-menu">
                                <a href="#" class="sub-item active">Customers</a>
                                <a href="#" class="sub-item">Sales</a>
                                <a href="#" class="sub-item">Guards</a>
                            </div>
                        </div>

                        <div class="item">
                            <a class="sub-btn">
                                <span><i class="fa-solid fa-bars-staggered mx-3"></i></span>
                                <span>Category</span>
                            </a>
                        </div>

                        <div class="item">
                            <a class="sub-btn">
                                <span><i class="fa-solid fa-box mx-3"></i></span>
                                <span>Product</span>
                            </a>
                        </div>

                        <div class="item">
                            <a class="sub-btn">
                                <span><i class="fa-solid fa-tag mx-3"></i></span>
                                <span>Voucher</span>
                            </a>
                        </div>

                        <div class="item">
                            <a class="sub-btn">
                                <span><i class="fa-solid fa-clipboard-user mx-3"></i></span>
                                <span>Attendance</span>
                            </a>
                        </div>

                        <div class="item">
                            <a class="sub-btn">
                                <span><i class="fa-solid fa-cart-shopping mx-3"></i></span>
                                <span>Order</span>
                            </a>
                        </div>

                    </div>
                </div>
                
                
                <!-- table -->
                <div class="col dashboard ">
                    <form class="search text-center d-flex align-items-center">
                        <input type="text" placeholder="Search...">
                        <button id="search-button" type="button" class="btn">
                            <i class="fas fa-search"></i>
                        </button>
                    </form>


                    <table class="table mt-5 text-center">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Image</th>
                                <th scope="col">Category Name</th>
                                <th scope="col">Edit</th>
                            </tr>
                        </thead>

                        <tbody>


                            <c:if test="${requestScope.cateList != null}">
                                <c:forEach var="cate" items="${requestScope.cateList}" begin="0" end="6">
                                    <tr>
                                        <td>${cate.cateID}</td>
                                        <td>
                                            <img style="width: 40px; height: 40px;" src="${cate.imgPath}"/>
                                        </td>
                                        <td>${cate.cateName}</td>

                                        <td>
                                            <form action="MainController" action="post">
                                                <input type="hidden" name="cateid" value="${cate.cateID}">
                                                <button type="submit" name="action" value="viewCategoryDetailsPage"><i class="update fa-solid fa-pen-to-square mx-2 "></i></button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>  

                        </tbody>
                    </table>
                </div>
                <div><h3 style="color: red">${requestScope.error}</h3></div>
            </div>
            <nav aria-label="Page navigation example" style="margin-top: 50px ">
                <ul class="pagination justify-content-center">
                    <li class="page-item">
                        <a class="page-link" style="padding: 8px 14px !important;color: #1B9C85" href="MainController?action=showItemsPage&page=${requestScope.page-1}&items=category"><</a>
                    </li>
                    <% int totalCategories = CategoryDAO.getCategories().size();
                        int element = 7;
                        float numOfPages = (float) totalCategories / element;
                    %>
                    <%for (int i = 1; i <= (int) Math.ceil(numOfPages); i++) {%>
                    <li class="page-item "><a class="page-link " style="padding:8px 14px !important;color: #1B9C85" href="MainController?action=showItemsPage&page=<%=i%>&items=category"><%=i%></a></li>
                        <% }%>
                    <li class="page-item">
                        <a class="page-link" style="padding:8px 14px !important;color: #1B9C85" href="MainController?action=showItemsPage&page=${requestScope.page+1}&items=category">></a>
                    </li>
                </ul>
            </nav>
        </div>
        
                    
        <!-- FOOTER -->
        <footer>
            <c:import url="footer.jsp" />
        </footer>

        <script type="text/javascript">
            $(document).ready(function () {
//jquery for toggle sub menus
                $('.sub-btn').click(function () {
                    $(this).next('.sub-menu').slideToggle();
                    $(this).find('.dropdown').toggleClass('rotate');
                });

//jquery for expand and collapse the sidebar
                $('.menu-btn').click(function () {
                    $('.side-bar').addClass('active');
                    $('.menu-btn').css("visibility", "hidden");
                });

                $('.close-btn').click(function () {
                    $('.side-bar').removeClass('active');
                    $('.menu-btn').css("visibility", "visible");
                });
            });
        </script>

    </body>
</html>