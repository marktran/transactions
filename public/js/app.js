import PlaidController from './controllers/plaid_controller.js';

(() => {
  const app = Stimulus.Application.start();
  app.register('plaid', PlaidController)
})();
