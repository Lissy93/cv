<script>
  	const navLinks = [
      { name: 'Experience', url: '/experience', icon: 'fa-briefcase' },
      { name: 'Achievements', url: '/achievements', icon: 'fa-star' },
      { name: 'Skills', url: '/skills', icon: 'fa-code' },
      { name: 'Contact', url: '/contact', icon: 'fa-paper-plane' },
    ];

    const tagline = 'A hands-on engineering manager, dedicated to bringing out the best in developers and building top-notch products.';

    const intro = [

      `I'm a builder at heart.
      Whether it's a global-scale trading platform or a fun little CLI tool to check website privacy,
      I love creating software that's fast, accessible, secure—and actually helps people.`,
      
      `I've been coding professionally for over a decade, but tinkering with tech for much longer than that.
      I care deeply about clean code, thoughtful architecture, and empowering others to do their best work.
      I've lead engineering teams across startups, scale-ups and large enterprises,
      always with the same objective in mind: to deliver high-quality, scalable solutions that meet the needs of users and businesses alike.`,

      `But what I really love, is the world of open source. I've published 100+
      production grade tools/applications, and have contributed to many, many more.
      On GitHub, I'm among one of the top developers world-wide, with 70k+ stars,
      1 million+ lines of hand-written code, and 10 million+ Docker downloads.`,

      // `Recently, I was invited to join the GitHub Accelerator program.
      // And have also won several awards and been featured in a few industry publications.`,

      `In terms of tech stacks, I'm a full-stack developer by trade, with a focus on modern, scalable frontends.
      But I'm very well versed in backend technologies too, and have a strong understanding of DevOps and cloud infrastructure.
      I'm pretty quick to pick up new languages and techstacks, and love learning new things.
      So I'm always in the position to objectively choose the best tools for the job, and to help others do the same.`,

      `I enjoy wearing many hats: architect, engineer, mentor, product-thinker,
      and occasional DevRel. But above all, I love working with kind,
      curious people to build great things—and leaving things better than I found them.`,

      `A cause that is close to my heart, is data privacy and security.
      I believe that everyone should have the right to control their own data,
      and it's our responsibility as developers to help them do that.
      This has been a theme in a lot of the services I've built.
      `,

      `In my spare time, I'm usually tinkering with my homelab, building fun little projects,
      or failing at HackerRank challenges.
      And away from the keyboard, I enjoy sports (I spent 10 years in the British Army reserves),
      and I also love a good adventure!
      After work, you'll usually find me in the pub with friends and colleagues,
      chatting about the latest tech trends and sharing ideas.
      `,


      // `Alicia Sykes is an accomplished Principal Engineer, and hands-on Engineering Manager
      // specializing in front-end and full-stack development.
      // With over a decade of development and leadership experience, Alicia has successfully delivered
      // numerous scalable, high-quality solutions across a diverse range of industries.
      // From fintech platforms facilitating over $1B in trading volume to e-commerce
      // apps with millions of users, she consistently ensures impactful results.`,

      // `Alicia is well versed in a variety of programming languages, frameworks and libraries 
      // (including Rust, Go, Node.js, Python, Java, Vue.js, Svelte, React, to name a few) and is continually
      // staying up-to-date on the latest technologies.
      // This puts her in the perfect position to advise on the best tools and technologies for any given project.`,

      // `Alicia is also passionate about mentoring.
      // She has a proven track record of helping developers grow their skills and
      // take on more responsibilities, having led engineering upskilling initiatives
      // for teams of up to 40 engineers, while delivering top-tier solutions for clients.`,

      // `Outside of work, she's the maintainer of several high-profile open source projecrs, supporting millions of active users.
      // Alicia is among the top 100 contributors on GitHub, and has crafted over 1 million lines of code.
      // Her self-hosted applications have gained over 10 million downloads on Docker Hub, and have been featured in several industry publications.
      // `,
      
      // `A keen participant in the tech community, Alicia has written many guest articles, and has a strong following among the developer
      // community, with 10k subscribers to her DEV.to blog, and many more across other platforms.
      // As a regular attendee and occasional speaker at tech events and meetups, she is well known in the tech community.`,

      // `Her contributions to open source and the technology community have been recognised with several awards and accolades.
      // Including placing first on the Open UK Honors list, as well as gaining a spot on the prestigious GitHub Accelerator programe.
      // Over the past few years she has won over large-scale international hackathons`,

      // `Alicia is deeply committed to cybersecurity and data privacy, both for individuals
      // and organizations. She actively participates in CTFs,
      // and has responsibly disclosed several high-profile vulnerabilities earning bounties.
      // Alicia has also developed several tools to help people take control of their data,
      // including digital-defense.io, which sees 100k monthly users, and Awesome Privacy,
      // the go-to resource for verified privacy-respecting software and services.
      // Her work in self-hosting includes Dashy, with over 10 million Docker downloads,
      // and Web Check, a security scanning tool used by thousands of companies worldwide,
      // boasting 20k stars on GitHub. Through these efforts, Alicia continues to champion
      // safer digital spaces and advocates for stronger data privacy rights.`,

      // `Alicia is a strong advocate for diversity and inclusion in tech.
      // She has led initiatives to mentor underrepresented groups, organized diversity-focused coding bootcamps,
      // and champions inclusive hiring practices in her teams.`,

      // `Away from the keyboard, Alicia is a keen sportswoman. After spending 10 years in the Army reserves,
      // she still loves running, swimming and cycling, and and has completed several long-distance events for charity.
      // Organising work socials, that can bring the whole team together for a bit of fun, is one of her favourite things to do. 
      // After work, you'll usually find her in the pub with friends and colleagues, chatting about the latest tech trends and sharing ideas.`,
    ];
</script>

<svelte:head>	
	<title>Alicia Sykes | CV | Intro</title>
</svelte:head>

<h1>Intro</h1>

<h2>👋 Hey! I'm Alicia</h2>

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

h1 {
  margin-bottom: 1rem;
}

h2 {
  margin: 0;
  font-size: 1.5rem;
}

p {
  margin: 0.5rem 0;
  line-height: 1.5;
}

.other-pages {
  margin-top: 1rem;
  display: grid;
  align-items: center;
  grid-template-columns: repeat(auto-fit, minmax(170px, 1fr));
  gap: 1rem;
  a {
    button {
      margin: 0;
      font-size: 1rem;
      padding: 0.5rem 0.5rem;
    }
  }
}
</style>
