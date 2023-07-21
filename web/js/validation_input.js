//(() => {
//  'use strict';
//
//  // Fetch all the forms we want to apply custom Bootstrap validation styles to
//  const forms = document.querySelectorAll('.needs-validation');
//
//  // Loop over them and prevent submission
//  Array.from(forms).forEach(form => {
//    form.addEventListener('submit', event => {
//      if (!form.checkValidity()) {
//        event.preventDefault();
//        event.stopPropagation();
//      }
//
//      form.classList.add('was-validated');
//    }, false);
//  });
//})();


(() => {
  'use strict';

  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  const forms = document.querySelectorAll('.needs-validation');

  // Loop over them and prevent submission
  Array.from(forms).forEach(form => {
    form.addEventListener('submit', event => {
      if (!form.checkValidity()) {
        event.preventDefault();
        event.stopPropagation();
      }

      // Validate custom input fields
      const inputFields = form.querySelectorAll('input[required]:not([type="submit"])');
      Array.from(inputFields).forEach(inputField => {
        if (!inputField.checkValidity()) {
          event.preventDefault();
          event.stopPropagation();
          inputField.classList.add('is-invalid');
        } else {
          inputField.classList.remove('is-invalid');
          inputField.classList.add('is-valid');
        }
      });
    }, false);
  });
})();