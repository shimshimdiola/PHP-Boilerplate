<div class="row">
  <!-- Start content -->



  <form id="form1" class=" col-md-4   mb-4 p-3 border rounded shadow-sm">
    <h2>Form 1</h2>

    <div class="mb-3">
      <input class="form-control form-control-sm" type="text" id="name" name="name" placeholder="Name">
    </div>
    <div class="mb-3">
      <input class="form-control form-control-sm" type="text" id="contact_no" name="contact_no" placeholder="Contact No">
    </div>
    <div class="mb-3">
      <input class="form-control form-control-sm" type="email" id="email" name="email" placeholder="Email">
    </div>
    <button class="btn btn-success" type="button" onclick="sendFormData('form1')">Submit Form 1</button>
  </form>


  <form id="form2" class="  col-md-4  mb-4 p-3 border rounded shadow-sm">
    <h2>Form 2</h2>

    <div class="mb-3">
      <input class="form-control form-control-sm" type="text" id="fname_2" name="fname" placeholder="First Name">
    </div>
    <div class="mb-3">
      <input class="form-control form-control-sm" type="text" id="lname_2" name="lname" placeholder="Last Name">
    </div>
    <div class="mb-3">
      <input class="form-control form-control-sm" type="text" id="mname_2" name="mname" placeholder="Middle Name">
    </div>
    <div class="mb-3">
      <input class="form-control form-control-sm" type="text" id="name2_2" name="name" placeholder="Name">
    </div>
    <button class="btn btn-success" type="button" onclick="sendFormData('form2')">Submit Form 2</button>
  </form>


  <form id="form3" class="  col-md-4  mb-4 p-3 border rounded shadow-sm">
    <h2>Form 3</h2>

    <div class="mb-3">
      <input class="form-control form-control-sm" type="text" id="fname_3" name="fname" placeholder="First Name">
    </div>
    <div class="mb-3">
      <input class="form-control form-control-sm" type="text" id="lname_3" name="lname" placeholder="Last Name">
    </div>
    <div class="mb-3">
      <input class="form-control form-control-sm" type="text" id="mname_3" name="mname" placeholder="Middle Name">
    </div>
    <div class="mb-3">
      <input class="form-control form-control-sm" type="text" id="name2_3" name="name" placeholder="Name">
    </div>
    <button class="btn btn-success" type="button" onclick="sendFormData('form3')">Submit Form 3</button>
  </form>

  <!-- <h3 class="mt-5">Response Data:</h3>   -->
  <p id="response" class="alert alert-secondary"></p>


  <!-- End content -->
</div>