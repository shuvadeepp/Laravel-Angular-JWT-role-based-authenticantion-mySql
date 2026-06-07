import { Component } from '@angular/core';

import { FormsModule } from '@angular/forms';

import { RouterLink } from '@angular/router';

import { NavbarComponent } from '../../shared/navbar/navbar.component';

import { AuthService } from '../../services/auth.service';

import { Router } from '@angular/router';

@Component({
  selector: 'app-register',
  imports: [FormsModule, RouterLink, NavbarComponent],
  templateUrl: './register.component.html',
  styleUrl: './register.component.scss'
})
export class RegisterComponent {

  formData = {

    vch_name: '',

    vch_email: '',

    vch_password: '',

    int_role: ''

  };


  constructor(private authService: AuthService, private router: Router) {

  }

  register() {

      // console.log(this.formData); return false;

      this.authService.register(this.formData).subscribe({

          next: (response) => {

            console.log(response);

            alert(response.message);

            this.router.navigate(['/login']);

          },

          error: (error) => {

              console.log(error);

              alert('Something went wrong');

          }

      });
  }
}
