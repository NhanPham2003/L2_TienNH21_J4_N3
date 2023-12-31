package com.example.datn.controller;

import com.example.datn.entity.ChiTietGiay;
import com.example.datn.entity.Giay;
import com.example.datn.entity.Hang;
import com.example.datn.entity.KhachHang;
import com.example.datn.repository.CLDeGiayRep;
import com.example.datn.repository.CLThanGiayRep;
import com.example.datn.repository.HangRepo;
import com.example.datn.repository.HinhAnhRepo;
import com.example.datn.repository.MauSacRepo;
import com.example.datn.service.ChiTietGiayService;
import com.example.datn.service.GiayService;
import com.example.datn.service.HangService;
import com.example.datn.service.HinhAnhService;
import com.example.datn.service.SizeService;
import com.example.datn.utils.GenerateQRCode;
import com.example.datn.viewModel.KhachHangViewModel;
import com.google.zxing.WriterException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/chi-tiet-giay")
public class ChiTietGiayController {
    @Autowired
    private HttpSession session;

    @Autowired
    private ChiTietGiayService chiTietGiayService;

    @Autowired
    private HinhAnhRepo hinhAnhRepo;

    @Autowired
    private MauSacRepo mauSacRepo;

    @Autowired
    private GiayService giayService;

    @Autowired
    private HangRepo hangRepo;

    @Autowired
    private SizeService sizeService;


    @Autowired
    private CLDeGiayRep clDeGiayRep;

    @Autowired
    private CLThanGiayRep clThanGiayRep;

    @GetMapping("/hien-thi")
    public String hienThi(Model model) {
        model.addAttribute("listCTGiay", chiTietGiayService.getAll());
        return "viewsManage/chitietgiay/index";
    }

    @GetMapping("/viewAdd")
    public String viewAdd(Model model) {
        ChiTietGiay chiTietGiay = new ChiTietGiay();
        model.addAttribute("chiTietGiay", chiTietGiay);
//        ChiTietGiay ctGiay = chiTietGiayService.getByIdCtGiay(id);
//        model.addAttribute("ctGiay", ctGiay);
        model.addAttribute("hinhAnh", hinhAnhRepo.findAll());
        model.addAttribute("giay", giayService.getAll());
        model.addAttribute("size", sizeService.getAll());
        model.addAttribute("mauSac", mauSacRepo.findAll());
        model.addAttribute("hang", hangRepo.findAll());
        model.addAttribute("chatLieuDeGiay", clDeGiayRep.findAll());
        model.addAttribute("chatLieuThanGiay", clThanGiayRep.findAll());
        model.addAttribute("action", "/chi-tiet-giay/add");
        return "viewsManage/chitietgiay/add";
    }

    @PostMapping("/add")
    public String add(@Valid @ModelAttribute("chiTietGiay") ChiTietGiay chiTietGiay, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("hinhAnh", hinhAnhRepo.findAll());
            model.addAttribute("size", sizeService.getAll());
            model.addAttribute("mauSac", mauSacRepo.findAll());
            model.addAttribute("hang", hangRepo.findAll());
            model.addAttribute("chatLieuDeGiay", clDeGiayRep.findAll());
            model.addAttribute("chatLieuThanGiay", clThanGiayRep.findAll());
            model.addAttribute("giay", giayService.getAll());
            return "viewsManage/chitietgiay/add";
        } else {
            chiTietGiayService.add(chiTietGiay);
            session.setAttribute("message", "Thêm thành công");
            return "redirect:/giay/hien-thi";
        }
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") ChiTietGiay khachHang) {
        chiTietGiayService.delete(khachHang);
        session.setAttribute("message", "Xóa thành công");
        return "redirect:/chi-tiet-giay/hien-thi";
    }

    @GetMapping("/detail/{id}")
    public String detail(@PathVariable UUID id, Model model) {
        ChiTietGiay ctGiay = chiTietGiayService.getByIdCtGiay(id);
        model.addAttribute("ctgiayDetail", ctGiay);
        List<ChiTietGiay> listCTGiay = chiTietGiayService.findByIdGiay(id);
        model.addAttribute("listCTGiay", listCTGiay);
//        ChiTietGiay ctGiay = chiTietGiayService.getByIdCtGiay(id);
//        model.addAttribute("ctgiayDetail", ctGiay);
        return "viewsManage/chitietgiay/detail";
    }

    @GetMapping("/viewUpdate/{id}")
    public String viewUpdate(HttpServletRequest request, @PathVariable UUID id, Model model) {
        String referer = request.getHeader("Referer");
        model.addAttribute("referer", referer);
        ChiTietGiay ctGiay = chiTietGiayService.getByIdCtGiay(id);
        model.addAttribute("chiTietGiay", ctGiay);
        model.addAttribute("hinhAnh", hinhAnhRepo.findAll());
        model.addAttribute("size", sizeService.getAll());
        model.addAttribute("mauSac", mauSacRepo.findAll());
        model.addAttribute("hang", hangRepo.findAll());
        model.addAttribute("chatLieuDeGiay", clDeGiayRep.findAll());
        model.addAttribute("chatLieuThanGiay", clThanGiayRep.findAll());
        model.addAttribute("giay", giayService.getAll());
        return "viewsManage/chitietgiay/update";
    }

    @PostMapping("/update/{id}")
    public String update(@PathVariable UUID id, @ModelAttribute("chiTietGiay") ChiTietGiay chiTietGiay) {
        ChiTietGiay ctGiayDb = chiTietGiayService.getByIdCtGiay(id);
        if (ctGiayDb != null) {
            ctGiayDb.setNamBaoHanh(chiTietGiay.getNamBaoHanh());
            ctGiayDb.setNamSanXuat(chiTietGiay.getNamSanXuat());
            ctGiayDb.setTrongLuong(chiTietGiay.getTrongLuong());
            ctGiayDb.setGiaNhap(chiTietGiay.getGiaNhap());
            ctGiayDb.setGiaBan(chiTietGiay.getGiaBan());
            ctGiayDb.setSoLuongTon(chiTietGiay.getSoLuongTon());
            ctGiayDb.setTrangThai(chiTietGiay.getTrangThai());
            ctGiayDb.setGiay(chiTietGiay.getGiay());
            ctGiayDb.setHinhAnh(chiTietGiay.getHinhAnh());
            ctGiayDb.setChatLieuDeGiay(chiTietGiay.getChatLieuDeGiay());
            ctGiayDb.setChatLieuThanGiay(chiTietGiay.getChatLieuThanGiay());
            ctGiayDb.setHang(chiTietGiay.getHang());
            ctGiayDb.setMauSac(chiTietGiay.getMauSac());
            ctGiayDb.setSize(chiTietGiay.getSize());
            chiTietGiayService.save(ctGiayDb);
        }
        return "redirect:/giay/hien-thi";
    }

    @GetMapping("/qrcode")
    public ResponseEntity<List<ChiTietGiay>> getChiTietGiay() throws IOException, WriterException {
        List<ChiTietGiay> chiTietGiays = chiTietGiayService.getAll();
        if (chiTietGiays.size() != 0) {
            for (ChiTietGiay chiTietGiay : chiTietGiays) {
                GenerateQRCode.generateQRCode(chiTietGiay);
            }
        }
        return ResponseEntity.ok(chiTietGiayService.getAll());
    }
}
