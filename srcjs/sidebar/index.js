const showFirstTab = () => {
  let $tab = $(".bms-sidebar-item").first();
  $tab.removeClass("d-none");
  // tells shiny to render stuff
  $tab.trigger("shown");
}

const listenTabs = () => {
  $(".sidebar-open").on("click", (e) => {
    console.log(e);
  });
}

export const sidebar = () => {
  showFirstTab();
  listenTabs();
}

