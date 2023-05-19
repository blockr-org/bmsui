import { showTab } from "./index";

export const handleSelect = () => {
  Shiny.addCustomMessageHandler("select-sidebar-item", (msg) => {
    showTab(msg.title);
  });
}
