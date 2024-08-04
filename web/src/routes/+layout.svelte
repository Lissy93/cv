<script>
	import '../app.css';
	import '../styles/variables.scss';
	import '../styles/link.scss';
	import '../styles/page-global.scss';

	import { page } from '$app/stores';
	
	let path;
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
			<h2 class="job-title">Principle Engineer</h2>
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
			<a href="https://github.com/Lissy93/cv/releases/download/1.0.0/Alicia-Sykes-CV.pdf" class="no-underline">
				<button class="download-btn"><i class="fa-solid fa-file-arrow-down"></i>Download CV</button>
			</a>
			<a class="view-code-link" href="https://github.com/lissy93/cv" target="_blank" rel="nofollow">View CV Source Code</a>
		</div>
	</aside>
	<div class="content-wrapper">
		<header>
			<div class="nav-links">
				{#each headerLinks as { name, url }}
					<a class="no-underline" target="_blank" href={url}>{name}</a>
				{/each}
			</div>
		</header>
		<main>
			<div class="page"><slot /></div>
		</main>
	</div>
</div>
