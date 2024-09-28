<script>
  const navLinks = [
    { name: 'Intro', url: '/intro', icon: 'fa-address-card' },
    { name: 'Experience', url: '/experience', icon: 'fa-briefcase' },
    { name: 'Achievements', url: '/achievements', icon: 'fa-star' },
    { name: 'Skills', url: '/skills', icon: 'fa-code' },
  ];

  const intro = [
    `I'm looking for a role where I can take on exciting challenges, and lead teams
    to build top-notch customer-focused products.`,
    `Quality and coding standards are super
    important to me, and I love helping others level up their skills so we can
    create something awesome together, which will bring joy to our customers.`,
    `I'm passionate about building a strong,
    supportive developer community with things like guilds, lunch & learns,
    coding challenges, and learning pathways.`,
    `Ultimately, I want to make sure all our developers are happy,
    and have what they need to succeed and build products that customers will truly love.`
  ];

  const requirements = [
    { lbl: 'Location', desc: 'London-based, or a commutable distance from Central London' },
    { lbl: 'Contract Type', desc: 'Permanent, and ideally full-time' },
    { lbl: 'Workspace', desc: 'While remote working can be great, I do love coming into the office, as I think it\'s important for team building and collaboration' },
    { lbl: 'Seniority', desc: 'Engineering Manager or Principal Engineer role, but still with exposure to coding' },
    { lbl: 'Discipline', desc: 'Full-Stack or Frontend' },
    { lbl: 'Industry', desc: 'Fin tech, developer tools and custom-facing products' },
    { lbl: 'Comp', desc: 'Competitive salary, but I can and will be flexible on this for the right role' },
  ];

  const values = [
    'Values quality and good coding standards',
    'Dedicated to developer happiness',
    'Investing in junior developers and fostering growth',
    'Developing customer-focused products',
    'Appreciates the value of open source',
    'Innovative, and an openness to trying new things',
  ];
</script>

<svelte:head>	
	<title>Alicia Sykes | CV | Ideal Role</title>
</svelte:head>

<h1>What I'm looking for</h1>

{#each intro as paragraph}
<p>{paragraph}</p>
{/each}

<h2>Values</h2>
<p class="subtitle">I'm looking for a company which has the following core values</p>
<ul>
  {#each values as value}
    <li>{value}</li>
  {/each}
</ul>


<h2>Requirements</h2>
<p class="subtitle">I'm pretty flexible on the details, but ideally looking to work within these parameters</p>
<ul>
  {#each requirements as { lbl, desc }}
    <li>
      <strong>{lbl}:</strong> {desc}
    </li>
  {/each}
</ul>



<h2>Why me?</h2>
<p>
  I'm an accomplished full-stack senior developer, just take a look at my recent <a href="/achievements">achievements</a> for evidence of this! 
  You can learn more about me, my attributes and the philosophy that drives me in my <a href="/intro">intro</a> page.
  Or if you prefer to see my past work, take a look at my published apps at <a href="https://apps.aliciasykes.com">apps.aliciasykes.com</a>
</p>

<h2>Get in Touch</h2>
<p>
  Does this sound good to you? If so, I'd love to hear from you! So please do <a href="/contact">get in touch</a>.
</p>

<div class="other-pages">
  {#each navLinks as { name, url, icon }}
    <a href={url} class="no-underline">
      <button class="big-btn"><i class="fa-solid {icon}"></i>{name}</button>
    </a>
  {/each}
</div>

<style lang="scss">

h2 {
  font-size: 1.2rem;
  font-weight: 600;
  margin: 2rem 0 0.5rem 0;
}

.subtitle {
  margin: 0 0 0.5rem 0;
  font-size: 0.8rem;
  font-style: italic;
  opacity: 0.8;
}

ul {
  margin: 0;
  padding-left: 1rem;
  font-size: 1rem;
  li {
    strong {
      font-weight: 600;
    }
  }
}

p {
  font-size: 1rem;
  margin: 0 0 0.5rem 0;
}

.other-pages {
  display: grid;
  align-items: center;
  grid-template-columns: repeat(auto-fit, minmax(170px, 1fr));
  gap: 1rem;
  margin: 1rem 0;
  a {
    button {
      margin: 0;
      font-size: 1rem;
      padding: 0.5rem 0.5rem;
    }
  }
}
</style>
