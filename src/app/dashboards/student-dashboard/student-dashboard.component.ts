import { Component } from '@angular/core';

import { Router } from '@angular/router';

@Component({
  selector: 'app-student-dashboard',
  standalone: true,
  imports: [],
  templateUrl: './student-dashboard.component.html',
  styleUrls: ['./student-dashboard.component.css']
})

export class StudentDashboardComponent {

    user: any;

    constructor(private router: Router)
    {
        const token = localStorage.getItem('jwt_token');

        // If token missing redirect login
        if(!token)
        {
            this.router.navigate(['/login']);
        }

        const userData = localStorage.getItem('user');

        if(userData)
        {
            this.user = JSON.parse(userData);
        }

        // Prevent browser back after logout
        history.pushState(null, '', location.href);

        window.onpopstate = () => {

            history.pushState(null, '', location.href);

            const checkToken = localStorage.getItem('jwt_token');

            if(!checkToken)
            {
                this.router.navigate(['/login']);
            }
        };
    }

    logout()
    {
        /*
            Clear Local Storage
        */

        localStorage.removeItem('jwt_token');

        localStorage.removeItem('user');

        /*
            Redirect Login
        */

        this.router.navigate(['/login']);
    }

}