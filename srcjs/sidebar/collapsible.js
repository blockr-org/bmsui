export const handleSidebarCollapsible = () => {
  $(".bms-sidebar-collapsible-open").off();

  $(".bms-sidebar-collapsible-open").on("click", (e) => {
    $(e.currentTarget)
      .find(".bms-sidebar-collapsible-icon")
      .toggleClass("fa-chevron-down fa-chevron-up");
  });
}
