import { showTab } from "./show";

export const handleSelect = () => {
  Shiny.addCustomMessageHandler("select-sidebar-item", (msg) => {
    showTab(msg.title);
  });
}
