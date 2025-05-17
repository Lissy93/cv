<script lang="ts">
	import { browser } from '$app/environment';
	import { onMount } from 'svelte';
	import { page } from '$app/stores';
	import { onNavigate } from '$app/navigation';

	import '../app.css';
	import '../styles/variables.scss';
	import '../styles/link.scss';
	import '../styles/page-global.scss';

	interface Document {
		startViewTransition?: (callback: () => Promise<void>) => void;
	}

  onNavigate((navigation) => {
		const doc = document as Document;
    if (!doc.startViewTransition) return;
    return new Promise<void>((resolve) => {
      doc.startViewTransition && doc.startViewTransition(async () => {
        resolve();
        await navigation.complete;
      });
    });
  });

	let header: HTMLElement | null = null;
  let main: HTMLElement | null = null;

	// Display banner if looking for job, within the specified dates. Format date into human readable string
	const lookingForJobDates = {
		start: new Date('2024-09-01'),
		end: new Date('2024-12-31'),
	};
	const currentDate = new Date();
	const startDateFormatted = new Intl.DateTimeFormat('en-US', { year: 'numeric', month: 'long' }).format(lookingForJobDates.start);
	const isSeekingOpportunities = currentDate <= lookingForJobDates.end;
	const pagesToShowBanner = ['/', '/achievements', '/skills', '/experience'];

  function handleScroll() {
    if (header && main) {
      if (main.scrollTop > 60) {
        header.style.boxShadow = '24px 0 22px 0 #0000007d';
        header.style.zIndex = '13';
      } else {
        header.style.boxShadow = '';
        header.style.zIndex = '';
      }
    }
  }

  onMount(() => {
    if (browser) {
      main?.addEventListener('scroll', handleScroll);

      return () => {
        main?.removeEventListener('scroll', handleScroll);
      };
    }
  });
	
	let path;
	// @ts-ignore
	$: path = $page.url.pathname;

	const socials = [
		{ name: 'GitHub', url: 'https://github.com/lissy93', icon: 'fa-github', color: '#333' },
		{ name: 'Twitter', url: 'https://twitter.com/lissy_sykes', icon: 'fa-twitter', color: '#1DA1F2' },
		{ name: 'LinkedIn', url: 'https://www.linkedin.com/in/aliciasykes/', icon: 'fa-linkedin', color: '#0A66C2' },
		{ name: 'Mastodon', url: 'https://mastodon.social/@lissy93', icon: 'fa-mastodon', color: '#6364FF' },
		{ name: 'DEV.to', url: 'https://dev.to/lissy93', icon: 'fa-dev', color: '#f04c8a' },
		{ name: 'StackOverflow', url: 'https://stackoverflow.com/users/979052/alicia-sykes', icon: 'fa-stack-overflow', color: '#F58025' },
	];

	const navLinks = [
		{ name: 'Intro', url: '/intro', icon: 'fa-address-card' },
		{ name: 'Experience', url: '/experience', icon: 'fa-briefcase' },
		{ name: 'Achievements', url: '/achievements', icon: 'fa-star' },
		{ name: 'Skills', url: '/skills', icon: 'fa-code' },
	];

	const headerLinks = [
		{ name: 'About', url: 'https://aliciasykes.com/about' },
		{ name: 'Projects', url: 'https://aliciasykes.com/projects' },
		{ name: 'Contact', url: 'https://aliciasykes.com/contact' },
	];
</script>

<div class="app">
	<aside>
		<div class="aside-inner">
			<a href="/" class="no-underline"><h1>CV: Alicia Sykes</h1></a>
			<h2 class="job-title">Principal Engineer</h2>
			<img class="profile-picture" width="300" src="/profile-picture.jpg" alt="Alicia Sykes" />
			<ul class="socials">
				{#each socials as { url, icon, color }}
					<li style="--hover-color: {color}">
						<a class="no-underline" href={url} target="_blank" rel="nofollow">
							<i class="fa-brands {icon}"></i>
						</a>
					</li>
				{/each}
			</ul>
			<nav class="cv-pages-nav">
				<ul>
					{#each navLinks as { name, url, icon }}
						<li class:is-active={path === url}>
							<a class="no-underline" href={url}><i class="nav-icon fa-solid {icon}"></i>{name}</a>
						</li>
					{/each}
					{ #if path !== '/'}
						<li><a href="/" class="no-underline"><i class="nav-icon fa-solid fa-home"></i>Home</a></li>
					{/if}
				</ul>
			</nav>
			<a href="/download" class="no-underline">
				<button class="download-btn"><i class="fa-solid fa-file-arrow-down"></i>Download CV</button>
			</a>
			<a class="view-code-link" href="https://github.com/lissy93/cv" target="_blank" rel="nofollow">Or View CV Source Code on GitHub</a>
		</div>
		<div class="aside-bottom">
			<a class="get-in-touch" href="/contact">
				<i class="fa-solid fa-paper-plane"></i>
				Send me a Message
			</a>
			<br>
			<small class="license">
				<a href="https://github.com/lissy93/cv">lissy93/cv</a>
				is licensed under <a href="https://github.com/Lissy93/cv/blob/main/LICENSE">MIT</a>, &copy; <a href="https://aliciasykes.com">Alicia Sykes</a> 2024
			</small>
		</div>
	</aside>
	<div class="content-wrapper">
		<header bind:this={header}>
			<div class="nav-links">
				{#each headerLinks as { name, url }}
					<a class="no-underline" target="_blank" href={url}>{name}</a>
				{/each}
			</div>
		</header>

		<main bind:this={main}>

			{#if pagesToShowBanner.includes(path) && isSeekingOpportunities}
			<div class="im-on-the-market">
				<p>
					<strong>As of {startDateFormatted}, I am actively seeking new opportunities!</strong>
					<br>
					Read my <a href="/intro">full bio</a> to learn more about me,
					and if you think I could be a good fit for your team,
					please <a href="/contact">get in touch</a>.
				</p>
				<a href="/ideal-role">
					<button class="small-btn">
						<i class="fa-solid fa-bullseye-arrow"></i>
						View Ideal Role
						<i class="fa-solid fa-arrow-right"></i>
					</button>
				</a>
			</div>
		{/if}

			<div class="page"><slot /></div>
		</main>
	</div>
</div>

<style lang="scss">
	.im-on-the-market {
		background: #dcfddc;
		border: 1px solid #8ddb8d;
		width: 80%;
		max-width: 1000px;
		margin: 1rem auto;
		padding: 0.25rem 1rem 2.5rem 1rem;
		border-radius: 8px;
		font-size: 0.8rem;
		strong {
			color: #376237;
		}
		p {
			margin-bottom: 0;
		}
	}
</style>
