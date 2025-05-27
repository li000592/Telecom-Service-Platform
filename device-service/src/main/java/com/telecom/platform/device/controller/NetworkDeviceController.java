package com.telecom.platform.device.controller;

import com.telecom.platform.device.domain.DeviceStatus;
import com.telecom.platform.device.domain.NetworkDevice;
import com.telecom.platform.device.repository.NetworkDeviceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/api/v1/devices")
public class NetworkDeviceController {

    @Autowired
    private NetworkDeviceRepository deviceRepository;

    @GetMapping
    public ResponseEntity<List<NetworkDevice>> getAllDevices(
            @RequestHeader("X-Tenant-ID") String tenantId) {
        List<NetworkDevice> devices = deviceRepository.findByTenantId(tenantId);
        return ResponseEntity.ok(devices);
    }

    @GetMapping("/{deviceId}")
    public ResponseEntity<NetworkDevice> getDeviceById(
            @PathVariable String deviceId,
            @RequestHeader("X-Tenant-ID") String tenantId) {
        return deviceRepository.findByDeviceIdAndTenantId(deviceId, tenantId)
            .map(ResponseEntity::ok)
            .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<NetworkDevice> createDevice(
            @RequestBody NetworkDevice device,
            @RequestHeader("X-Tenant-ID") String tenantId) {
        
        // Set tenant ID and timestamps
        device.setTenantId(tenantId);
        device.setStatus(DeviceStatus.PROVISIONING);
        device.setCreatedAt(LocalDateTime.now());
        device.setUpdatedAt(LocalDateTime.now());
        
        NetworkDevice savedDevice = deviceRepository.save(device);
        return ResponseEntity.status(HttpStatus.CREATED).body(savedDevice);
    }
}
