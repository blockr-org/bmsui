import { sidebar } from "./sidebar/index";

$(() => {
  $(document).on("bms:show-tab", (e) => {
    console.log(e.detail);
  });
  sidebar();
});
