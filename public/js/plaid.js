var handler = Plaid.create({
  apiVersion: 'v2',
  clientName: 'Clearbit Assignment',
  env: 'sandbox',
  product: 'transactions',
  key: '95bd02fd054773f5b1767d2ef2e7dc',
  onSuccess: function(public_token) {
    $.post('/plaid/import', {
      public_token: public_token
    }, function(data) {
      window.location.reload();
    })
  }
})

$('#plaid-link').on('click', function(event) {
  event.preventDefault();
  handler.open();
})
