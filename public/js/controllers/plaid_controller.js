(() => {
  const app = Stimulus.Application.start();
  app.register('plaid', class extends Stimulus.Controller {
    link(event) {
      event.preventDefault();
      const that = this;

      const handler = Plaid.create({
        apiVersion: 'v2',
        clientName: 'Clearbit Assignment',
        env: 'sandbox',
        product: 'transactions',
        key: '95bd02fd054773f5b1767d2ef2e7dc',
        onSuccess: function(public_token) {
          // display spinner
          that.data.set('importing', true);

          $.post('/plaid/import_transactions', {
            public_token: public_token
          }, function(data) {
            window.location.reload();
          })
        }
      });

      handler.open()
    }
  })
})();
