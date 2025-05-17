<script lang="ts">
  export let language = '';
  export let small = false;

  interface LanguageAttributes {
    name: string;
    icon: string;
    color: string;
    homepage?: string;
  }

  interface BadgeConfigs {
    [key: string]: LanguageAttributes;
  }

  const badgeConfigs: BadgeConfigs = {
    // Programming Languages
    android: { name: 'Android', color: '3DDC84', icon: 'android' },
    astro: { name: 'Astro', color: 'E83CB9', icon: 'astro' },
    alpine: { name: 'Alpine.js', color: '8BC0D0', icon: 'alpinedotjs' },
    angular: { name: 'Angular', color: 'DD0031', icon: 'angular' },
    babel: { name: 'Babel', color: 'F9DC3E', icon: 'babel' },
    bash: { name: 'Bash', color: '4EAA25', icon: 'gnubash' },
    c: { name: 'C', color: 'A8B9CC', icon: 'c' },
    'c++': { name: 'C++', color: '00599C', icon: 'cplusplus' },
    'c#': { name: 'C#', color: '239120', icon: 'cplusplus' },
    coffeescript: { name: 'CoffeeScript', color: '2F2625', icon: 'coffeescript' },
    crystal: { name: 'crystal', color: '000000', icon: 'crystal' },
    css: { name: 'CSS', color: '563D7C', icon: 'css3' },
    config: { name: 'Config', color: 'EF1970', icon: 'haveibeenpwned' },
    d3: { name: 'D3.js', color: 'F9A03C', icon: 'd3' },
    dart: { name: 'Dart', color: '0175C2', icon: 'dart' },
    dockerfile: { name: 'Docker', color: '2496ED', icon: 'docker' },
    docker: { name: 'Docker', color: '2496ED', icon: 'docker' },
    elixir: { name: 'Elixir', color: '4B275F', icon: 'Elixir' },
    elm: { name: 'Elm', color: '60B5CC', icon: 'elm' },
    erlang: { name: ' Erlang', color: 'A90533', icon: ' erlang' },
    fsharp: { name: 'F#', color: 'B845FC', icon: 'fsharp' },
    flutter: { name: 'Flutter', color: '02569B', icon: 'flutter' },
    go: { name: 'Go', color: '00ADD8', icon: 'go' },
    html: { name: 'HTML', color: 'E34F26', icon: 'html5' },
    hono: { name: 'Hono', color: 'E36002', icon: 'hono' },
    haskell: { name: ' Haskell', color: '5D4F85', icon: ' haskell' },
    java: { name: 'Java', color: '007396', icon: 'mocha' },
    javascript: { name: 'JavaScript', color: 'F7DF1E', icon: 'javascript' },
    julia: { name: 'Julia', color: '9558B2', icon: 'julia' },
    kotlin: { name: 'Kotlin', color: 'F18E33', icon: 'kotlin' },
    lit: { name: 'Lit', color: '00ffff', icon: 'lit' },
    livescript: { name: 'LiveScript', color: '65ADF1', icon: 'nativescript' },
    node: { name: 'Node.js', color: '339933', icon: 'nodedotjs' },
    nim: { name: 'Nim', color: 'FFE953', icon: 'nim' },
    markdown: { name: 'Markdown', color: '000000', icon: 'markdown' },
    makefile: { name: 'Makefile', color: '006600', icon: 'cmake' },
    ocaml: { name: ' OCaml', color: 'EC6813', icon: ' ocaml' },
    perl: { name: 'Perl', color: '39457E', icon: 'perl' },
    php: { name: 'PHP', color: '777BB4', icon: 'php' },
    powershell: { name: 'PowerShell', color: '5391FE', icon: 'powershell' },
    preact: { name: 'Preact', color: '673AB8', icon: 'preact' },
    pug: { name: 'Pug', color: 'A86454', icon: 'pug' },
    python: { name: 'Python', color: '3C78A9', icon: 'python' },
    r: { name: 'R', color: '198CE7', icon: 'r' },
    react: { name: 'React', color: '61DAFB', icon: 'react' },
    reactnative: { name: 'React Native', color: '09D3AC', icon: 'react' },
    red: { name: 'Red', color: 'B32629', icon: 'red' },
    ruby: { name: 'Ruby', color: 'CC342D', icon: 'ruby' },
    rust: { name: 'Rust', color: 'e86243', icon: 'rust' },
    scala: { name: 'Scala', color: 'DC322F', icon: 'scala' },
    shell: { name: 'Shell', color: '4EAA25', icon: 'gnubash' },
    svelte: { name: 'Svelte', color: 'ff3e00', icon: 'svelte' },
    solid: { name: 'Solid', color: '2C4F7C', icon: 'solid' },
    swift: { name: 'Swift', color: 'F05138', icon: 'swift' },
    typescript: { name: 'TypeScript', color: '3178C6', icon: 'typescript' },
    qwik: { name: 'Qwik', color: 'ac7ef4', icon: 'qwik' },
    vue: { name: 'Vue.js', color: '4FC08D', icon: 'vuedotjs' },
    vanjs: { name: 'Van.js', color: 'F44336', icon: 'ejs' },
    webassembly: { name: 'WebAssembly', color: '654FF0', icon: 'webassembly' },

    // DevOps
    ansible: { name: 'Ansible', color: 'EE0000', icon: 'ansible' },
    kubernetes: { name: 'Kubernetes', color: '326CE5', icon: 'kubernetes' },
    githubactions: { name: 'GitHub Actions', color: '2088FF', icon: 'githubactions' },
    prometheus: { name: 'Prometheus', color: 'E6522C', icon: 'prometheus' },
    grafana: { name: 'Grafana', color: 'F46800', icon: 'grafana' },
    terraform: { name: 'Terraform', color: '844FBA', icon: 'terraform' },

    // Cloud
    netlify: { name: 'Netlify', color: '00C7B7', icon: 'netlify' },
    vercel: { name: 'Vercel', color: '000000', icon: 'vercel' },
    cloudflare: { name: 'Cloudflare', color: 'F38020', icon: 'cloudflare' },
    aws: { name: 'AWS', color: '232F3E', icon: 'amazonwebservices' },
    azure: { name: 'Azure', color: '0089D6', icon: 'cloudways' },
    gcp: { name: 'GCP', color: '4285F4', icon: 'googlecloud' },
    ibmcloud: { name: 'IBM Cloud', color: '1261FE', icon: 'ibmcloud' },
    fastly: { name: 'Fastly', color: 'FF282D', icon: 'fastly' },

    // Databases
    mysql: { name: 'MySQL', color: '4479A1', icon: 'mysql' },
    mongodb: { name: 'MongoDB', color: '47A248', icon: 'mongodb' },
    redis: { name: 'Redis', color: 'DC382D', icon: 'redis' },
    sqlite: { name: 'SQLite', color: '003B57', icon: 'sqlite' },
    postgresql: { name: 'PostgreSQL', color: '336791', icon: 'postgresql' },
    bigquery: { name: 'BigQuery', color: '669DF6', icon: 'googlebigquery' },

    // Testing
    jest: { name: 'Jest', color: 'C21325', icon: 'jest' },
    puppeteer: { name: 'Puppeteer', color: '40B5A4', icon: 'puppeteer' },
    enzyme: { name: 'Testing Library', color: 'E33332', icon: 'testinglibrary' },
    cypress: { name: 'Cypress', color: '17202C', icon: 'cypress' },
    storybook: { name: 'Storybook', color: 'FF4785', icon: 'storybook' },
    junit: { name: 'JUnit', color: '25A162', icon: 'junit5' },

    // Security
    nmap: { name: 'Nmap', color: '4F5D95', icon: 'nmap' },
    owaspzap: { name: 'OWASP ZAP', color: '4B8BBE', icon: 'owasp' },
    burpsuite: { name: 'Burp Suite', color: 'FAC748', icon: 'burpsuite' },
    wireshark: { name: 'Wireshark', color: '1679A7', icon: 'wireshark' },
    hackthebox: { name: 'Hack The Box', color: '9FEF00', icon: 'hackthebox' },

    // Servers
    apachetomcat: { name: 'Apache Tomcat', color: 'F8DC75', icon: 'apachetomcat' },
    nginx: { name: 'Nginx', color: '269539', icon: 'nginx' },
    apache: { name: 'Apache', color: 'D22128', icon: 'apache' },
    caddy: { name: 'Caddy', color: '0D597F', icon: 'caddy' },
    lighttpd: { name: 'Lighttpd', color: 'FFB500', icon: 'lighttpd' },

    // APIs
    graphql: { name: 'GraphQL', color: 'E10098', icon: 'graphql' },

    // Servers
    debian: { name: 'Debian', color: 'A81D33', icon: 'debian' },
    gitlab: { name: 'GitLab', color: 'FC6D26', icon: 'gitlab' },

    // Tools
    gradle: { name: 'Gradle', color: '02303A', icon: 'gradle' },

    // DevOps
    rabbitMq: { name: 'RabbitMQ', color: 'FF6600', icon: 'rabbitmq' },
    nixos: { name: 'NixOS', color: '41439B', icon: 'nixos' },
    rancher: { name: 'Rancher', color: '0075A8', icon: 'rancher' },
    raspberrypi: { name: 'Raspberry Pi', color: 'A22846', icon: 'raspberrypi' },

    // Web3
    ethereum: { name: 'Ethereum', color: '3C3C3D', icon: 'ethereum' },
    solana: { name: 'Solana', color: '3C3C3D', icon: 'solana' },
    polkadot: { name: 'Polkadot', color: 'E6007A', icon: 'polkadot' },
    substrate: { name: 'Substrate', color: 'E6007A', icon: 'substrate' },
    near: { name: 'NEAR', color: '222222', icon: 'near' },
    avalanche: { name: 'Avalanche', color: '62B0D9', icon: 'avalanche' },
    harmony: { name: 'Harmony', color: 'FFC300', icon: 'harmony' },
    opensea: { name: 'OpenSea', color: '2081E2', icon: 'opensea' },
    web3js: { name: 'Web3.js', color: 'F16822', icon: 'web3dotjs' },
  };

  // Get the language info (if present) for the languages passed as a prop
  const getLangAttributes = (lang: string): LanguageAttributes | null => {
    const defaultConfig = {name: lang, color: '000000', icon: '' };
    return badgeConfigs[lang?.toLocaleLowerCase().replaceAll('.', '').replaceAll(' ', '')] || defaultConfig;
  };

  // Make both badge URL and language info available to the component (and reactive)
  $: langAttributes = getLangAttributes(language);
