import { listenTabs } from "./show.js";
import { handleSidebarCollapsible } from "./collapsible.js";

export const handleInsert = () => {
  Shiny.addCustomMessageHandler("insert-sidebar-item", (msg) => {
    $(sidebarEntry(msg.title)).insertAfter($(".bms-sidebar-open").last());
    // we create the tab empty
    $("#bms-tabs").append(tab(msg));
    // we leverage this to bind inputs/output within tab on initialisation.
    Shiny.renderDependenciesAsync(msg.content.deps)
      .then(() => {
        Shiny.renderContentAsync($(`[data-tab='${msg.title}']`), msg.content)
          .then(() => {
            listenTabs();

            const event = new CustomEvent("bms:inserted-tab", {
              detail: msg.title,
            });
            document.dispatchEvent(event);
          });
      });
  });

  Shiny.addCustomMessageHandler("insert-sidebar-collapsible", (msg) => {
    $(".bms-sidebar-open").last().insertAfter(
      sidebarEntryCollapsible(msg.title),
    );
    handleSidebarCollapsible();
  });

  Shiny.addCustomMessageHandler("insert-sidebar-collapsible-item", (msg) => {
    $(`[data-id='${msg.target}']`).append(
      sidebarEntryCollapsibleItem(msg.title),
    );
    $("#bms-tabs").append(tab(msg));
    listenTabs();
  });
};

const sidebarEntry = (title) => {
  return `<div class='bms-sidebar-open mb-2' data-target='${title}'>${title}</div>`;
};

const sidebarEntryCollapsibleItem = (title) => {
  return `<div class='bms-sidebar-open bms-sidebar-open-collapsible mb-2' data-target='${title}'>${title}</div>`;
};

const sidebarEntryCollapsible = (title) => {
  return `<div class='bms-sidebar-collapsible-open mb-2' data-bs-toggle="collapse" href="#${title}" data-id="${title}">
    ${title}
    <i class="fas fa-chevron-down float-right bms-sidebar-collapsible-icon"></i>
  </div>
  <div class="bms-sidebar-collapsible-content collapse" id="${title}">
  </div>`;
};

const tab = (params) => {
  return `<div class='bms-sidebar-item d-none' data-tab='${params.title}'></div>`;
};
