<%-- 
    Document   : formPesan
    Created on : May 16, 2025, 1:30:06 PM
    Author     : v14
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.util.HashMap, java.util.Map, java.util.List" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CinemaTix - Form Pemesanan</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/styles.css" rel="stylesheet">
</head>
<body>
    <%
        // Ambil daftar film dari session
        List<Map<String, Object>> movies = (List<Map<String, Object>>) session.getAttribute("movies");
        
        // Jika tidak ada di session, redirect ke index.jsp
        if (movies == null) {
            response.sendRedirect("index.jsp");
            return;
        }
        
        // Ambil movieId dari parameter URL jika ada
        int selectedMovieId = 0;
        String selectedShowtime = "";
        
        try {
            if (request.getParameter("movieId") != null) {
                selectedMovieId = Integer.parseInt(request.getParameter("movieId"));
            }
            
            if (request.getParameter("showtime") != null) {
                selectedShowtime = request.getParameter("showtime");
            }
        } catch (NumberFormatException e) {
            // Ignore
        }
        
        // Cari film yang dipilih
        Map<String, Object> selectedMovie = null;
        for (Map<String, Object> movie : movies) {
            int id = (Integer) movie.get("id");
            if (id == selectedMovieId) {
                selectedMovie = movie;
                break;
            }
        }
    %>
    
    <div class="container mt-5">
        <div class="header text-center">
            <h1><strong>ABSOLUTE CINEMA</strong></h1>
            <p class="lead">Form Pemesanan Tiket</p>
        </div>
        
        <div class="row">
            <div class="col-lg-8 mx-auto">
                <div class="neobrutalism-card">
                    <h2 class="mb-4 text-center">FORM PEMESANAN</h2>
                    
                    <form action="struk.jsp" method="post">
                        <div class="mb-3">
                            <label for="nama" class="form-label">Nama Pemesan:</label>
                            <input type="text" name="nama" id="nama" class="neobrutalism-input" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="jumlahTiket" class="form-label">Jumlah Tiket:</label>
                            <input type="number" name="jumlahTiket" id="jumlahTiket" min="1" max="10" value="1" class="neobrutalism-input" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="movieId" class="form-label">Pilih Film:</label>
                            <select name="movieId" id="movieId" class="neobrutalism-select" required onchange="updateShowtimes()">
                                <option value="">-- Pilih Film --</option>
                                <% for (Map<String, Object> movie : movies) { %>
                                    <option value="<%= movie.get("id") %>" <%= (selectedMovieId == (Integer)movie.get("id")) ? "selected" : "" %>>
                                        <%= movie.get("judul") %> - Rp <%= String.format("%,d", movie.get("harga")) %>
                                    </option>
                                <% } %>
                            </select>
                        </div>
                        
                        <div class="mb-3">
                            <label for="jamTayang" class="form-label">Pilih Jam Tayang:</label>
                            <select name="jamTayang" id="jamTayang" class="neobrutalism-select" required>
                                <option value="">-- Pilih Jam Tayang --</option>
                                <% 
                                if (selectedMovie != null) {
                                    List<String> jamTayang = (List<String>) selectedMovie.get("jamTayang");
                                    for (String jam : jamTayang) {
                                %>
                                    <option value="<%= jam %>" <%= jam.equals(selectedShowtime) ? "selected" : "" %>><%= jam %></option>
                                <% 
                                    }
                                }
                                %>
                            </select>
                        </div>
                        
                        <% if (selectedMovie != null) { %>
                        <div class="movie-details mb-4">
                            <h4><%= selectedMovie.get("judul") %></h4>
                            <p><strong>Genre:</strong> <%= selectedMovie.get("genre") %></p>
                            <p><strong>Durasi:</strong> <%= selectedMovie.get("durasi") %> menit</p>
                            <p><strong>Harga:</strong> Rp <%= String.format("%,d", selectedMovie.get("harga")) %> per tiket</p>
                        </div>
                        <% } %>
                        
                        <div class="d-flex justify-content-between mt-4">
                            <a href="index.jsp" class="back-btn">KEMBALI</a>
                            <button type="submit" class="neobrutalism-btn">LANJUTKAN KE PEMBAYARAN</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
    function updateShowtimes() {
        var movieId = document.getElementById("movieId").value;
        if (movieId) {
            window.location.href = "formPesan.jsp?movieId=" + movieId;
        }
    }
    </script>
</body>
</html>