<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="./css/productDetail.css">

        <!-- boostrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

        <!-- font Inter -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Inter&display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;800&display=swap" rel="stylesheet" />

        <!-- font icon cdn -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="./js/index.js">
        
    </head>

    <body>
        <!-- HEADER -->
        <header>
            <c:choose>
                <c:when test="${sessionScope.customer != null}">
                    <c:import url="header.jsp" />
                </c:when>
                <c:otherwise>
                    <c:import url="header_unlogined.jsp" />
                </c:otherwise>
            </c:choose>
        </header>
        
        
        <!-- HEADER PATH -->
        <nav class="navbar navbar_path navbar-expand-lg header-path mt-4 mb-1">
            <div class="container-fluid">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="MainController?action=backToHome">Home</a>
                        </li>
                        <li class="breadcrumb-item active">
                            <a href="#">${requestScope.cateName}</a>
                        </li>
                    </ol>
                </nav>
            </div>
        </nav>


        <!-- RELATED PRODUCT -->
        <div class="container-fluid product-detail my-5">
            <div class="item-list mx-5">
                <div class="row row-cols-md-5">
                    <c:if test="${requestScope.proCateList != null}">
                        <c:forEach var="proCate" items="${requestScope.proCateList}">
                            <div class="col">
                                <div class="item mb-4 text-center">
                                    <div class="card border-0 shadow align-items-center">
                                        <img src="${proCate.imgPath}" class="card-img-top" alt="">
                                        <div class="card-body d-flex flex-column">
                                            <h5 class="card-title mb-3 fw-bold"><a href="MainController?action=viewProduct&pid=${proCate.productID}&cateID=${proCate.cateID}">${proCate.productName}</a></h5>
                                            <span class="price mx-2">$${proCate.price}</span>
                                            <a href="MainController?action=addToCart&quantity=1&pid=${proCate.productID}&cid=${proCate.cateID}" class="btn btn-primary mt-3 px-3 py-2 fw-bold">Add To Cart</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- end item -->
                            </div>
                        </c:forEach>
                    </c:if>    
                </div>
            </div>
        </div>
    </div>

    <!-- back to top -->
    <button type="button" class="btn btn-danger btn-floating btn-lg" id="btn-back-to-top">
        <i class="fas fa-arrow-up"></i>
    </button>

</body>

</html>