<?php

use App\Http\Controllers\Api\ReportController;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Api\AuthController;

use App\Http\Controllers\Api\AcademicYearController;
use App\Http\Controllers\Api\AnnouncementController;
use App\Http\Controllers\Api\GradeLevelController;
use App\Http\Controllers\Api\SectionController;
use App\Http\Controllers\Api\PeriodController;
use App\Http\Controllers\Api\CourseController;

use App\Http\Controllers\Api\ProfileController;
use App\Http\Controllers\Api\StudentController;
use App\Http\Controllers\Api\TeacherController;
use App\Http\Controllers\Api\GuardianController;
use App\Http\Controllers\Api\StudentGuardianController;

use App\Http\Controllers\Api\CourseAssignmentController;
use App\Http\Controllers\Api\CourseScheduleController;

use App\Http\Controllers\Api\EnrollmentApplicationController;
use App\Http\Controllers\Api\TeacherCourseAssignmentController;
use App\Http\Controllers\Api\StudentCourseEnrollmentController;

use App\Http\Controllers\Api\TaskSubmissionController;
use App\Http\Controllers\Api\AssignmentController;
use App\Http\Controllers\Api\AttendanceController;
use App\Http\Controllers\Api\AttendanceJustificationController;
use App\Http\Controllers\Api\ChargeController;
use App\Http\Controllers\Api\CompetencyController;
use App\Http\Controllers\Api\EvaluationController;
use App\Http\Controllers\Api\FeeConceptController;
use App\Http\Controllers\Api\NotificationController;
use App\Http\Controllers\Api\PaymentController;
use App\Http\Controllers\Api\ReceiptController;

/*
|--------------------------------------------------------------------------
| PUBLIC
|--------------------------------------------------------------------------
*/
Route::post('/login', [AuthController::class, 'login']);

