<script lang="ts">

const stats = [
  {
    stat: '10M downloads on DockerHub',
    source: 'https://hub.docker.com/u/lissy93',
  },
  {
    stat: 'Top 100 developer on GitHub',
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
    source: '',
  },
  // {
  //   stat: '5k+ followers on GitHub, X, Dev, LinkedIn etc',
  //   source: 'https://github.com/lissy93',
  // },
  {
    stat: '100+ repos I maintain or are a core contributor of',
    source: 'https://github.com/Lissy93?tab=repositories&q=&type=&language=&sort=stargazers',
  },
];

const awards = [
  {
    award: 'OpenUK Honors List 2024',
    source: 'https://openuk.uk/community/openuk-honours-lists/2024-honours-list',
  },
  {
    award: 'GitHub Accelerator Program',
    source: 'https://accelerator.github.com/',
  },
  {
    award: 'BCS Best Computer Scient Project',
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

</script>

<h2>Achivments</h2>

<h3>Stats</h3>
<ul class="stats">
  {#each stats as {stat, source}}
    <li>
      {stat}
      {#if source}
        <a class="source" href={source} target="_blank" rel="nofollow">[Source]</a>
      {/if}
    </li>
  {/each}
</ul>

<h3>Awards</h3>
<ul class="awards">
  {#each awards as {award, source}}
    <li>
      {award}
      {#if source}
        <a class="source" href={source} target="_blank" rel="nofollow">[Source]</a>
      {/if}
    </li>
  {/each}
</ul>

<h3>Hackathons</h3>
<ul class="hackathons">
  {#each hackathonWins as win}
    <li>
      <p class="line1">{win.line1}</p>
      <p class="line2">{win.line2}</p>
    </li>
  {/each}
</ul>

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
      opacity: 0.8;
    }
  }
</style>
