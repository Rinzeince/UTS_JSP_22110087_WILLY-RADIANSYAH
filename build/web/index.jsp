<%-- 
    Document   : index.jsp
    Created on : May 16, 2025, 1:29:22 PM
    Author     : v14
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.util.HashMap, java.util.Map, java.util.List" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABSOLUTE CINEMA - Pemesanan Tiket Online</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/styles.css" rel="stylesheet">
</head>
<body>
    <%
        // Definisikan daftar film beserta informasinya
        List<Map<String, Object>> movies = new ArrayList<>();
        
        // Film 1
        Map<String, Object> movie1 = new HashMap<>();
        movie1.put("id", 1);
        movie1.put("judul", "THUNDERBOLTS*");
        movie1.put("genre", "Action/Sci-Fi");
        movie1.put("durasi", 127);
        movie1.put("harga", 50000);
        List<String> jamTayang1 = new ArrayList<>();
        jamTayang1.add("10:00");
        jamTayang1.add("13:30");
        jamTayang1.add("16:45");
        jamTayang1.add("20:15");
        movie1.put("jamTayang", jamTayang1);
        movies.add(movie1);
        
        // Film 2
        Map<String, Object> movie2 = new HashMap<>();
        movie2.put("id", 2);
        movie2.put("judul", "Detective Conan: The Phantom Heist");
        movie2.put("genre", "Animation/Mystery");
        movie2.put("durasi", 110);
        movie2.put("harga", 45000);
        List<String> jamTayang2 = new ArrayList<>();
        jamTayang2.add("09:15");
        jamTayang2.add("12:30");
        jamTayang2.add("15:45");
        jamTayang2.add("19:00");
        movie2.put("jamTayang", jamTayang2);
        movies.add(movie2);
        
        // Film 3
        Map<String, Object> movie3 = new HashMap<>();
        movie3.put("id", 3);
        movie3.put("judul", "Love in Jakarta");
        movie3.put("genre", "Romance/Drama");
        movie3.put("durasi", 120);
        movie3.put("harga", 40000);
        List<String> jamTayang3 = new ArrayList<>();
        jamTayang3.add("11:00");
        jamTayang3.add("14:15");
        jamTayang3.add("17:30");
        jamTayang3.add("20:45");
        movie3.put("jamTayang", jamTayang3);
        movies.add(movie3);
        
        // Film 4
        Map<String, Object> movie4 = new HashMap<>();
        movie4.put("id", 4);
        movie4.put("judul", "JUMBO");
        movie4.put("genre", "ANIMATION/DRAMA");
        movie4.put("durasi", 102);
        movie4.put("harga", 55000);
        List<String> jamTayang4 = new ArrayList<>();
        jamTayang4.add("10:30");
        jamTayang4.add("13:45");
        jamTayang4.add("17:00");
        jamTayang4.add("19:30");
        movie4.put("jamTayang", jamTayang4);
        movies.add(movie4);
        
        // Film 5
        Map<String, Object> movie5 = new HashMap<>();
        movie5.put("id", 5);
        movie5.put("judul", "Final Destination: BLOODLINES");
        movie5.put("genre", "HORROR/THRILLER");
        movie5.put("durasi", 110);
        movie5.put("harga", 50000);
        List<String> jamTayang5 = new ArrayList<>();
        jamTayang5.add("15:30");
        jamTayang5.add("16:45");
        jamTayang5.add("19:00");
        jamTayang5.add("21:30");
        movie5.put("jamTayang", jamTayang5);
        movies.add(movie5);
        
         // Film 6
        Map<String, Object> movie6 = new HashMap<>();
        movie6.put("id", 6);
        movie6.put("judul", "Colorful Stage! The Movie: A Miku Who Can't Sing");
        movie6.put("genre", "ANIMATION");
        movie6.put("durasi", 112);
        movie6.put("harga", 60000);
        List<String> jamTayang6 = new ArrayList<>();
        jamTayang6.add("15:30");
        jamTayang6.add("19:00");
        movie6.put("jamTayang", jamTayang6);
        movies.add(movie6);
        
        
         // Film 7
        Map<String, Object> movie7 = new HashMap<>();
        movie7.put("id", 7);
        movie7.put("judul", "Pengepungan Di Bukit Duri");
        movie7.put("genre", "THRILLER");
        movie7.put("durasi", 118);
        movie7.put("harga", 50000);
        List<String> jamTayang7 = new ArrayList<>();
        jamTayang7.add("21:15");
        movie7.put("jamTayang", jamTayang7);
        movies.add(movie7);
        
         // Film 8
        Map<String, Object> movie8 = new HashMap<>();
        movie8.put("id", 8);
        movie8.put("judul", "Mission: Impossible - The Final Reckoning");
        movie8.put("genre", "ACTION");
        movie8.put("durasi", 169);
        movie8.put("harga", 55000);
        List<String> jamTayang8 = new ArrayList<>();
        jamTayang8.add("19:30");
        jamTayang8.add("21:45");
        movie8.put("jamTayang", jamTayang8);
        movies.add(movie8);
        
        // Simpan daftar film dalam session untuk diakses di halaman lain
        session.setAttribute("movies", movies);
    %>
    
    <div class="container mt-5">
        <div class="header text-center">
            <h1><strong>ABSOLUTE CINEMA</strong></h1>
            <p class="lead">Sistem Pemesanan Tiket Bioskop Online</p>
        </div>
        
        <div class="row">
            <div class="col-12">
                <div class="neobrutalism-card">
                    <h2 class="mb-4 text-center">FILM YANG SEDANG TAYANG</h2>
                    <div class="row">
                        <% for(Map<String, Object> movie : movies) { %>
                            <div class="col-md-6 mb-4">
                                <div class="neobrutalism-card movie-item">
                                    <div class="movie-title"><%= movie.get("judul") %></div>
                                    <div class="mt-2">
                                        <span class="badge genre-badge"><%= movie.get("genre") %></span>
                                        <span class="ms-2"><%= movie.get("durasi") %> menit</span>
                                    </div>
                                    <div class="mt-2">
                                        <strong>Harga:</strong> Rp <%= String.format("%,d", movie.get("harga")) %>
                                    </div>
                                    <div class="mt-3">
                                        <strong>Jam Tayang:</strong>
                                        <div class="d-flex flex-wrap mt-2">
                                            <% 
                                            List<String> jamTayang = (List<String>) movie.get("jamTayang");
                                            for(String jam : jamTayang) { 
                                            %>
                                                <a href="formPesan.jsp?movieId=<%= movie.get("id") %>&showtime=<%= jam %>" class="btn showtime-btn"><%= jam %></a>
                                            <% } %>
                                        </div>
                                    </div>
                                    <div class="mt-3">
                                        <a href="formPesan.jsp?movieId=<%= movie.get("id") %>" class="btn neobrutalism-btn">PESAN TIKET</a>
                                    </div>
                                </div>
                            </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>