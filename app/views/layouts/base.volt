<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <link rel="icon" type="image/x-icon" href="{{url('assets/img/favicon.ico')}}"/>
    {% include 'layouts/header.volt' %}
    {% block custom_header %}{% endblock %}
    <title>{% block title %}{% endblock %} - Lingkar Puan</title>
</head>
<body class="sidebar-noneoverflow">
	<!-- BEGIN LOADER -->
    <div id="load_screen"> <div class="loader"> <div class="loader-content">
        <div class="spinner-grow align-self-center"></div>
    </div></div></div>
    <!--  END LOADER -->
    {% if (session.get('user')['role'] == 1) %}
        {% include 'layouts/navbar_user.volt' %}
    {% elseif (session.get('user')['role'] == 2 OR session.get('user')['role'] == 3) %}
        {% include 'layouts/navbar_konsultan.volt' %}
    {% elseif (session.get('user')['role'] == 4) %}
        {% include 'layouts/navbar_penilik.volt' %}
    {% elseif (session.get('user')['role'] == 5) %}
        {% include 'layouts/navbar_admin.volt' %}
    {% else %}
        {% include 'layouts/navbar_default.volt' %}
    {% endif %}
    
    
    <!-- BEGIN MAIN CONTAINER -->
    <div class="main-container" id="container">

        <div class="overlay"></div>
        <div class="search-overlay"></div>
        
        <!--  BEGIN CONTENT AREA  -->
        <div id="content" class="main-content">
            <div class="layout-px-spacing">

                <div class="page-header">
                    <nav class="breadcrumb-one" aria-label="breadcrumb">
                        <div class="title" style="margin-right: 0; border-right: none; padding-right: 0;">
                            <h3>{% block content_title %}{% endblock %}</h3>
                        </div>
                    </nav>
                </div>


                <!-- CONTENT AREA -->
                

                <div class="row layout-top-spacing">
                    
                    <div class="col-xl-12 col-lg-12 col-md-12 col-12 layout-spacing">
                        <div class="widget widget-content-area br-4">
                            <div class="widget-one">

                                {% block content %}{% endblock %}

                            </div>
                        </div>
                    </div>

                </div>


                <!-- CONTENT AREA -->

            </div>
            
            {% include 'layouts/footer.volt' %}
        </div>
        <!--  END CONTENT AREA  -->
    </div>
    <!-- END MAIN CONTAINER -->

    {% include 'layouts/script.volt' %}
    {% block custom_script %}{% endblock %}
    
</body>
</html>