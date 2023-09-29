$(() => {
  var buttonTextBinding = new Shiny.InputBinding();

  $.extend(buttonTextBinding, {
    find: (scope) => {
      return $(scope).find(".buttonTextBinding");
    },
    getValue: (el) => {
      return $(el).find(".btn-text-input").val();
    },
    setValue: (el, value) => {
      console.error("not implemented");
    },
    subscribe: (el, callback) => {
      $(el).find(".btn-trigger-text").on(
        "click",
        (e) => {
          $(e.currentTarget).toggleClass("d-none");
          $(e.target).closest(".buttonTextBinding").find(".d-flex").toggleClass(
            "d-none",
          );
          $(event.target).closest(".buttonTextBinding").find(".btn-text-input")
            .val("");
        },
      );

      $(el).find(".btn-validate").on(
        "click",
        (e) => {
          let $binding = $(event.target).closest(".buttonTextBinding");
          $binding.find(".d-flex").toggleClass("d-none");
          $binding.find(".btn-trigger-text").toggleClass("d-none");
          callback();
        },
      );
    },
    unsubscribe: (el) => {
      $(el).off(".buttonTextBinding");
    },
  });

  Shiny.inputBindings.register(buttonTextBinding, "bmsui.buttonTextBinding");
});
