package com.telecom.platform.device.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDateTime;
import java.util.Map;

@Entity
@Table(name = "network_devices")
@EntityListeners(AuditingEntityListener.class)
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class NetworkDevice {

    @Id
    @Column(name = "device_id")
    private String deviceId;

    @NotBlank(message = "Device name is required")
    @Column(name = "device_name", nullable = false)
    private String deviceName;

    @NotNull(message = "Device type is required")
    @Enumerated(EnumType.STRING)
    @Column(name = "device_type", nullable = false)
    private DeviceType deviceType;

    @NotBlank(message = "IP address is required")
    @Column(name = "ip_address", nullable = false)
    private String ipAddress;

    @NotNull(message = "Device status is required")
    @Enumerated(EnumType.STRING)
    @Column(name = "status", nullable = false)
    private DeviceStatus status;

    @Column(name = "location")
    private String location;

    @NotBlank(message = "Tenant ID is required")
    @Column(name = "tenant_id", nullable = false)
    private String tenantId;

    @Column(name = "vendor")
    private String vendor;

    @Column(name = "model")
    private String model;

    @Column(name = "software_version")
    private String softwareVersion;

    @ElementCollection
    @CollectionTable(name = "device_configurations", 
                    joinColumns = @JoinColumn(name = "device_id"))
    @MapKeyColumn(name = "config_key")
    @Column(name = "config_value")
    private Map<String, String> configurations;

    @CreatedDate
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @LastModifiedDate
    @Column(name = "updated_at", nullable = false)
    private LocalDateTime updatedAt;

    @Column(name = "created_by")
    private String createdBy;

    @Column(name = "updated_by")
    private String updatedBy;
}
