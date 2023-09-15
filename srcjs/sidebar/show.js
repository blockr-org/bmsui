let lastTab = "";
export const showTab = (name) => {
  if (lastTab == name) {
    return;
  }

  $(`.bms-sidebar-open`).removeClass("active");

  $(".bms-sidebar-item")
    .each((i, tab) => {
      let $tab = $(tab);
      let tabName = $tab.data("tab");

      if (tabName == name) {
        $(`.bms-sidebar-open[data-target='${name}']`).addClass("active");
        $tab.removeClass("d-none");
        $tab.trigger("shown");
        lastTab = name;

        const event = new CustomEvent("bms:show-tab", {
          detail: $tab.data("description"),
        });
        document.dispatchEvent(event);

        return;
      }

      $tab.addClass("d-none");
      $tab.trigger("hidden");
    });
};

export const showTabDescription = () => {
  $(document).off("bms:show-tab");

  $(document).on("bms:show-tab", (e) => {
    let details = e.detail;
    if (e.detail == null) {
      $("#bms-sidebar-description").html(null);
      return;
    }

    let desc = `<p class="fw-bold mb-0">Description</p>
      <hr/ style="margin-top:0;margin-bottom:.3rem;">
      <div>
        ${e.detail}
      </div>`;

    $("#bms-sidebar-description").html(desc);
  });
};

export const listenTabs = () => {
  $(".bms-sidebar-open").off("click");

  $(".bms-sidebar-open").on("click", (e) => {
    let target = $(e.currentTarget).data("target");
    showTab(target);
  });
};
