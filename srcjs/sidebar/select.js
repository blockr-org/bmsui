import { showTab } from "./show.js";

export const handleSelect = () => {
  Shiny.addCustomMessageHandler("select-sidebar-item", (msg) => {
    showTab(msg.title);
  });
};
