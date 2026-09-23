-- ============================================================
-- ELECTRO STORE - SCRIPT MAESTRO
--
-- IMPORTANTE: requiere SQLCMD Mode habilitado en SSMS
-- (Query > SQLCMD Mode), ya que usa la directiva ":r" para
-- incluir otros archivos .sql.
--
-- Los 3 archivos deben estar en la MISMA CARPETA que este script.
-- ============================================================

:r "C:\Users\Tomas\OneDrive\Power BI Projects\electro-store-dashboard\sql_scripts\00_create_database.sql"
:r "C:\Users\Tomas\OneDrive\Power BI Projects\electro-store-dashboard\sql_scripts\01_create_tables.sql"
:r "C:\Users\Tomas\OneDrive\Power BI Projects\electro-store-dashboard\sql_scripts\02_insert_data.sql"
:r "C:\Users\Tomas\OneDrive\Power BI Projects\electro-store-dashboard\sql_scripts\03_insert_transac_devol_2026"

PRINT 'Base de datos electroStoreDB creada y poblada exitosamente.';
GO
