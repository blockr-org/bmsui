import { showTab, listenTabs } from "./show";
import { handleInsert } from "./insert";
import { handleSelect }  from "./select";
import { handleSidebarCollapsible } from "./collapsible";

const showFirstTab = () => {
  let target = $(".bms-sidebar-open").first().data("target");
  showTab(target);
}

export const sidebar = () => {
  showFirstTab();
  listenTabs();
  handleInsert();
  handleSelect();
  handleSidebarCollapsible();
}

