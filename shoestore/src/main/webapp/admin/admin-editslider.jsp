<%@page import="pojo.Category"%>
<%@page import="java.util.List"%>
<%@page import="dao.AdminDao"%>
<%@page import="pojo.Slider"%>
<%@include file="admin-header.jsp"%>
<%
	Slider s=(Slider)session.getAttribute("s");
%>
<div class="content-wrapper">
    <div class="row">
        <div class="col-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Edit slider : <span class="text-primary"><%=s.getTital()%></span></h4>
                  
                    <form class="forms-sample" action="EditSlider" method="POST" enctype="multipart/form-data">
                        <div class="row">
                            <input type="hidden" name="id" value="<%=s.getId()%>" />
                            <div class="col-6">
                                <div class="form-group">
                                    <label for="exampleInputName1">Slider Title</label>
                                    <input type="text" name="tital" class="form-control" id="slidertitle" onblur="checkslidertitle()" placeholder="Slider Title" value="<%=s.getTital()%>">
                                <span style="font-size:14px" class="text-danger" id="slidertitleerr"></span>
                                </div>
                            </div>
                            <%
                        	AdminDao adao=new AdminDao();
                        	List<Category>list =adao.ShowCategory();
                        %>
                            <div class="col-6">
                                <div class="form-group">
                                    <label for="exampleInputName1">Category</label>
                                    <select name="cname" id="category"  onchange="checkcategory()" class="js-example-basic-single w-100">
                                        <option selected disabled value="<%=s.getCategory().getCname()%>"><%out.print(s.getCategory().getCname());%></option>
                                        <%for(Category c:list) {%>
										<option><%=c.getCname()%></option>
										<%} %>
                                    </select>
                                    <span style="font-size:14px" class="text-danger" id="categoryerr"></span>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="exampleTextarea1">Slider Content</label>
                                    <textarea class="form-control" name="content" id="slidercont" onblur="checkslidercont()" rows="7" placeholder="Slider Content" style="resize:auto"><%=s.getContent()%></textarea>
                                    <span style="font-size:14px" class="text-danger" id="sliderconterr"></span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div style="height:230px">
                                    <h6>Slider current Image:</h6>
                                    <img src="image/Product/<%=s.getImage()%>" alt="bimage" width="150" /><br />
                                    <a href="Deletesimg?image=<%=s.getImage()%>" class="btn btn-sm btn-primary mt-1">Remove</a>
                                </div>

                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Slider Image</label>
                                    <input type="hidden" name="image" value="<%=s.getImage()%>" />
                                    <input type="file" name="image" id="sliderimg"  onchange="checksliderimg()" class="file-upload-default">
                                    <div class="input-group col-xs-12">
                                        <input type="text" value="<%=s.getImage()%>" class="form-control file-upload-info" disabled placeholder="Upload Slider Image">
                                        <span class="input-group-append">
                                            <button class="file-upload-browse btn btn-primary" type="button">Upload</button>
                                        </span>
                                    </div>
                                    <span style="font-size:14px" class="text-danger" id="sliderimgerr"></span>
                                </div>
                            </div>

                            <div class="col-12">
                                <button type="submit" onclick="return validate()" class="btn btn-primary mr-2">Submit</button>
                                <a href="admin-sliders.jsp" class="btn btn-light">Cancel</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

    function checkslidertitle(){
        let slidertitle = document.getElementById('slidertitle').value;
        let slidertitleerr = document.getElementById('slidertitleerr');
        
        if(slidertitle == ""){
            slidertitleerr.innerHTML = "Please enter the slider title";
        }
        else{
            slidertitleerr.innerHTML = "";
        }
    }
    
    function checkcategory(){
        let category = document.getElementById('category').value;
        let categoryerr = document.getElementById('categoryerr');
        
        if(category == ""){
            categoryerr.innerHTML = "Please enter the slider category";
        }
        else{
            categoryerr.innerHTML = "";
        }
    }
    
    function checkslidercont(){
        let slidercont = document.getElementById('slidercont').value;
        let sliderconterr = document.getElementById('sliderconterr');
        
        if(slidercont == ""){
            sliderconterr.innerHTML = "Please enter the slider contact";
        }
        else{
            sliderconterr.innerHTML = "";
        }
    }
    
    function checksliderimg(){
        let sliderimg = document.getElementById('sliderimg').value;
        let sliderimgerr = document.getElementById('sliderimgerr');
        
        if(sliderimg == ""){
            sliderimgerr.innerHTML = "Please enter the slider image";
        }
        else{
            sliderimgerr.innerHTML = "";
        }
    }


    function validate(){
        let slidertitle = document.getElementById('slidertitle').value;
        let slidertitleerr = document.getElementById('slidertitleerr');
        let category = document.getElementById('category').value;
        let categoryerr = document.getElementById('categoryerr');
        let slidercont = document.getElementById('slidercont').value;
        let sliderconterr = document.getElementById('sliderconterr');
        let sliderimg = document.getElementById('sliderimg').value;
        let sliderimgerr = document.getElementById('sliderimgerr');
        
        if(slidertitle == "" && category == "" && slidercont == "" && sliderimg == ""){
            slidertitleerr.innerHTML = "Please enter the slider title";
            sliderconterr.innerHTML = "Please enter the slider content";
            categoryerr.innerHTML = "Please enter the slider category";
            sliderimgerr.innerHTML = "Please enter the slider iamge";
            return false;
        }
        else{
            return true;
        }
    }
</script>
<%@include file="admin-footer.jsp"%>