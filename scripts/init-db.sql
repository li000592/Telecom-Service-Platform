-- Create additional schemas if needed
CREATE SCHEMA IF NOT EXISTS telecom_platform;

-- Create extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Initial data for testing
INSERT INTO network_devices (device_id, device_name, device_type, ip_address, status, tenant_id, location, created_at, updated_at)
VALUES 
    ('router-001', 'Core Router 1', 'ROUTER', '192.168.1.1', 'ACTIVE', 'tenant-1', 'DataCenter-1', NOW(), NOW()),
    ('switch-001', 'Access Switch 1', 'SWITCH', '192.168.1.10', 'ACTIVE', 'tenant-1', 'DataCenter-1', NOW(), NOW()),
    ('router-002', 'Edge Router 1', 'ROUTER', '10.0.1.1', 'MAINTENANCE', 'tenant-2', 'Edge-Site-1', NOW(), NOW());
