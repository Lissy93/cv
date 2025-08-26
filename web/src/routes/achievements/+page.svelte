<script lang="ts">

import Language from '../../components/Language.svelte';

const stats = [
  {
    stat: '10M downloads on DockerHub',
    source: 'https://hub.docker.com/u/lissy93',
  },
  {
    stat: 'Top 100 developer on GitHub (out of 150M+ users)',
    source: 'https://gitstar-ranking.com/Lissy93',
  },
  {
    stat: '10+ wins on global hackathons',
    source: 'https://notes.aliciasykes.com/p/0s5s3uOtKj',
  },
  {
    stat: 'Top 1% helper on StackOverflow',
    source: 'https://stackoverflow.com/users/979052/alicia-sykes',
  },
  {
    stat: '1M+ lines of code written',
    source: 'https://codestats.net/users/alicia',
  },
  {
    stat: '1M+ annual unique users across my websites',
    source: '',
  },
  {
    stat: '10k+ subscribers to developer blog',
    source: 'https://dev.to/lissy93',
  },
  {
    stat: '5k+ followers on GitHub, X, Dev, LinkedIn etc',
    source: 'https://github.com/lissy93',
  },
  {
    stat: '100+ repos I maintain or are a core contributor of',
    source: 'https://github.com/Lissy93?tab=repositories&q=&type=&language=&sort=stargazers',
  },
  {
    stat: '1000+ repos and open source projects contributed to',
    source: '',
  },
  {
    stat: 'Ranked num 1 female open source contributor worldwide',
    source: 'https://gitstar-ranking.com/Lissy93',
  },
  // {
  //   stat: '100k GitHub stars on my personal projects',
  //   source: 'https://gitstar-ranking.com/Lissy93',
  // },
];

const awards = [
  {
    award: 'OpenUK Honors List 2025',
    issuer: 'OpenUK',
    source: 'https://openuk.uk/honours/',
  },
  {
    award: 'GitHub Accelerator Program',
    issuer: 'GitHub',
    source: 'https://accelerator.github.com/',
  },
  {
    award: 'OpenUK Honors List 2024',
    issuer: 'OpenUK',
    source: 'https://openuk.uk/community/openuk-honours-lists/2024-honours-list',
  },
  {
    award: 'Best Final Year CompSci Project',
    issuer: 'British Computer Society, Oxford',
    source: 'https://oxon.bcs.org/2016/06/27/annual-student-prizes-2016/',
  },
];

const hackathonWins = [
  {
    line1: 'Won 1st place overall + Network Rail and TFL prizes at Infra-hack, London 2019',
    line2: 'Used computer vision to identify incidents and determine station status, in real-time.',
  },
  {
    line1: 'Won 1st place overall at StartHack, Switzerland 2019',
    line2: 'Created Pax, to identify + remove flashes from video footage for photo-sensitive viewers.',
  },
  {
    line1: 'Won Inteligen Buildings Award (KONE) at Hack Junction, Helsinki 2018',
    line2: 'Build Elevate-to-Awesome, an IoT app to track and gamify taking the stairs',
  },
  {
    line1: 'Won BlockChain Award (SwissCom) at StartHack, Switzerland 2018',
    line2: 'Created UNwasted, a social food dapp to reduce waste, on the Ethereum network',
  },
  {
    line1: 'Won 1st place overall at StartHack, Switzerland 2016',
    line2: 'Developed system for real-time sentiment analysis of geographic social media data',
  },
  {
    line1: 'Won 2nd place at AngelHack and HP sponsor prize Winner, London 2015',
    line2: 'Created SmartDepart, an alarm to wake you up earlier if there are delays on your commute',
  },
  {
    line1: 'Won 2nd place at NBC Universal Comcast hackathon, London 2015',
    line2: 'Created an intelligent movie recommendation engine, implemented as Twitter bot',
  },
  {
    line1: 'Won 1st place as team at HealthHack, London 2015',
    line2: 'Build smart watch app for gamifying health tracking',
  },
  {
    line1: 'Won 2nd place at AngelHack London 2014',
    line2: 'Created Anti-Theft Charge, Android app that prevents theft while your device is charging',
  },
  {
    line1: 'Won 2nd place (and Intelligent Headset main prize), DevLab Live London 2014',
    line2: 'Made CityExplorer, interactive tour guide using accelerometers to determine line of site',
  },
];

const projects = [
  {
    name: 'Dashy',
    description: 'Control panel for self-hosting',
    tech: 'Vue',
    logo: 'https://dashy.to/img/dashy.png',
    stars: '20k',
    repo: 'lissy93/dashy',
    web: 'https://dashy.to',
  },
  {
    name: 'Web-Check',
    description: 'All-in-one OSINT and security scanner',
    tech: 'React',
    logo: 'https://github.com/Lissy93/web-check/blob/master/.github/web-check-logo.png?raw=true',
    stars: '25k',
    repo: 'lissy93/web-check',
    web: 'https://web-check.xyz',
  },
  {
    name: 'Digital Defense',
    description: 'Ultimate checklist of online security tips',
    tech: 'Solid',
    logo: 'https://i.ibb.co/Rb6P6h6/shield.png',
    stars: '19k',
    repo: 'lissy93/personal-security-checklist',
    web: 'https://digital-defense.io',
  },
  {
    name: 'Awesome Privacy',
    description: 'Curated list of verified privacy-respecting services',
    tech: 'Astro',
    logo: 'https://github.com/Lissy93/awesome-privacy/blob/gh-pages/awesome-privacy.png?raw=true',
    stars: '8k',
    repo: 'lissy93/awesome-privacy',
    web: 'https://awesome-privacy.xyz',
  },
  {
    name: 'AdGuardian Term',
    description: 'Real-time traffic monitoring',
    tech: 'Rust',
    logo: 'https://i.ibb.co/25GNT0n/adguardian-banner-4.png',
    stars: '1k',
    repo: 'lissy93/AdGuardian-Term',
    web: 'https://adguardian.as93.net'
  },
  {
    name: 'Portainer Templates',
    description: 'Over 500 1-click Docker apps',
    tech: 'Python',
    logo: 'https://i.ibb.co/hMymwH0/portainer-templates-small.png',
    stars: '2k',
    repo: 'Lissy93/portainer-templates',
    web: 'https://portainer-templates.as93.net',
  },
  {
    name: 'Domain Locker',
    description: 'Complete domain name management suite',
    tech: 'Angular',
    logo: 'https://domain-locker.com/icons/android-chrome-192x192.png',
    stars: '300',
    repo: 'Lissy93/domain-locker',
    web: 'https://domain-locker.com',
  },
];

