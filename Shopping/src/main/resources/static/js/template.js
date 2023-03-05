const menuside1 = document.getElementById('menuside1');
    const menuside2 = document.getElementById('menuside2');
    const cartButton = document.getElementById('cartButton');
    const cartButton2 = document.getElementById('cartButton2');
    const sidebar = document.getElementById('sidebar');
    const sidebarright = document.getElementById('sidebarright');
    const overplay = document.getElementById('overplay');
    const imgHover = document.getElementById('imgHover');
    const viewdetail = document.getElementById('view-detailX');
    const imgDiv = document.getElementById('imgDiv');
    //Sidebar
    let menuOpen = false;
    let menuOpenCart = false;

    function openMenu() {
        menuOpen = true;
        overplay.style.display = 'block';
        sidebar.style.width = '280px';
    }

    function closeMenu() {
        menuOpen = false;
        menuOpenCart = false;
        overplay.style.display = 'none';
        sidebar.style.width = '0px';
        sidebarright.style.width = '0px';
    }

    menuside1.addEventListener('click', function() {
        if (!menuOpen) {
            openMenu();
        }
    })
    menuside2.addEventListener('click', function() {
            if (!menuOpen) {
                openMenu();
            }
        })
        //Cart


    function openMenuCart() {
        menuOpenCart = true;
        overplay.style.display = 'block';
        sidebarright.style.width = '350px';
    }

    cartButton.addEventListener('click', function() {
        if (!menuOpenCart) {
            openMenuCart();
        }
    })
    cartButton2.addEventListener('click', function() {
        if (!menuOpenCart) {
            closeMenu();
            openMenuCart();
        }
    })
    overplay.addEventListener('click', function() {
        if (menuOpen || menuOpenCart) {
            closeMenu();
        }
    })
    
    
    $(document).ready(function() {
            $("#login").click(function() {
                $("#myModal").modal();
            });
        });
        
        $(document).ready(function() {
            $("#registerbtn").click(function() {
                $("#register").modal();
            });
        });


        $(document).ready(function() {


            var readURL = function(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function(e) {
                        $('.avatar').attr('src', e.target.result);
                    }

                    reader.readAsDataURL(input.files[0]);
                }
            }


            $(".file-upload").on('change', function() {
                readURL(this);
            });
        });