CREATE TABLE IF NOT EXISTS network_devices (
    device_id VARCHAR(255) PRIMARY KEY,
    device_name VARCHAR(255) NOT NULL,
    device_type VARCHAR(50) NOT NULL,
    ip_address VARCHAR(45) NOT NULL,
    status VARCHAR(50) NOT NULL,
    location VARCHAR(255),
    tenant_id VARCHAR(255) NOT NULL,
    vendor VARCHAR(255),
    model VARCHAR(255),
    software_version VARCHAR(255),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(255),
    updated_by VARCHAR(255)
);

CREATE INDEX idx_network_devices_tenant_id ON network_devices(tenant_id);
CREATE INDEX idx_network_devices_status ON network_devices(status);
CREATE INDEX idx_network_devices_device_type ON network_devices(device_type);
CREATE INDEX idx_network_devices_location ON network_devices(location);
CREATE UNIQUE INDEX idx_network_devices_tenant_device ON network_devices(tenant_id, device_id);
