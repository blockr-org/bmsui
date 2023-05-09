import resolve from "@rollup/plugin-node-resolve";
import css from "rollup-plugin-import-css";
import terser from '@rollup/plugin-terser';

const config = {
  input: "srcjs/index.js",
  output: {
    file: "inst/assets/index.min.js",
    format: "umd",
    exports: "auto",
    name: "bmsui",
    sourcemap: false,
  },
  plugins: [
    resolve(),
    css({
      minify: true,
    }),
  ],
};

if (process.env.NODE_ENV !== "development") {
  config.plugins.push(terser());
}

export default config;
