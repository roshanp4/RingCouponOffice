<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowCoupon.aspx.cs" Inherits="RingCoupon.ShowCoupon" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <meta http-equiv="x-ua-compatible" content="ie=edge">
      <meta name="description" content="This is a boilerplate for a Bootstrap 4.1.1 project">
      <meta name="keywords"
        content="HTML, CSS, JS, Sass, JavaScript, framework, bootstrap, front-end, frontend, web development">
      <meta name="author" content="Henrik H. Boelsmand">
      <title>Ring Coupon Code Form</title>
      <link rel="shortcut icon" href="favicon.ico">
      <link rel="stylesheet" href="assets/css/main.min.css">
   
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.5/jspdf.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>

</head>
<body>
     
    <form id="form1" runat="server">
      <div style="align-items:center;text-align: center;margin: 10px;">
         <asp:Button runat="server" ID="btnExport" Text="Download" CssClass="btn btn-primary"  OnClick="btnExport_Click" />
          &nbsp;&nbsp;
         <asp:Button runat="server" ID="btnExport2" Text="Export" CssClass="btn btn-primary"  OnClick="btnExport2_Click" />
          &nbsp;&nbsp;
          <asp:Button runat="server" ID="Button1" Text="JS" CssClass="btn btn-primary"  OnClientClick="getPDF();" />
      </div>
   <div class="container ">
    <div class="row ring_promo">
      <div class="left col-sm-5">
        <img src="assets/img/ring_install_img.jpg" alt="">
      </div>
      <div class="right col-sm-7">
        <div class="top">
          <img src="assets/img/ring_install_offer.png" alt="">
        </div>
        <div class="form-block">
          <div class="form-block__left">
            <h5>Call</h5>
            <p>+97143887199</p>
            <p>+97143887199</p>
          </div>
          <div class="form-block__right">
             
              <div class="form-group">
                <label for="">Promo Code</label>
                <input type="text" runat="server" class="form-control" readonly="true" id="lblPromoCode" placeholder="@@PROMOCODE@@"  >
              </div>
              <div class="form-group">
                <label for="">Valid Till</label>
                <input type="text" runat="server" class="form-control" readonly="true" id="lblFrom" placeholder="@@VALID TILL@@"  >
              </div>
              <div class="form-group">
                <label for="">Valid at</label>
                <input type="text" runat="server" class="form-control" readonly="true" id="lblTo" placeholder="@@VALID AT@@" >
              </div> 
          </div>
        </div>
        <div class="bottom">
          <p>*Terms and conditions </p>
          <ul>
            <li>Valid with purchase through above mentioned partner</li>
            <li>Voucher valid for one person and for one location only</li>
            <li>Not valid with any other promotions or discounts </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
    </form>
    <button id="clickbind">Click</button>
<div id="content">
  <table id="example1" class="display table table-bordered table-striped row- 
border order-column" cellspacing="0" width="auto">
    <thead style="background-color: #b6b37e">
      <tr>
        <th>No</th>
        <th>PO Number</th>
        <th>Article Code</th>
        <th>Description</th>
        <th>Qty</th>
        <th>Price</th>
        <th>Discount</th>
      </tr>
    </thead>
    <tbody>
      <tr ng-repeat="x in listData">
        <td><img src="http://ringvoucher.ptree.online/assets/img/ring_install_offer.png" alt="" /></td>
        <td><img src="assets/img/ring_install_img.jpg" alt="" /></td>
        <td>{{x.article_code}}</td>
        <td>{{x.long_description}}</td>
        <td>{{x.qty}}</td>
        <td><img src="assets/img/ring_install_offer.png" alt=""></td>
        <td>{{x.discountpct}}</td>
      </tr>
    </tbody>
  </table>
</div>
<script>
  function onClick() {
    html2canvas(document.body, {
      onrendered: function(canvas) {

        var img = canvas.toDataURL("image/png");
        var doc = new jsPDF();
        doc.addImage(img, 'JPEG', 20, 20);
        doc.save('test.pdf');
      }

    });
  };

  var element = document.getElementById("clickbind");
  element.addEventListener("click", onClick);
</script>
</body>
</html>
