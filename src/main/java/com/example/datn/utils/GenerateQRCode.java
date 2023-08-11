package com.example.datn.utils;

import com.example.datn.entity.ChiTietGiay;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Path;

public class GenerateQRCode {

    public static void generateQRCode(ChiTietGiay chiTietGiay) throws WriterException, IOException {
        String qrCodePath = "C:\\Users\\Lvh9x\\Documents\\GitHub\\QRCode\\";
        String qrCodeName = qrCodePath + chiTietGiay.getId() + chiTietGiay.getGiay().getTen() + ".png";
        var qrCodeWriter = new QRCodeWriter();
        BitMatrix bitMatrix = qrCodeWriter.encode("ID: " + chiTietGiay.getId() + "\n" +
                        "Name: " + chiTietGiay.getGiay().getTen(),
                BarcodeFormat.QR_CODE, 400, 400);
        Path path = FileSystems.getDefault().getPath(qrCodeName);
        MatrixToImageWriter.writeToPath(bitMatrix,"PNG", path);
    }
}
