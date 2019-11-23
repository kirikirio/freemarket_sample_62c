$(function () {
  $('.price-input').on('keyup', (e) => {
    console.log('発火')
    const price = $(e.currentTarget).val();
    const taxRate = 0.1;
    const fee = Math.floor(price * taxRate);
    const newFee = fee.toString().replace(/(\d)(?=(\d{3})+$)/g, '$1,')

    const profit = price - fee;
    const newProfit = profit.toString().replace(/(\d)(?=(\d{3})+$)/g, '$1,')
    console.log('profit', price, fee, profit)
    if (300 <= price && price < 10000000) {
      $('.fee-area__tax-rate').text(`¥${newFee}`);
      $('.profit-area__text').text(`¥${newProfit}`);
    } else {
      $('.fee-area__tax-rate').text('-');
      $('.profit-area__text').text('-');
    }
  })
})