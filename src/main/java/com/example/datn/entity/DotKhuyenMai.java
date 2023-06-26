package com.example.datn.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;
import java.util.UUID;

@Entity
@Table(name = "DotKhuyenMai")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DotKhuyenMai {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "Id")
    private UUID id;

    @Column(name = "MaKhuyenMai")
    private String maKhuyenMai;

    @Column(name = "TenKhuyenMai")
    private String tenKhuyenMai;

    @Column(name = "NgayBatDau")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date ngayBatDau;

    @Column(name = "NgayKetThuc")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date ngayKetThuc;

    @Column(name = "TrangThai")
    private int trangThai;

    @Column(name = "SoLuong")
    private int soLuong;

    @Column(name = "PhanTram")
    private int phanTram;

    @Column(name = "GiaTienGiam")
    private BigDecimal giaTienGiam;

    @Column(name = "DieuKienGiam")
    private String dieuKienGiam;

    @Column(name = "LoaiKhuyenMai")
    private String loaiKhuyenMai;

    @Column(name = "MoTa")
    private String moTa;
}
