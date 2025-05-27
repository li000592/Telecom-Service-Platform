CREATE TABLE IF NOT EXISTS device_configurations (
    device_id VARCHAR(255) NOT NULL,
    config_key VARCHAR(255) NOT NULL,
    config_value TEXT,
    PRIMARY KEY (device_id, config_key),
    FOREIGN KEY (device_id) REFERENCES network_devices(device_id) ON DELETE CASCADE
);

CREATE INDEX idx_device_configurations_device_id ON device_configurations(device_id);
