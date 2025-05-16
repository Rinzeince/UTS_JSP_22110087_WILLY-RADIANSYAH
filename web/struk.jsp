<%-- 
    Document   : struk.jsp
    Created on : May 16, 2025, 1:30:27 PM
    Author     : v14
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.util.HashMap, java.util.Map, java.util.List, java.text.SimpleDateFormat, java.util.Date, java.util.UUID" %>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABSOLUTE CINEMA - Struk Pemesanan</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/styles.css" rel="stylesheet">
</head>
<body>
    <%
        // Ambil data dari form
        String nama = request.getParameter("nama");
        int jumlahTiket = 0;
        int movieId = 0;
        String jamTayang = request.getParameter("jamTayang");
        
        try {
            jumlahTiket = Integer.parseInt(request.getParameter("jumlahTiket"));
            movieId = Integer.parseInt(request.getParameter("movieId"));
        } catch (NumberFormatException e) {
            // Redirect kembali ke form jika parameter tidak valid
            response.sendRedirect("formPesan.jsp");
            return;
        }
        
        // Validasi data
        if (nama == null || nama.trim().isEmpty() || jumlahTiket <= 0 || jamTayang == null || jamTayang.trim().isEmpty()) {
            response.sendRedirect("formPesan.jsp");
            return;
        }
        
        // Ambil daftar film dari session
        List<Map<String, Object>> movies = (List<Map<String, Object>>) session.getAttribute("movies");
        
        // Jika tidak ada di session, redirect ke index.jsp
        if (movies == null) {
            response.sendRedirect("index.jsp");
            return;
        }
        
        // Cari film yang dipilih
        Map<String, Object> selectedMovie = null;
        for (Map<String, Object> movie : movies) {
            int id = (Integer) movie.get("id");
            if (id == movieId) {
                selectedMovie = movie;
                break;
            }
        }
        
        // Jika film tidak ditemukan, redirect ke form
        if (selectedMovie == null) {
            response.sendRedirect("formPesan.jsp");
            return;
        }
        
        // Hitung total harga
        int hargaTiket = (Integer) selectedMovie.get("harga");
        int totalHarga = jumlahTiket * hargaTiket;
        
        // Generate booking ID (contoh sederhana)
        String bookingId = "TX" + java.util.UUID.randomUUID().toString().substring(0, 8).toUpperCase();


        
        // Format tanggal dan waktu saat ini
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        String currentDateTime = dateFormat.format(new Date());
    %>
    
    <div class="container mt-5 mb-5">
        <div class="header text-center">
            <h1><strong>ABSOLUTE CINEMA</strong></h1>
            <p class="lead">Struk Pemesanan Tiket</p>
        </div>
        
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="neobrutalism-card">
                    <div class="order-success">
                        PESANAN BERHASIL DIBUAT!
                    </div>
                    
                    <div class="receipt-header">
                        <h2>STRUK PEMESANAN</h2>
                        <div>Booking ID: <span class="booking-id"><%= bookingId %></span></div>
                    </div>
                    
                    <div class="receipt-date">
                        Tanggal: <%= currentDateTime %>
                    </div>
                    
                    <div class="ticket-info">
                        <div class="ticket-detail"><strong>Nama Pemesan:</strong> <%= nama %></div>
                        <div class="ticket-detail"><strong>Film:</strong> <%= selectedMovie.get("judul") %></div>
                        <div class="ticket-detail"><strong>Genre:</strong> <%= selectedMovie.get("genre") %></div>
                        <div class="ticket-detail"><strong>Durasi:</strong> <%= selectedMovie.get("durasi") %> menit</div>
                        <div class="ticket-detail"><strong>Jam Tayang:</strong> <%= jamTayang %></div>
                        <div class="ticket-detail"><strong>Jumlah Tiket:</strong> <%= jumlahTiket %></div>
                    </div>
                    
                    <div class="receipt-item">
                        <div>Harga Tiket:</div>
                        <div>Rp <%= String.format("%,d", hargaTiket) %></div>
                    </div>
                    
                    <div class="receipt-item">
                        <div>Jumlah Tiket:</div>
                        <div><%= jumlahTiket %></div>
                    </div>
                    
                    <div class="receipt-item total">
                        <div>TOTAL:</div>
                        <div>Rp <%= String.format("%,d", totalHarga) %></div>
                    </div>
                    
                    <div class="barcode">
                        <!-- Simulasi barcode dengan ID booking -->
                        <div style="font-family: monospace; letter-spacing: 1px;">||||||||||||||||||||||||||||</div>
                        <div class="mt-2"><%= bookingId %></div>
                    </div>
                    
                    <div class="text-center mt-4">
                        <p>Terima kasih telah menggunakan layanan ABSOLUTE CINEMA!</p>
                        <p>Silakan tunjukkan struk ini saat memasuki bioskop.</p>
                    </div>
                    
                    <div class="text-center mt-4">
                        <a href="index.jsp" class="neobrutalism-btn">KEMBALI KE BERANDA</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>