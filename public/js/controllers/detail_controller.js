(() => {
  const app = Stimulus.Application.start();
  app.register('detail', class extends Stimulus.Controller {
    static get targets() { return ['card']; }

    show(event) {
      event.preventDefault();
      this.cardTarget.style.display = 'block';
    }

    hide() {
      this.cardTarget.style.display = 'none';
    }

    stop(event) {
      event.stopPropagation();
    }
  })
})();
