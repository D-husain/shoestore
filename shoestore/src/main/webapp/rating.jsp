<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

  
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        .rate {

            float: left;
            height: 50px;
            padding: 0 10px;
        }

        .rate:not(:checked)>input {
            position: absolute;
            top: -9999px;
        }

        .rate:not(:checked)>label {
            float: right;
            width: 1em;
            overflow: hidden;
            white-space: nowrap;
            cursor: pointer;
            font-size: 60px;
            color: #ccc;
        }

        .rate:not(:checked)>label:before {
            content: '★ ';
        }

        .rate>input:checked~label {
            color: #ffc700;
        }

        .rate:not(:checked)>label:hover,
        .rate:not(:checked)>label:hover~label {
            color: #deb217;
        }

        .rate>input:checked+label:hover,
        .rate>input:checked+label:hover~label,
        .rate>input:checked~label:hover,
        .rate>input:checked~label:hover~label,
        .rate>label:hover~input:checked~label {
            color: #c59b08;
        }
    </style>




</head>

<body>
    <div class="container" style="position: relative;height:100vh; width:100vw;">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
            Open modal
        </button>

        <div class="modal p-5" id="myModal" style="position: absolute; top:50%;left:50%;transform:translate(-50%,-50%)">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="" method="post">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Modal Heading</h4>

                        </div>

                        <!-- Modal body -->
                        <div class="row">
                            <div class="col-10 mx-auto">
                                <div class="modal-body rate mb-5" style="margin: 20px 0;">


                                    <input type="radio" id="star5" name="rate" value="5" />
                                    <label for="star5" title="text">5 stars</label>
                                    <input type="radio" id="star4" name="rate" value="4" />
                                    <label for="star4" title="text">4 stars</label>
                                    <input type="radio" id="star3" name="rate" value="3" />
                                    <label for="star3" title="text">3 stars</label>
                                    <input type="radio" id="star2" name="rate" value="2" />
                                    <label for="star2" title="text">2 stars</label>
                                    <input type="radio" id="star1" name="rate" value="0" />
                                    <label for="star1" title="text">1 star</label><br><br>
        
        
                                </div>
                                <div class="my-5">
                                    <input type="text" class="form-control mb-3 border-dark">
                                    <textarea name="" id="" class="form-control border-dark" cols="30" rows="10"></textarea>
                                </div>
                            </div>
                        </div>








                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
</div>

</body>

</html>