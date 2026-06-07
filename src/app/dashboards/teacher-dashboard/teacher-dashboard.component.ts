import { Component } from '@angular/core';

import { Router } from '@angular/router';

@Component({
  selector: 'app-teacher-dashboard',
  standalone: true,
  imports: [],
  templateUrl: './teacher-dashboard.component.html',
  styleUrl: './teacher-dashboard.component.css'
})

export class TeacherDashboardComponent {

    user: any;

    constructor(private router: Router)
    {
        const token = localStorage.getItem('jwt_token');

        // If token not found redirect login
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
        localStorage.removeItem('jwt_token');

        localStorage.removeItem('user');

        this.router.navigate(['/login']);
    }

}