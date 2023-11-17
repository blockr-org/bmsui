import { listenTabs } from "./show.js";
import { handleSidebarCollapsible } from "./collapsible.js";

export const handleInsert = () => {
  window.Shiny.addCustomMessageHandler("insert-sidebar-item", (msg) => {
    $(sidebarEntry(msg.title, msg.id)).insertAfter(
      $(".bms-sidebar-open").last(),
    );
    // we create the tab empty
    $("#bms-tabs").append(tab(msg));

    // we leverage this to bind inputs/output within tab on initialisation.
    window.Shiny.renderDependenciesAsync(msg.content.deps).then(() => {
      window.Shiny.renderContentAsync(
        $(`[data-tab='${msg.id}']`),
        msg.content.html,
      ).then(() => {
        listenTabs();

        const event = new CustomEvent("bms:inserted-tab", {
          detail: msg.id,
        });
        document.dispatchEvent(event);
      });
    });
  });

  window.Shiny.addCustomMessageHandler("insert-sidebar-collapsible", (msg) => {
    $(".bms-sidebar-open")
      .last()
      .insertAfter(sidebarEntryCollapsible(msg.title));
    handleSidebarCollapsible();
  });

  window.Shiny.addCustomMessageHandler(
    "insert-sidebar-collapsible-item",
    (msg) => {
      $(`[data-id='${msg.target}']`).append(
        sidebarEntryCollapsibleItem(msg.title),
      );
      $("#bms-tabs").append(tab(msg));
      listenTabs();
    },
  );
};

const sidebarEntry = (title, id) => {
  return `<div class='bms-sidebar-open mb-2' data-target='${id}'>${title}</div>`;
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
  return `<div class='bms-sidebar-item d-none' data-tab='${params.id}'></div>`;
};
