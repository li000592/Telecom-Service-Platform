package com.telecom.platform.device.repository;

import com.telecom.platform.device.domain.NetworkDevice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface NetworkDeviceRepository extends JpaRepository<NetworkDevice, String> {
    
    List<NetworkDevice> findByTenantId(String tenantId);
    
    Optional<NetworkDevice> findByDeviceIdAndTenantId(String deviceId, String tenantId);
    
    boolean existsByDeviceIdAndTenantId(String deviceId, String tenantId);
}
