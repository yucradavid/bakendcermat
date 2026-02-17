<?php

use App\Http\Controllers\Api\EnrollmentApplicationController;
use Illuminate\Support\Facades\Route;

// =========================
// M1 - AUTH (Sanctum Token)
// =========================
// FRONT: 1) POST /api/login con email/password -> devuelve token
// FRONT: 2) Enviar token en headers para el resto:
//        Authorization: Bearer {token}

use App\Http\Controllers\Api\AuthController;

// =========================
// M2 - ACADÉMICO
// =========================
use App\Http\Controllers\Api\AcademicYearController;
use App\Http\Controllers\Api\GradeLevelController;
use App\Http\Controllers\Api\SectionController;
use App\Http\Controllers\Api\PeriodController;
use App\Http\Controllers\Api\CourseController;

// =========================
// M3 - PERSONAS
// =========================
use App\Http\Controllers\Api\ProfileController;
use App\Http\Controllers\Api\StudentController;
use App\Http\Controllers\Api\TeacherController;
use App\Http\Controllers\Api\GuardianController;
use App\Http\Controllers\Api\StudentCourseEnrollmentController;
use App\Http\Controllers\Api\StudentGuardianController;
use App\Http\Controllers\Api\TeacherCourseAssignmentController;

/*
|--------------------------------------------------------------------------
| PUBLIC ROUTES (sin token)
|--------------------------------------------------------------------------
| Solo login es público. Todo lo demás requiere token.
*/
Route::post('/login', [AuthController::class, 'login']);
// Body ejemplo (JSON):
// {
//   "email": "admin@demo.com",
//   "password": "123456"
// }


/*
|--------------------------------------------------------------------------
| PROTECTED ROUTES (requiere Bearer Token)
|--------------------------------------------------------------------------
| HEADER para consumir:
// Authorization: Bearer {token}
*/
Route::middleware('auth:sanctum')->group(function () {

    // -------------------------
    // AUTH
    // -------------------------
    // FRONT: sirve para obtener el usuario autenticado
    Route::get('/me', [AuthController::class, 'me']);

    // FRONT: elimina el token actual (logout)
    Route::post('/logout', [AuthController::class, 'logout']);


    // =========================
    // M2 - ACADÉMICO
    // =========================

    // Años académicos
    // Filtros:
    // /api/academic-years?year=2026
    // /api/academic-years?is_active=true
    Route::apiResource('academic-years', AcademicYearController::class);

    // Niveles / grados
    // Filtros:
    // /api/grade-levels?level=primaria
    // /api/grade-levels?grade=3
    Route::apiResource('grade-levels', GradeLevelController::class);

    // Secciones
    // Filtros:
    // /api/sections?academic_year_id=UUID
    // /api/sections?grade_level_id=UUID
    Route::apiResource('sections', SectionController::class);

    // Periodos
    // Filtros:
    // /api/periods?academic_year_id=UUID
    // /api/periods?is_closed=true
    Route::apiResource('periods', PeriodController::class);

    // Cursos
    // Filtros:
    // /api/courses?grade_level_id=UUID
    // /api/courses?code=MAT-01
    // /api/courses?q=mate (buscador por name o code)
    Route::apiResource('courses', CourseController::class);


    // =========================
    // M3 - PERSONAS
    // =========================

    // Profiles (conectado a auth.users)
    // Filtros:
    // /api/profiles?role=admin
    // /api/profiles?is_active=true
    // /api/profiles?q=Juan
    Route::apiResource('profiles', ProfileController::class);

    // Estudiantes
    // Filtros:
    // /api/students?section_id=UUID
    // /api/students?status=active
    // /api/students?dni=12345678
    // /api/students?student_code=STU-0001
    // /api/students?q=Perez
    Route::apiResource('students', StudentController::class);

    // Docentes
    // Filtros:
    // /api/teachers?status=active
    // /api/teachers?dni=12345678
    // /api/teachers?teacher_code=DOC-001
    // /api/teachers?user_id=UUID
    // /api/teachers?q=Matematica
    Route::apiResource('teachers', TeacherController::class);

    // Apoderados
    // Filtros:
    // /api/guardians?dni=12345678
    // /api/guardians?user_id=UUID
    // /api/guardians?is_primary=true
    // /api/guardians?q=Rojas
    Route::apiResource('guardians', GuardianController::class);

    // Relación Estudiante - Apoderado (pivote)
    // Filtros:
    // /api/student-guardians?student_id=UUID
    // /api/student-guardians?guardian_id=UUID
    Route::apiResource('student-guardians', StudentGuardianController::class);



        // =========================
    // M4 - MATRÍCULAS
    // =========================
    Route::apiResource('enrollment-applications', EnrollmentApplicationController::class);
    Route::post('enrollment-applications/{id}/approve', [EnrollmentApplicationController::class, 'approve']);
    Route::post('enrollment-applications/{id}/reject', [EnrollmentApplicationController::class, 'reject']);

    Route::apiResource('teacher-course-assignments', TeacherCourseAssignmentController::class);
    Route::apiResource('student-course-enrollments', StudentCourseEnrollmentController::class)
    ->only(['index','show','update']);

    });
