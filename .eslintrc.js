module.exports = {
  root: true,
  env: {
    browser: true,
    node: true,
    },
  extends: [
    'plugin:vue/recommended',
    ],
  parserOptions: {
    parser: 'babel-eslint',
    },
  rules: {
    'vue/singleline-html-element-content-newline': 'off',
    'vue/no-v-html': 'off',
        "vue/max-attributes-per-line": 'off'
    },
}