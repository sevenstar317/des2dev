$(document).on('turbolinks:load', function() {

  var renderRewardChartTimeout;

  $('.start-project-form .manageable-number a').on('click', function() {
    clearTimeout(renderRewardChartTimeout)
    renderRewardChartTimeout = setTimeout(function() {
      reward = Number($('#reward-percentage').val());
      renderRewardChart(reward);
    }, 1000);
  })


  function renderRewardChart(reward) {
    var ctx = $('#reward-chart');
    if (!ctx.length) { return }
    reward = reward || Number($('#reward-percentage').val());
    var data = {
      labels: ['Unavailable', 'Available', 'Phase 1'],
      datasets: [{
        data: [51, (100 - (51 + reward)), reward],
        backgroundColor: ['#767676', '#cbc134', '#33d2c3'],
        hoverBackgroundColor: ['#767676', '#cbc134', '#33d2c3']
      }]
    };

    var options = {
      legend: {
        display: true,
        position: 'bottom',
        fullWidth: true,
        labels: { fontColor: 'rgb(255, 99, 132)', fontSize: 12, boxWidth: 13 }
      }
    }

    new Chart(ctx,{ type: 'pie',  data: data, options: options });
  };

  renderRewardChart();


});
