import resolve from "@rollup/plugin-node-resolve";
import css from "rollup-plugin-import-css";
import terser from '@rollup/plugin-terser';

const bundle = (file) => {
  const path = file.split("/");
  const name = path[path.length-1];

  console.info(`Bundling ${file}`);

  const config = {
    input: "srcjs/" + file,
    output: {
      file: "inst/assets/" + name.replace(".js", ".min.js"),
      format: "es",
      sourcemap: true,
    },
    plugins: [
      resolve(),
      terser({
        ecma: 2020,
        module: false,
        warnings: false,
      }),
    ],
    preserveEntrySignatures: false,
    onwarn: warning => {}
  };

  return config;
};

const bundles = (files) => {
  return files.map((file) => bundle(file));
};

const config = bundles([
  "index.js",
  "inputs/buttonText.js"
]);

export default config;
