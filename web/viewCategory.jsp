<%@page import="dao.CategoryDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <c:choose>
            <c:when test="${sessionScope.manager == null}">
                <c:set var="warning" value="You need to log in as Admin to access" scope="request"/>
                <jsp:forward page="login.jsp"/>
            </c:when>
            <c:otherwise>
                <!--HEADER-->
                <header>
                    <c:import url="header_managerDashboard.jsp" />
                </header>

                <div class="container-fluid">

                    <!-- menu -->
                    <div class="menu-btn">
                        <input type="checkbox" id="nav-toggle">
                    </div>


                    <div class="side-bar">
                        <div class="menu">
                            <div class="item">
                                <a class="sub-btn">
                                    <i class="fa-solid fa-user mx-3"></i>
                                    User
                                    <i class="fa-solid fa-angle-right dropdown"></i>
                                </a>
                                <div class="sub-menu">
                                    <a href="MainController?action=viewCustomers" class="sub-item">Customers</a>
                                    <a href="MainController?action=viewSales" class="sub-item">Sales</a>
                                    <a href="MainController?action=viewGuards" class="sub-item">Guards</a>
                                </div>
                            </div>

                            <div class="item">
                                <a href="MainController?action=viewAllCategories" class="sub-btn active">
                                    <span><i class="fa-solid fa-bars-staggered mx-3"></i></span>
                                    <span>Category</span>
                                </a>
                            </div>

                            <div class="item">
                                <a  href="MainController?action=viewAllProducts" class="sub-btn">
                                    <span><i class="fa-solid fa-box mx-3"></i></span>
                                    <span>Product</span>
                                </a>
                            </div>

                            <div class="item">
                                <a href="MainController?action=viewVouchers" class="sub-btn">
                                    <span><i class="fa-solid fa-tag mx-3"></i></span>
                                    <span>Voucher</span>
                                </a>
                            </div>

                            <div class="item" >
                                <a class="sub-btn" href="MainController?action=viewSchedule">
                                    <span><i class="fa-solid fa-clipboard-user mx-3" href="MainController?action=viewSchedule"></i></span>
                                    <span>Schedule</span>
                                </a>
                            </div>

                            <div class="item">
                                <a class="sub-btn" href="MainController?action=viewAllOrders">
                                    <span><i class="fa-solid fa-cart-shopping mx-3"></i></span>
                                    <span>Order</span>
                                </a>
                            </div>

                        </div>
                    </div>


                    <!-- table -->
                    <div class="dashboard">
                        <div class=" mt-4 group-form d-flex justify-content-between">
                            <div>
                                <form class="search text-center d-flex align-items-center">
                                    <input type="text" placeholder="Search..." name="keyword">
                                    <button id="search-button" type="submit" class="btn" name="action">
                                        <i class="fas fa-search"></i>
                                    </button>
                                </form>
                            </div>                    

                            <div class="add">                    
                                <a role="button" class=" btn_add " data-bs-toggle="modal" data-bs-target="#addModal">Add</a>
                            </div>                    
                        </div>

                        <table class="table mt-4 text-center">
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Category Name</th>
                                    <th scope="col">Details</th>
                                </tr>
                            </thead>

                            <tbody>

                                <c:if test="${requestScope.cplist == null}">
                                    <c:forEach var="cate" items="${requestScope.cateList}" begin="0" end="5" varStatus="status">
                                        <tr>
                                            <td>${cate.cateID}</td>
                                            <td>
                                                <img style="width: 40px; height: 40px;" src="${cate.imgPath}"/>
                                            </td>
                                            <td>${cate.cateName}</td>

                                            <td>
                                                <button data-bs-toggle="modal" data-bs-target="#myModal${status.index}"><i class="update fa-solid fa-pen-to-square mx-2 "></i></button>
                                            </td>
                                        </tr>

                                        <!--/*------------------POP UP SCREEN CATEGORY DETAIL------------------*/-->
                                    <div class="modal" id="myModal${status.index}">
                                        <div class="modal-dialog">
                                            <div class="modal-content">

                                                <form action="UpdateCategoryServlet" method="post" enctype="multipart/form-data">
                                                    <!-- Modal Header -->
                                                    <div class="modal-header">
                                                        <h4 class="modal-title">Update Category</h4>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                    </div>

                                                    <!-- Modal body -->
                                                    <div class="modal-body">
                                                        <div class="mb-3 mt-3">
                                                            <label for="cid" class="form-label">ID: </label>
                                                            <input type="text" class="form-control" id="cid" name="cateID" value="${cate.cateID}" readonly="">

                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="cname" class="form-label">Category Name</label>
                                                            <input type="text" class="form-control" id="cname" name="cateName" value="${cate.cateName}">
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="" class="form-label">Image</label>
                                                            <div class="mb-2">
                                                                <input class="no-border" type="file" name="file" size="60" required=""/>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <!-- Modal footer -->
                                                    <div class="modal-footer">
                                                        <button type="submit" class="btn btn-success" name="action" value="updateCategory">Update</button>
                                                    </div>
                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                    <!--/*--------------------------------------------------------------*/-->
                                </c:forEach>
                            </c:if> 
                            <c:if test="${requestScope.cplist != null}">
                                <c:forEach var="cate" items="${requestScope.cplist}" begin="0" end="5" varStatus="status">
                                    <tr>
                                        <td>${cate.cateID}</td>
                                        <td>
                                            <img style="width: 40px; height: 40px;" src="${cate.imgPath}"/>
                                        </td>
                                        <td>${cate.cateName}</td>

                                        <td>
                                            <button data-bs-toggle="modal" data-bs-target="#myModal${status.index}"><i class="update fa-solid fa-pen-to-square mx-2 "></i></button>
                                        </td>
                                    </tr>

                                    <!--/*------------------POP UP SCREEN CATEGORY DETAIL------------------*/-->
                                    <div class="modal" id="myModal${status.index}">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <form action="UpdateCategoryServlet" method="post" enctype="multipart/form-data">
                                                    <!-- Modal Header -->
                                                    <div class="modal-header">
                                                        <h4 class="modal-title">Update Category</h4>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                    </div>

                                                    <!-- Modal body -->
                                                    <div class="modal-body">
                                                        <div class="mb-3 mt-3">
                                                            <label for="cid" class="form-label">ID: </label>
                                                            <input type="text" class="form-control" id="cid" name="cateID" value="${cate.cateID}" readonly="">

                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="cname" class="form-label">Category Name</label>
                                                            <input type="text" class="form-control" id="cname" name="cateName" value="${cate.cateName}">
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="" class="form-label">Image</label>
                                                            <div class="mb-2">
                                                                <input class="no-border" type="file" name="file" size="60" required=""/>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <!-- Modal footer -->
                                                    <div class="modal-footer">
                                                        <button type="submit" class="btn btn-success" name="action" value="updateCategory">Update</button>
                                                    </div>
                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                    <!--/*--------------------------------------------------------------*/-->
                                </c:forEach>
                            </c:if>

                            </tbody>
                        </table>

                        <nav aria-label="Page navigation example" style="margin-top: 30px ">
                            <ul class="pagination justify-content-center">
                                <c:if test="${requestScope.page == 1  || requestScope.page== null}">
                                    <li class="page-item">
                                        <a class="page-link" style="padding: 5px 10px !important;color: #1B9C85" href="MainController?action=showItemsPage&page=1&items=category" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${requestScope.page > 1}">
                                    <li class="page-item">
                                        <a class="page-link" style="padding: 5px 10px !important;color: #1B9C85" href="MainController?action=showItemsPage&page=${requestScope.page-1}&items=category" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:set var="totalCategories" value="${CategoryDAO.getCategories().size()}"/>
                                <c:set var="numOfPages" value="${Math.ceil(totalCategories / 6)}"/>
                                <fmt:formatNumber value="${numOfPages}" pattern="0" var="intLastPage" />

                                <c:forEach var="i" begin="1" end="${numOfPages}">
                                    <li class="page-item "><a class="page-link " style="padding:5px 10px  !important;color: #1B9C85" href="MainController?action=showItemsPage&page=${i}&items=category">${i}</a></li>

                                </c:forEach>


                                <c:choose>
                                    <c:when test="${intLastPage > 1}">
                                        <c:if test="${requestScope.page <  numOfPages || requestScope.page == null}">
                                            <li class="page-item">
                                                <a class="page-link" style="padding:5px 10px  !important;color: #1B9C85" href="MainController?action=showItemsPage&page=${requestScope.page+1}&items=category" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </c:if>                          
                                        <c:if test="${requestScope.page >=  numOfPages}">
                                            <li class="page-item">
                                                <a class="page-link" style="padding:5px 10px !important;color: #1B9C85" href="MainController?action=showItemsPage&page=${intLastPage}&items=category" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </c:if> 
                                    </c:when>
                                    <c:when test="${intLastPage <= 1}">
                                        <c:if test="${requestScope.page == 1 || requestScope.page ==null}">
                                            <li class="page-item">
                                                <a class="page-link" style="padding:5px 10px !important;color: #1B9C85" href="#" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                    </c:when>
                                </c:choose>  
                            </ul>
                        </nav>
                    </div>

                    <div class="modal" id="addModal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="AddNewCategoryServlet" method="post" enctype="multipart/form-data">
                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h4 class="modal-title">Add New Category</h4>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                    </div>
                                    <!-- Modal body -->
                                    <div class="modal-body">
                                        <div class="my-3">
                                            <label for="cname" class="form-label">Category Name</label>
                                            <input type="text" class="form-control" id="cname" name="cateName" required="">
                                            <div class="my-3">
                                                <input class="no-border" type="file" name="file" size="60" required=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Modal footer -->
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-success" name="action" value="addNewCategory">Add</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

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
                    <script>
                        if (window.history.replaceState) {
                            window.history.replaceState(null, null, "MainController?action=viewAllCategories");
                        }
                    </script>
                </c:otherwise>
            </c:choose>
    </body>
</html>
