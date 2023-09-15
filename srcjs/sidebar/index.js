import { listenTabs, showTab, showTabDescription } from "./show.js";
import { handleInsert } from "./insert.js";
import { handleSelect } from "./select.js";
import { handleSidebarCollapsible } from "./collapsible.js";

const showFirstTab = () => {
  let target = $(".bms-sidebar-open").first().data("target");
  showTab(target);
};

export const sidebar = () => {
  showTabDescription();
  showFirstTab();
  listenTabs();
  handleInsert();
  handleSelect();
  handleSidebarCollapsible();
};
