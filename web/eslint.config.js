import js from '@eslint/js';
import ts from 'typescript-eslint';
import svelte from 'eslint-plugin-svelte';
import prettier from 'eslint-config-prettier';
import globals from 'globals';

/** @type {import('eslint').Linter.Config[]} */
export default [
	js.configs.recommended,
	...ts.configs.recommended,
	...svelte.configs['flat/recommended'],
	prettier,
	...svelte.configs['flat/prettier'],
	{
		languageOptions: {
			globals: {
				...globals.browser,
				...globals.node
			}
		}
	},
	{
		files: ['**/*.svelte'],
		languageOptions: {
			parserOptions: {
				parser: ts.parser
			}
		},
		rules: { // NOTE: Added these rules, becos everything static. I'll remove em if i make dynamic in the future
			'svelte/no-navigation-without-resolve': 'off', // not got any dynamic routes, so hardcoded strings are fine
			'svelte/require-each-key': 'off', // i'm only using static data here, no point keying them in each for loop
		}
	},
	{
		ignores: ['build/', '.svelte-kit/', 'dist/']
	}
];
