<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Expense Tracker</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, 'Geneva', Verdana, sans-serif;
            
            background-image:radial-gradient(grey,#c0c0c0,#dbd7d2,#91A3B0,grey,white);
            background-size:400%;
           
            background-repeat: repeat;
        }

      
          .content-area {
            margin-top: 80px; 
        }

        .about-section {
            padding: 5rem 0;
        }

        .team-section {
            padding: 5rem 0;
        }

        .testimonials-section {
            padding: 5rem 0;
            background-color: #f8f9fa;
        }

        .blockquote {
            font-size: 1.2rem;
        }
        .navbar-brand img {
            max-height: 40px;
          }
          .navbar {
            background: linear-gradient(270deg, #2d388a, #00aeef);
          }
          .nav-link:hover a {
            color: white;
          }
    </style>
</head>
<body>
    <!-- <nav class="navbar navbar-expand-md navbar-dark fixed-top">
        <a class="navbar-brand" href="#">
          <img src="./images/expmgr1.png" alt="Expense Manager Logo">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="true" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="#">About Us <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="homepage.jsp">Home</a>
              </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Username</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Logout</a>
            </li>
          </ul>
        </div>
      </nav> -->
      <%@include file="navbar.jsp"%>
      <div class="content-area">
    <section class="about-section">
        <div class="container">
            <div class="row">
                <div class="col-md-6 animate__animated animate__fadeInLeft">
                    <h2>About Our EXPMGR</h2>
                    <p>We are a team of passionate developers dedicated to helping individuals and businesses manage their finances more effectively. Our expense tracker was born out of a desire to simplify the process of tracking expenses and gaining better control over spending habits.</p>
                    <p>With years of experience in financial management and cutting-edge technology, we have created a user-friendly solution that makes expense tracking a breeze.</p>
                </div>
                <div class="col-md-6 animate__animated animate__fadeInRight">
                    <img src="./images/fullname.png" alt="About Image" class="img-fluid rounded">
                </div>
            </div>
        </div>
    </section>

    <section class="team-section ">
        <div class="container">
            <h2 class="text-center mb-6">Meet Our Team</h2>
            <div class="row">
                <div class="col-md-6 mb-6" style="margin-bottom:25px;">
                    <div class="card animate__animated animate__fadeInUp">
                        <img src="./images/anurag.jpg" alt="Team Member 1" class="card-img-top" style="height:350px;width:400px;align-self:center;">
                        <div class="card-body" style="background-color:aquamarine;">
                            <h5 class="card-title">Anurag Dalal</h5>
                            <p class="card-text">Back-End Dev 1</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-6" style="margin-bottom:25px;" >
                    <div class="card animate__animated animate__fadeInUp animate__delay-1s">
                        <img src="./images/hitesh.jpg" alt="Team Member 2" class="card-img-top" style="height:350px;width:400px;align-self:center;">
                        <div class="card-body" style="background-color:aquamarine;">
                            <h5 class="card-title">Hitesh Sethiya</h5>
                            <p class="card-text">Front-End Dev</p>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6 mb-6" style="margin-bottom:25px;" >
                    <div class="card animate__animated animate__fadeInUp animate__delay-2s">
                        <img src="./images/rahul.jpg" alt="Team Member 3" class="card-img-top" style="height:350px;width:400px;align-self:center;">
                        <div class="card-body" style="background-color:aquamarine;">
                            <h5 class="card-title">Rahul Girmaji</h5>
                            <p class="card-text">Back-End Dev 2</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-6" style="margin-bottom:25px;" >
                    <div class="card animate__animated animate__fadeInUp animate__delay-2s">
                        <img src="./images/rohan.jpg" alt="Team Member 3" class="card-img-top" style="height:350px;width:400px;align-self:center;">
                        <div class="card-body" style="background-color:aquamarine;" >
                            <h5 class="card-title">Rohan Prabhune</h5>
                            <p class="card-text">Documentation Expert</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <footer class="bg-dark text-white text-center py-3 mt-5">
        <p>© 2024 EXPMGR. All rights reserved.</p>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<div>
</body>
</html>