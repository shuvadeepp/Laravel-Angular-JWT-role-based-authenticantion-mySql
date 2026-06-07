import { Component } from '@angular/core';

import { FormsModule } from '@angular/forms';

import { Router, RouterLink } from '@angular/router';

import { NavbarComponent } from '../../shared/navbar/navbar.component';

import { AuthService } from '../../services/auth.service';

@Component({
  selector: 'app-login',
  imports: [FormsModule, RouterLink, NavbarComponent],
  templateUrl: './login.component.html',
  styleUrl: './login.component.scss'
})
export class LoginComponent {

  formData = {

    vch_email: '',

    vch_password: ''

  };


  constructor( private authService: AuthService, private router: Router) {

  }

  login() {

      // console.log(this.formData); return false;

      this.authService.login(this.formData).subscribe({

          next: (response) => {

              // console.log(response); return false;

              /*
                  Store JWT Token
              */

              localStorage.setItem(
                  'jwt_token',
                  response.jwt_token
              );

              /*
                  Store User Data
              */

              localStorage.setItem(
                  'user',
                  JSON.stringify(response.user)
              );

              alert(response.message);

              /*
                  Role Based Redirect
              */

              if(response.user.int_role == 1)
              {
                this.router.navigate(['/teacher-dashboard']);
              }
              else
              {
                this.router.navigate(['/student-dashboard']);
              }

          },

          error: (error) => {

              console.log(error);

              alert('Invalid Email or Password');

          }

      });
  }

}
