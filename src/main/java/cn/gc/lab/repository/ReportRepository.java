package cn.gc.lab.repository;

import cn.gc.lab.entity.Report;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface ReportRepository extends  JpaRepository<Report, String>,JpaSpecificationExecutor<Report>{
    List<Report> findByPidAndSid(String pid, String sid);

    List<Report> findByPid(String pid);
}
