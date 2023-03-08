<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <style type="text/css">
  .my-custom-scrollbar {
	position: relative;
	height: 600px;
	width: 1000px;
	overflow: auto;
	}
	.table-wrapper-scroll-y {
	display: block;
	}
  </style>
</head>

<body>
<div class="vh-100" style="background-color: #eee;">
  <div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-lg-12 col-xl-11">
        <div class="card text-black" style="border-radius: 25px;">
          <div class="card-body p-md-5">
            <div class="row justify-content-center">
              <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign up</p>
                	
                	<c:choose>  
               
					    <c:when test="${param.count>0}">  
					      <div class="alert alert-success alert-dismissible fade show" role="alert">
					      <strong>Data Inserted Successfully !!</strong> 
					      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
					    </div>
					    </c:when>  
					    
					    <c:when test="${param.count<0}">  
					      <div class="alert alert-danger alert-dismissible fade show" role="alert">
					      <strong>Data Insertion Failed!!</strong> 
					      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
					    </div>
					    </c:when> 
					     
					    <c:when test="${param.deletecount>0}">  
					      <div class="alert alert-warning alert-dismissible fade show" role="alert">
					      <strong>Data Deleted Successfully !!</strong> 
					      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
					    </div>
					    </c:when> 
					     
					    <c:otherwise>  
					       
					    </c:otherwise>  
					</c:choose>  
                <form class="mx-1 mx-md-4" action="insert.jsp">

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="text" name="Name" placeholder="Your Name" class="form-control" />
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="email" name="Email" placeholder="Your Email" class="form-control" />
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="password" name="Password" placeholder="Password" class="form-control" />
                    </div>
                  </div>
                  
                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-phone fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="text" name="phone" placeholder="Your Phone Number" class="form-control" />
                    </div>
                  </div>
                  
                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-home fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="text" name="address" placeholder=" Your Address" class="form-control" />
                    </div>
                  </div>

                  <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                    <button type="submit" class="btn btn-primary btn-lg">Register</button>
                  </div>

                </form>

              </div>
              
              <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">
                <div class="table-wrapper-scroll-y my-custom-scrollbar">
				<h5>All USERS</h5>
				<jsp:include page="Connection.jsp"></jsp:include>
				<sql:query dataSource="${db}" var="rs">
					SELECT * from emp_details;  
				</sql:query>
				  <table class="table table-bordered table-striped mb-0">
				    <thead>
				      <tr>
				        <th scope="col">#</th>
				        <th scope="col">Name</th>
				        <th scope="col">Email</th>
				        <th scope="col">Pass</th>
				        <th scope="col">Phone</th>
				        <th scope="col">Address</th>
				        <th scope="col">Edit</th>
				        <th scope="col">Delete</th>
				      </tr>
				    </thead>
				    <tbody>
				    <c:forEach var="table" items="${rs.rows}">
				    <c:set var="index" scope = "session" value="${1}"/>
				      <tr>
				        <th scope="row"><c:out value = "${index}"/></th>
				     	
				        <td><c:out value="${table.Name}"/></td>
				        <td><c:out value="${table.email}"/></td>
				        <td><c:out value="${table.pass}"/></td>
				        <td><c:out value="${table.phone}"/></td>
				        <td><c:out value="${table.address}"/></td>
				        <td><a type="button"  class="btn btn-success" href="edit.jsp?id=${table.id}">Edit</a></td>
				        <td><a type="button" class="btn btn-danger" href="delete.jsp?id=${table.id}">Delete</a></td>
				      </tr>
				      <c:set var="index" value="${index+1}"/>
				     </c:forEach>
				    </tbody>
				  </table>
				
				</div>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

</body>
</html>