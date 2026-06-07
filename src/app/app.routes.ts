import { Routes } from '@angular/router';
import { LandingComponent } from './pages/landing/landing.component';
import { LoginComponent } from './auth/login/login.component';
import { RegisterComponent } from './auth/register/register.component';
import { TeacherDashboardComponent } from './dashboards/teacher-dashboard/teacher-dashboard.component'; 
import { StudentDashboardComponent } from './dashboards/student-dashboard/student-dashboard.component';
import { authGuard } from './guards/auth.guard';

export const routes: Routes = [
    {
        path: '',
        component: LandingComponent
    },
    {
        path: 'login',
        component: LoginComponent
    },
    {
        path: 'register',
        component: RegisterComponent
    },
    {
        path: 'teacher-dashboard',
        component: TeacherDashboardComponent,
        canActivate: [authGuard]
    },

    {
        path: 'student-dashboard',
        component: StudentDashboardComponent,
        canActivate: [authGuard]
    },
];