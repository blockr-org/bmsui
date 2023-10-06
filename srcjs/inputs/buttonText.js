const revert = (event, cb) => {
  let $binding = $(event.target).closest(".buttonTextBinding");
  $binding.find(".d-flex").toggleClass("d-none");
  $binding.find(".btn-trigger-text").toggleClass("d-none");
  if ($binding.data("restore")) {
    $binding.find(".btn-trigger-text").text(
      $binding.find(".btn-text-input").val(),
    );
  }
  cb();
};

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

          if ($(event.target).closest(".buttonTextBinding").data("restore")) {
            $(event.target).closest(".buttonTextBinding").find(
              ".btn-text-input",
            )
              .val($(event.currentTarget).text());
          } else {
            $(event.target).closest(".buttonTextBinding").find(
              ".btn-text-input",
            )
              .val("");
          }
        },
      );

      $(el).find(".btn-validate").on(
        "click",
        (e) => {
          revert(e, callback);
        },
      );

      $(el).find(".btn-text-input").on(
        "keydown",
        (e) => {
          if (e.which != 13) {
            return;
          }

          revert(e, callback);
        },
      );

      $(el).find(".btn-text-cancel").on(
        "click",
        (e) => {
          let $binding = $(event.target).closest(".buttonTextBinding");
          $binding.find(".d-flex").toggleClass("d-none");
          $binding.find(".btn-trigger-text").toggleClass("d-none");
        },
      );
    },
    unsubscribe: (el) => {
      $(el).off(".buttonTextBinding");
    },
  });

  Shiny.inputBindings.register(buttonTextBinding, "bmsui.buttonTextBinding");
});
