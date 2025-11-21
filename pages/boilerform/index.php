<div class="row">

  <div class="col-md-4">
    <div class="card card-body">
      <form id="form1q">
        <h2>Form 1</h2>
        <div class="mb-3">
          <textarea class="form-control " name="textarea" id="textarea"></textarea>
        </div>
        <div class="mb-3">
          <select id="select" name="select" class="form-control">
            <option class="text-muted" value="">Select</option>
            <option value="Large select">Large select</option>
            <option value="Small select">Small select</option>
          </select>
        </div>
        <div class="mb-3">
          <input class="form-control form-control-sm" type="text" id="name" name="name" placeholder="Name">
        </div>
        <div class="mb-3">
          <input class="form-control form-control-sm" type="text" id="contact_no" name="contact_no" placeholder="Contact No">
        </div>
        <div class="mb-3">
          <input class="form-control form-control-sm" type="email" id="email" name="email" placeholder="Email">
        </div>
        <button class="btn btn-success" type="button" onclick="sendFormData('form1q')">Submit Form 1</button>
      </form>
    </div>
  </div>
  <div class="col-md-4">
    <div class="card card-body">
      <h2>Form 2</h2>
      <!-- content bellow -->
      <form id="form2">
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
    </div>
  </div>
  <div class="col-md-4">
    <div class="card card-body">
      <h2>form 3</h2>
      <!-- content bellow -->
      <form id="form3">
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
    </div>
  </div>
  <div class="col-md-4">
    <div class="card card-body">
      <h2>Form 4</h2>
      <!-- content bellow -->
      <form id="myFillupform">
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
        <button class="btn btn-success" type="button" onclick="sendFormData('myFillupform')">Submit Form 3</button>
      </form>
    </div>
  </div>
  <div class="col-md-4">
    <div class="card card-body">
      <h2>Form 5</h2>
      <!-- content bellow -->
      <form id="form-test-5">
        <div class="mb-3">
          <input class="form-control form-control-sm" type="text" id="fname_3" name="fname" placeholder="First Name">
        </div>
        <div class="mb-3">
          <input class="form-control form-control-sm" type="text" id="lname_3" name="lname" placeholder="Last Name">
        </div>
        <div class="mb-3">
          <input class="form-control form-control-sm" type="number" id="numberf5" name="numberf5" placeholder="Number">
        </div>
        <div class="mb-3">
          <input class="form-control form-control-sm" type="email" id="emailf5" name="emailf5" placeholder="Email">
        </div>
        <button class="btn btn-success" type="button" onclick="sendFormData('form-test-5')">Submit Form 3</button>
      </form>
    </div>
  </div>
  <!-- <h3 class="mt-5">Response Data:</h3>   -->
  <p id="response" class="alert alert-secondary"></p>
  <!-- End content -->
</div>