/*
|--------------------------------------------------------------------------
| PROTECTED (Sanctum)
|--------------------------------------------------------------------------
*/
Route::middleware('auth:sanctum')->group(function () {

    // Auth
    Route::get('/me', [AuthController::class, 'me']);
    Route::post('/logout', [AuthController::class, 'logout']);

    /*
    |--------------------------------------------------------------------------
    | TAREAS (Assignments + Submissions)
    |--------------------------------------------------------------------------
    */
    // Admin/Docente: crear tareas. Alumno: solo leer.
    Route::get('assignments', [AssignmentController::class, 'index'])
        ->middleware('role:admin,director,coordinator,secretary,teacher,student,guardian');
    Route::get('assignments/{assignment}', [AssignmentController::class, 'show'])
        ->middleware('role:admin,director,coordinator,secretary,teacher,student,guardian');

    Route::post('assignments', [AssignmentController::class, 'store'])
        ->middleware('role:admin,director,coordinator,secretary,teacher');
    Route::put('assignments/{assignment}', [AssignmentController::class, 'update'])
        ->middleware('role:admin,director,coordinator,secretary,teacher');
    Route::delete('assignments/{assignment}', [AssignmentController::class, 'destroy'])
        ->middleware('role:admin,director,coordinator,secretary');

    // Submissions
    Route::get('task-submissions', [TaskSubmissionController::class, 'index'])
        ->middleware('role:admin,director,coordinator,secretary,teacher,student');
    Route::get('task-submissions/{taskSubmission}', [TaskSubmissionController::class, 'show'])
        ->middleware('role:admin,director,coordinator,secretary,teacher,student');

    Route::post('task-submissions', [TaskSubmissionController::class, 'store'])
        ->middleware('role:admin,student');
    Route::put('task-submissions/{taskSubmission}', [TaskSubmissionController::class, 'update'])
        ->middleware('role:admin,student');

    Route::post('task-submissions/{taskSubmission}/grade', [TaskSubmissionController::class, 'grade'])
        ->middleware('role:admin,teacher');

    Route::delete('task-submissions/{taskSubmission}', [TaskSubmissionController::class, 'destroy'])
        ->middleware('role:admin');

    /*
    |--------------------------------------------------------------------------
    | ACADÉMICO (Admin)
    |--------------------------------------------------------------------------
    */
    Route::middleware('role:admin,director,coordinator,secretary')->group(function () {
        Route::apiResource('academic-years', AcademicYearController::class);
        Route::apiResource('grade-levels', GradeLevelController::class);
        Route::apiResource('sections', SectionController::class);
        Route::apiResource('periods', PeriodController::class);
        Route::apiResource('courses', CourseController::class);
    });

    /*
    |--------------------------------------------------------------------------
    | PERSONAS (Admin)
    |--------------------------------------------------------------------------
    */
    Route::middleware('role:admin,director,coordinator,secretary')->group(function () {
        Route::apiResource('profiles', ProfileController::class);
        Route::apiResource('students', StudentController::class);
        Route::apiResource('teachers', TeacherController::class);
        Route::apiResource('guardians', GuardianController::class);
        Route::apiResource('student-guardians', StudentGuardianController::class);
    });

    /*
    |--------------------------------------------------------------------------
    | HORARIOS / ASIGNACIONES
    |--------------------------------------------------------------------------
    */
    // Lectura: todos autenticados
    Route::get('course-schedules', [CourseScheduleController::class, 'index'])
        ->middleware('role:admin,director,coordinator,secretary,teacher,student,guardian');
    Route::get('course-schedules/{courseSchedule}', [CourseScheduleController::class, 'show'])
        ->middleware('role:admin,director,coordinator,secretary,teacher,student,guardian');

    // Escritura: admin + docente
    Route::middleware('role:admin,director,coordinator,secretary,teacher')->group(function () {
        Route::post('course-schedules', [CourseScheduleController::class, 'store']);
        Route::put('course-schedules/{courseSchedule}', [CourseScheduleController::class, 'update']);
        Route::delete('course-schedules/{courseSchedule}', [CourseScheduleController::class, 'destroy']);
    });

    // Course assignments (admin/docente)
    Route::get('course-assignments', [CourseAssignmentController::class, 'index'])
        ->middleware('role:admin,director,coordinator,secretary,teacher');
    Route::get('course-assignments/{courseAssignment}', [CourseAssignmentController::class, 'show'])
        ->middleware('role:admin,director,coordinator,secretary,teacher');

    // Escritura: administración
    Route::middleware('role:admin,director,coordinator,secretary')->group(function () {
        Route::post('course-assignments', [CourseAssignmentController::class, 'store']);
        Route::put('course-assignments/{courseAssignment}', [CourseAssignmentController::class, 'update']);
        Route::delete('course-assignments/{courseAssignment}', [CourseAssignmentController::class, 'destroy']);
    });

    /*
    |--------------------------------------------------------------------------
    | MATRÍCULAS
    |--------------------------------------------------------------------------
    */
    Route::middleware('role:admin,director,coordinator,secretary')->group(function () {
        Route::apiResource('enrollment-applications', EnrollmentApplicationController::class);
        Route::post('enrollment-applications/{id}/approve', [EnrollmentApplicationController::class, 'approve']);
        Route::post('enrollment-applications/{id}/reject', [EnrollmentApplicationController::class, 'reject']);

        Route::apiResource('teacher-course-assignments', TeacherCourseAssignmentController::class);

        Route::apiResource('student-course-enrollments', StudentCourseEnrollmentController::class)
            ->only(['index', 'show', 'update']);
    });
    // Asistencia
Route::get('attendance', [AttendanceController::class, 'index'])
    ->middleware('role:admin,director,coordinator,secretary,teacher');
Route::post('attendance', [AttendanceController::class, 'store'])
    ->middleware('role:admin,director,coordinator,secretary,teacher');
Route::get('attendance/{attendance}', [AttendanceController::class, 'show'])
    ->middleware('role:admin,director,coordinator,secretary,teacher');
Route::put('attendance/{attendance}', [AttendanceController::class, 'update'])
    ->middleware('role:admin,director,coordinator,secretary,teacher');
Route::delete('attendance/{attendance}', [AttendanceController::class, 'destroy'])
    ->middleware('role:admin,director,coordinator,secretary');

// Justificaciones
Route::get('attendance-justifications', [AttendanceJustificationController::class, 'index'])
    ->middleware('role:admin,director,coordinator,secretary,teacher,guardian');
Route::post('attendance-justifications', [AttendanceJustificationController::class, 'store'])
    ->middleware('role:admin,guardian');

Route::get('attendance-justifications/{attendanceJustification}', [AttendanceJustificationController::class, 'show'])
    ->middleware('role:admin,director,coordinator,secretary,teacher,guardian');

Route::post('attendance-justifications/{attendanceJustification}/approve', [AttendanceJustificationController::class, 'approve'])
    ->middleware('role:admin,director,coordinator,secretary,teacher');
Route::post('attendance-justifications/{attendanceJustification}/reject', [AttendanceJustificationController::class, 'reject'])
    ->middleware('role:admin,director,coordinator,secretary,teacher');

Route::delete('attendance-justifications/{attendanceJustification}', [AttendanceJustificationController::class, 'destroy'])
    ->middleware('role:admin');



    // Competencias (admin + coordinación + docente)
Route::middleware('role:admin,director,coordinator,secretary,teacher')->group(function () {
    Route::apiResource('competencies', CompetencyController::class);
});

// Evaluaciones/Notas (admin + coordinación + docente)
Route::middleware('role:admin,director,coordinator,secretary,teacher')->group(function () {
    Route::get('evaluations', [EvaluationController::class, 'index']);
    Route::post('evaluations', [EvaluationController::class, 'store']);
    Route::get('evaluations/{evaluation}', [EvaluationController::class, 'show']);
    Route::put('evaluations/{evaluation}', [EvaluationController::class, 'update']);
    Route::delete('evaluations/{evaluation}', [EvaluationController::class, 'destroy']);

    // opcionales
    Route::post('evaluations/{evaluation}/publish', [EvaluationController::class, 'publish']);
    Route::post('evaluations/{evaluation}/close', [EvaluationController::class, 'close']);
});


// FINANZAS (Admin / Secretaría)
Route::middleware('role:admin,director,coordinator,secretary')->group(function () {
    Route::apiResource('fee-concepts', FeeConceptController::class);
    Route::apiResource('charges', ChargeController::class);
    Route::apiResource('payments', PaymentController::class)->only(['index','store','show','destroy']);
    Route::apiResource('receipts', ReceiptController::class)->only(['index','store','show','destroy']);
});


Route::middleware('auth:sanctum')->group(function () {

    Route::apiResource('announcements', AnnouncementController::class);

    Route::post(
        'announcements/{announcement}/request-approval',
        [AnnouncementController::class,'requestApproval']
    );

    Route::post(
        'announcements/{announcement}/approve',
        [AnnouncementController::class,'approve']
    );

    Route::post(
        'announcements/{announcement}/archive',
        [AnnouncementController::class,'archive']
    );

});



Route::middleware('auth:sanctum')->group(function () {

    // Reportes: ahora también student y guardian, pero restringido por middleware
    Route::middleware('role:admin,director,coordinator,secretary,teacher,student,guardian')->group(function () {
        Route::get('reports/students/{student}/report-card', [ReportController::class, 'reportCard'])
            ->middleware('student.guardian.access');

        Route::get('reports/students/{student}/attendance', [ReportController::class, 'attendanceSummary'])
            ->middleware('student.guardian.access');

        Route::get('reports/students/{student}/financial', [ReportController::class, 'financialSummary'])
            ->middleware('student.guardian.access');
    });

    // Dashboard solo admin/autoridades
    Route::get('dashboard', [ReportController::class, 'dashboard'])
        ->middleware('role:admin,director,coordinator,secretary');
});
// REPORTES (boletas/resúmenes)
// Recomendado: admin/secretary/director/teacher pueden ver; student/guardian luego se restringe por dueño.
Route::middleware('role:admin,director,coordinator,secretary,teacher')->group(function () {
    Route::get('reports/students/{student}/report-card', [ReportController::class, 'reportCard']);
    Route::get('reports/students/{student}/attendance', [ReportController::class, 'attendanceSummary']);
    Route::get('reports/students/{student}/financial', [ReportController::class, 'financialSummary']);
});

// Dashboard (solo administración)
Route::get('dashboard', [ReportController::class, 'dashboard'])
    ->middleware('role:admin,director,coordinator,secretary');
// Notificaciones (cualquier usuario autenticado)
Route::get('notifications', [NotificationController::class, 'index']);
Route::get('notifications/{notification}', [NotificationController::class, 'show']);
Route::delete('notifications/{notification}', [NotificationController::class, 'destroy']);

// marcar como leída
Route::put('notifications/{notification}/read', [NotificationController::class, 'markAsRead']);
Route::put('notifications/read-all', [NotificationController::class, 'markAllAsRead']);

// crear notificación (solo administración)
Route::post('notifications', [NotificationController::class, 'store'])
    ->middleware('role:admin,director,coordinator,secretary');
});
