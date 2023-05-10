const showFirstTab = () => {
  let target = $(".bms-sidebar-open").first().data("target");
  showTab(target);
}

let lastTab = "";
const showTab = (name) => {
  if(lastTab == name)
    return;

  $(`.bms-sidebar-open`).removeClass("active");

  $(".bms-sidebar-item")
    .each((i, tab) => {
      let $tab = $(tab);
      let tabName = $tab.data("tab")

      if(tabName == name) {
        $(`.bms-sidebar-open[data-target='${name}']`).addClass("active");
        $tab.removeClass("d-none");
        $tab.trigger("shown");
        lastTab = name;
        return;
      }

      $tab.addClass("d-none");
      $tab.trigger("hidden");
    })
}

const listenTabs = () => {
  $(".bms-sidebar-open").on("click", (e) => {
    let target = $(e.currentTarget).data("target");
    showTab(target);
  });
}

export const sidebar = () => {
  showFirstTab();
  listenTabs();
}

