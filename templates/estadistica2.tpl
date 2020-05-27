<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawStuff);

      function drawStuff() {
        var data = new google.visualization.arrayToDataTable([
          ['Move', ''],
          ["Kilometros Recorridos", 290],
          ["Cantidad paises visitados", 2],
          ["Huella carbono", 7.],
          ["Horas viajadas", 5],
        ]);

        var options = {
          width: 800,
          legend: { position: 'none' },
          axes: {
            x: {
              0: { side: 'top', label: 'Estadisticas Globales'} 
            }
          },
          bar: { groupWidth: "90%" }
        };

        var chart = new google.charts.Bar(document.getElementById('Estadisticas'));
        chart.draw(data, google.charts.Bar.convertOptions(options));
      };
    </script>
  </head>
  <body>
    <div id="Estadisticas" style="width: 800px; height: 600px;"></div>
  </body>
</html>