const normalizeUrl = (url: string) => {
  if (!url) return '';
  return url.replaceAll('https://', '').replaceAll('http://', '');
};

</script>

<svelte:head>	
	<title>Alicia Sykes | CV | Achievements</title>
</svelte:head>

<h2>Achievements</h2>

<h3>Stats</h3>
<ul class="stats">
  {#each stats as {stat, source}}
    <li>
      {stat}
      {#if source}
        <a class="source" href={source} target="_blank" rel="nofollow" title={`Source: ${normalizeUrl(source)}`}>
          <i class="fa-solid fa-link"></i>
        </a>
      {/if}
    </li>
  {/each}
</ul>

<hr>

<h3>Awards</h3>
<ul class="awards">
  {#each awards as {award, source}}
    <li>
      {award}
      {#if source}
        <a class="source" href={source} target="_blank" rel="nofollow" title={`Source: ${normalizeUrl(source)}`}>
          <i class="fa-solid fa-link"></i>
        </a>
      {/if}
    </li>
  {/each}
</ul>

<hr>

<h3>Flagship Projects</h3>
<ul class="projects">
  {#each projects as project}
    <li>
      <p class="top-line">
        <img src={project.logo} alt={''} width="20">
        <strong>
          <a href={project.web}>{project.name}</a>
        </strong>
        <span class="desc"> 
          - {project.description}
          <a
            class="source"
            href={`https://github.com/${project.repo}`}
            target="_blank"
            rel="nofollow"
            title={`GitHub: ${project.repo}`}
          >
            <i class="fa-solid fa-link"></i>
          </a>
      </p>
      <span class="project-stats">
        <Language language={project.tech} small={true} />
        |
        <a
          title={`View ${project.repo.split('/')[1]} on GitHub`}
          href={`https://github.com/${project.repo}`}>
          <i class="fa-brands fa-github"></i> {project.repo}
        </a>
        <!-- | 
        <a title={`View ${project.name}'s homepage`} href={project.web}>
          <i class="fa-solid fa-globe"></i> {normalizeUrl(project.web)}
        </a> -->
        |
        <span title="GitHub Star Count"><i class="fa-solid fa-star"></i> Star Count: {project.stars}</span>
      </span>
    </li>
  {/each}
</ul>


<p class="projects-more">
  The above is just to demonstrate my proficiency in the given tech stacks.
  But I'm very quick to pick up new technologies.
  You can view my full catalog of apps at <a href="https://apps.aliciasykes.com">apps.aliciasykes.com</a>,
  or even more of my apps on my <a href="https://github.com/lissy93?tab=repositories&q=&type=&language=&sort=stargazers">GitHub</a>.
</p> 

<hr>

<h3>Hackathons</h3>
<ul class="hackathons">
  {#each hackathonWins as win}
    <li>
      <p class="line1">{win.line1}</p>
      <p class="line2">{win.line2}</p>
    </li>
  {/each}
</ul>

<img src="/assets/Hackathon-win-pictures.png" alt="Hackathon wins" width="100%" class="hackathon-image" />

<style lang="scss">
  h2 {
    font-size: 1.8rem;
    text-align: center;
    font-weight: 500;
  }
  h3 {
    margin: 1rem 0 0.5rem;
  }
  p, a, li, span, div {
    font-size: 0.9rem;
  }
  ul {
    margin: 0;
    padding-left: 1.5rem;
  }
  hr {
    margin: 1rem 0;
    opacity: 0.8;
  }
  .source {
    font-size: 0.65rem;
    opacity: 0.65;
    margin-left: 2px;
    &:hover {
      opacity: 1;
    }
  }
  .hackathons {
    li p {
      margin: 0;
    }
    .line1 {
      font-weight: 500;
    }
    .line2 {
      font-style: italic;
      opacity: 0.65;
    }
  }

  .projects {
    padding-left: 0.5rem;
    li {
      list-style: none;
      .top-line {
        margin: 0;
        display: flex;
        align-items: center;
        gap: 0.5rem;
        flex-wrap: wrap;
        margin-top: 0.4rem;
      }
      strong {
        font-weight: 500;
        display: inline-flex;
        gap: 0.5rem;
        justify-content: center;
        align-items: center;
        a {

        }
      }
      i {
        font-size: 0.8rem;
      }
      .desc {
        font-style: italic;
        font-weight: 500;
      }
      a {
        color: var(--text-color);
        &:hover {
          color: var(--primary);
        }
      }
      .project-stats {
        margin-left: 1rem;
        font-size: 0.8rem;
        opacity: 0.8;
        a {
          opacity: 0.8;
        }
      }
    }
  }

  .hackathon-image {
    margin: 1rem auto 0 auto;
    max-width: 100%;
  }

  .projects-more {
    opacity: 0.8;
    font-style: italic;
    font-size: 0.8rem;
  }
</style>
