<%@page import="domain.LogEntry"%>
  <%@page import="java.util.List"%>
    <%@page import="domain.User"%>
      <%@page import="data.Repositories"%>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
          <!DOCTYPE html>
          <html lang="en">
            <head>
              <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                  <meta http-equiv="X-UA-Compatible" content="ie=edge">

                    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
                      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/css/materialize.min.css">
                        <link rel="stylesheet" href="assets/css/screen.css">
                          <title>Admin page</title>
                        </head>
                        <body>
                          <header>
                            <nav class="blue darken-2">
                              <div class="nav-wrapper">
                                <a href="index.html" class="brand-logo">Logo</a>
                                <ul class="right">
                                  <li id="user">Admin</li>
                                  <li>
                                    <i class="material-icons right">account_circle</i>
                                  </li>
                                </ul>
                              </div>
                            </nav>
                          </header>

                          <main>
                            <div class="row">
                              <div class="col s3 offset-s1">
                                <ul id="userlist" class="collection">
                                  <%
              List<User> users = Repositories.getUserRepository().getAllUsers();
              for(User u : users) {
          %>
                                    <li class="collection-item avatar">
                                      <img src="https://vintage.ponychan.net/chan/files/src/131999656437.png" alt="profilePicture" class="circle">
                                        <%
                    String s = String.format("<p class=\"title\">%s <br><span class='grey-text'>#%05d<span></p>",u.getName(), u.getId());
                    out.print(s);
                    String s2 = String.format("<a href='deleteUser?id=%s' class='secondary-content'><i class='material-icons red-text'>delete</i></a>", u.getId());
                    out.print(s2);
                    %>
                                        </li>
                                      <%
                }
             %>
                                    </ul>
                                  </div>
                                  <div class="col s6 offset-s1">
                                    <ul id="loglist" class="collection">
                                      <% for(LogEntry l : Repositories.getLogEntryRepository().getAllFromDataBase()) { %>
                                        <li class="collection-item avatar">
                                          <%
                  String s = String.format("<span class='title'>log #%05d <span class='grey-text'>%s</span></span><p>%s</p>", l.getId(), l.getTimeStamp(), l.getMessage());
                  out.print(s);
              %>
                                          </li>
                                        <%}%>
                                      </ul>
                                    </div>
                                  </div>
                                </main>

                                <footer class="page-footer blue darken-2">
                                  <p class="white-text">Copyright (c) 2017 Copyright Holder All Rights Reserved.</p>
                                </footer>

                                <script type="text/javascript" src="assets/js/jquery-3.2.1.min.js"></script>
                                <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>
                                <script type="text/javascript" src="assets/js/script.js"></script>
                              </body>
                            </html>