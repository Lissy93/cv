<script>
  	const navLinks = [
      { name: 'Experience', url: '/experience', icon: 'fa-briefcase' },
      { name: 'Achievements', url: '/achievements', icon: 'fa-star' },
      { name: 'Skills', url: '/skills', icon: 'fa-code' },
    ];

    const intro = [
      `Alicia Sykes in a distinguished Principle Engineer, specialising in front-end and full-stack web development.
      With over a decade of industry experience, working on a diverse wide range of projects,
      she has a proven track record of delivering high-quality, scalable solutions.`,

      `Alicia is well versed in a variety of programming languages, frameworks and libraries 
      (including Rust, Go, Node.js, Python, Java, Vue.js, Svelte, React, to name a few) and is continually
      staying up-to-date on the latest technologies.
      This puts her in the perfect position to advise on the best tools and technologies for any given project.`,

      `With a genuine passion for mentoring and supporting developers, Alicia
      has a proven track record of helping others to grow and improve their skills.`,

      `Outside of work, she's the maintainer of several high-profile open source projecrs, supporting millions of active users.
      Alicia is among the top 100 contributors on GitHub, and has crafted over 1 million lines of code.
      Her self-hosted applications have gained over 10 million downloads on Docker Hub, and have been featured in several industry publications.
      `,
      
      `A keen participant in the tech community, Alicia has written many guest articles, and has a strong following among the developer
      community, with 10k subscribers to her DEV.to blog, and many more across other platforms.
      As a regular attendee and occasional speaker at tech events and meetups, she is well known in the tech community.`,

      `Her contributions to open source and the technology community have been recognised with several awards and accolades.
      Including placing first on the Open UK Honors list, as well as gaining a spot on the prestigious GitHub Accelerator programe.
      Over the past few years she has won numerous international hackathons`,
    ];
</script>

<h1>Intro</h1>

{#each intro as paragraph}
  <p>{paragraph}</p>
{/each}

<div class="other-pages">
{#each navLinks as { name, url, icon }}
  <a href={url} class="no-underline">
    <button class="big-btn"><i class="fa-solid {icon}"></i>{name}</button>
  </a>
{/each}
</div>

<style lang="scss">
  .other-pages {
    display: flex;
    gap: 1rem;
    flex-wrap: wrap;
    justify-content: center;
    a {
      width: 11rem;
      button {
        margin: 0;
        font-size: 1rem;
        padding: 0.5rem 0.5rem;
      }
    }
  }
</style>
