<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "/WEB-INF/views/common/general/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차트 및 캘린더</title>
<link rel="stylesheet" href="${path}/resources/css/admin/header.css">
<link rel="stylesheet" href="${path}/resources/css/admin/main.css">

<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js'></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', '날짜');
        data.addColumn('number', '국내영화 방문자 수');
        data.addColumn('number', '국외영화 방문자 수');

        var visitors = JSON.parse('${json}');
        var Dates = Object.keys(visitors).sort(); // 날짜 정렬

        for (var i = 0; i < Dates.length; i++) {
            var date = Dates[i];
            data.addRow([date, visitors[date].visitors1 || 0, visitors[date].visitors2 || 0]);
        }

        var options = {
            title: '사이트 방문자 수 통계',
            curveType: 'function',
            legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
        chart.draw(data, options);
    }

    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');

        var events = [];
        var visitorsData = JSON.parse('${json}');

        for (var date in visitorsData) {
            if (visitorsData.hasOwnProperty(date)) {
                var visitorInfo = visitorsData[date];
                if (visitorInfo.visitors1) {
                    events.push({
                        title: '국내영화: ' + visitorInfo.visitors1,
                        start: date
                    });
                }
                if (visitorInfo.visitors2) {
                    events.push({
                        title: '국외영화: ' + visitorInfo.visitors2,
                        start: date
                    });
                }
            }
        }

        var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            events: events
        });

        calendar.render();
    });
</script>

</head>

<header>
    <%@ include file= "/WEB-INF/views/admin/admin_main/header.jsp" %>
</header>
<br><br><br><br>
<body>
    <div class="centered-content">
        <h1>사이트 방문자 수 통계</h1>
        
    </div>

    <div class="container">
        <div class="chart">
            <div id="curve_chart"></div>
            <a href="${path}/export" class="btn btn-primary">엑셀 다운로드</a>
        </div>
        <div class="calendar">
            <div id='calendar'></div>
        </div>
    </div>
</body>
</html>
