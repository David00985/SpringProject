const ctx = document.getElementById('myChart').getContext('2d');

// 두번째 그래프
const earning = document.getElementById('earning').getContext('2d');


const myChart = new Chart(ctx, {
    //이부분이 chart 타입 변하게 하는 부분 
    type: 'polarArea',
    data: {
        // 이게 나오는 이름
        labels: ['Facebook', 'Naver', 'KaKao'],
        datasets: [{
            label: 'Traffic Source',
            // 이부분이 labels의 수치
            data: [1200, 1900, 3000],
            backgroundColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)'
                // 'rgba(75, 192, 192, 0.2)',
                // 'rgba(153, 102, 255, 0.2)',
                // 'rgba(255, 159, 64, 0.2)'
            ],

            // borderColor: [
            //     'rgba(255, 99, 132, 1)',
            //     'rgba(54, 162, 235, 1)',
            //     'rgba(255, 206, 86, 1)',
            //     'rgba(75, 192, 192, 1)',
            //     'rgba(153, 102, 255, 1)',
            //     'rgba(255, 159, 64, 1)'
            // ],


            // borderWidth: 1
        }]
    },
    options: {
        // 이렇게 써야 크기가 바뀐다. 
       responsive: true,
    }
});

const myChart2 = new Chart(earning, {
    type: 'bar',
    data: {
        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        datasets: [{
            label: '#Earning',
            data: [1200, 109, 3000, 5400, 1200, 3000,4500,55,8100,1000,1251,8565],
            backgroundColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235,1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
        }]
    },
    options: {
        responsive: true,
    }
});
