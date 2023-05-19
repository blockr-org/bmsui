import { listenTabs } from "./index";

export const handleInsert = () => {
  Shiny.addCustomMessageHandler("insert-sidebar-item", (msg) => {
    $("#bms-sidebar-container .bms-sidebar").append(sidebarEntry(msg.title));
    $("#bms-tabs").append(tab(msg));
    listenTabs();
  });
}

const sidebarEntry = (title) => {
  return `<div class='bms-sidebar-open mb-2' data-target='${title}'>${title}</div>`;
}

const tab = (params) => {
  return `<div class='bms-sidebar-item d-none' data-tab='${params.title}'>${params.content}</div>`;
}
