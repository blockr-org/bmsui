import { listenTabs } from "./show";
import { handleSidebarCollapsible } from "./collapsible";

export const handleInsert = () => {
  Shiny.addCustomMessageHandler("insert-sidebar-item", (msg) => {
    $("#bms-sidebar-container .bms-sidebar").append(sidebarEntry(msg.title));
    $("#bms-tabs").append(tab(msg));
    listenTabs();
  });

  Shiny.addCustomMessageHandler("insert-sidebar-collapsible", (msg) => {
    $("#bms-sidebar-container .bms-sidebar").append(sidebarEntryCollapsible(msg.title));
    handleSidebarCollapsible();
  });

  Shiny.addCustomMessageHandler("insert-sidebar-collapsible-item", (msg) => {
    $(`#${msg.target}`).append(sidebarEntryCollapsibleItem(msg.title));
    $("#bms-tabs").append(tab(msg));
    listenTabs();
  });
}

const sidebarEntry = (title) => {
  return `<div class='bms-sidebar-open mb-2' data-target='${title}'>${title}</div>`;
}

const sidebarEntryCollapsibleItem = (title) => {
  return `<div class='bms-sidebar-open bms-sidebar-open-collapsible mb-2' data-target='${title}'>${title}</div>`;
}

const sidebarEntryCollapsible = (title) => {
  return `<div class='bms-sidebar-collapsible-open mb-2' data-bs-toggle="collapse" href="#${title}" data-id="${title}">
    ${title}
    <i class="fas fa-chevron-down float-right bms-sidebar-collapsible-icon"></i>
  </div>
  <div class="bms-sidebar-collapsible-content collapse" id="${title}">
  </div>`;
}

const tab = (params) => {
  return `<div class='bms-sidebar-item d-none' data-tab='${params.title}'>${params.content}</div>`;
}
