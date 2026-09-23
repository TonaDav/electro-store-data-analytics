-- ============================================================
-- ELECTRO STORE - CREACIÓN DE BASE DE DATOS Y CONFIGURACIÓN INICIAL
-- Ejecutar PRIMERO, antes de 01_create_tables.sql
-- ============================================================

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'electroStoreDB')
BEGIN
    CREATE DATABASE electroStoreDB;
END;
GO

USE electroStoreDB;
GO