</script>

{#if langAttributes}
<div class="language {small ? 'small' : ''}" title={`Build with ${langAttributes.name}`} style={`--lang-color: #${langAttributes.color};`} >
  <img height="16" width="16" alt="l" src="https://cdn.simpleicons.org/{langAttributes.icon}/{langAttributes.color}" />
  {langAttributes.name}
</div>
{/if}


<style lang="scss">
  img {
    // filter: grayscale(20%);
    filter: brightness(0.6);
    transition: all 0.1s ease-in-out;
    &:hover {
      filter: brightness(1);
      transform: scale(1.05);
    }
  }
  .language {
    font-size: 0.95rem;
    font-weight: 500;
    width: fit-content;
    padding: 0.1rem 0.2rem;
    border-radius: var(--curve-factor, 4px);
    display: flex;
    gap: 0.5rem;
    display: inline;
    transition: all 0.3s ease-in-out;
    cursor: default;
    color: var(--lang-color);
    filter: brightness(0.8);
    &:hover {
      font-weight: 600;
      color: var(--lang-color);
    }
    img {
      width: 1rem;
      height: 1rem;
      margin-right: 0.25rem;
    }
    &.small {
      font-size: 0.8rem;
      font-weight: 400;
      img {
        width: 0.8rem;
        height: 0.8rem;
      }
    }
  }
</style>
