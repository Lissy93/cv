<script lang="ts">
	import '../styles/resume-main.scss';
	import { marked } from 'marked';

	export let data: any;

	const makeUrlretty = (url: string) => {
		return url.replace(/(^\w+:|^)\/\//, '');
	}

	const formatData = (date: string) => {
		if (!date.match(/^\d{4}-\d{2}$/)) {
			return date;
		}
		const [year, month] = date.split('-');
		const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
		return `${months[parseInt(month) - 1]} ${year}`;
	}

	const mdToHtml = (md: { text: string, source: string }) => {
		if (!md || !md.text) {
			return '';
		}
		return marked(md.text);
	}

</script>

<svelte:head>	
	<title>Alicia Sykes | CV | Home</title>
</svelte:head>

<div class="resume">
  <!-- Resume head -->
	<section class="basics">
    <h1>{data.basics.name}</h1>
		<div class="contacts">
			<p>{data.basics.email}</p>
			<p><a href={data.basics.url}>{makeUrlretty(data.basics.url)}</a></p>
			<p>{data.basics.location.address}</p>
		</div>
  </section>

	<!-- Personal statement -->
  <section class="personal-statement">
    <p>{data['personal-statement']}</p>
		<a href="/intro">
			<button class="small-btn">
				<i class="nav-icon fa-solid fa-address-card"></i>
				View Full Bio
				<i class="fa-solid fa-arrow-right"></i>
			</button>
		</a>
  </section>

	{#if data.work && data.work.length > 0}
		<section class="work">
			<h2>Experience</h2>
			{#each data.work as job}
				<div>
					<h3>{job.name}</h3>
					<h4>
						{job.position}
						<span class="grey">{formatData(job.startDate)} - {formatData(job.endDate)}</span>
					</h4>
					<ul>
						{#each job.highlights as highlight}
							<li>{highlight}</li>
						{/each}
					</ul>
				</div>
			{/each}
			<a href="/experience">
				<button class="small-btn">
					<i class="nav-icon fa-solid fa-briefcase"></i>
					View All Experience
					<i class="fa-solid fa-arrow-right"></i>
				</button>
			</a>
		</section>
	{/if}

	{#if data.education && data.education.length > 0}
	<section class="education">
		<h2>Education</h2>
    {#each data.education as edu}
      <div>
        <h3>{edu.institution}</h3>
        <h4>{edu.area} ({edu.studyType})</h4>
        <p>{edu.score}</p>
      </div>
    {/each}
  </section>
	{/if}

  <section class="skills">
    <h2>Skills</h2>
		<ul>
		{#each data.skills as skill}
			<li>
				<b>{skill.name}: </b> {skill.keywords.join(', ')}
			</li>
    {/each}
		</ul>
		<a href="/skills">
			<button class="small-btn">
				<i class="nav-icon fa-solid fa-code"></i>
				View All Skills
				<i class="fa-solid fa-arrow-right"></i>
			</button>
		</a>
  </section>

  <section class="achievements">
		<h2>Achievements</h2>
		<ul>
			{#each (data.achievements || []) as achievement}
				<li>
					{ achievement.text }
					{#if achievement.source}
						<a href={achievement.source} title={makeUrlretty(achievement.source)} target="_blank" rel="nofollow">
							<i class="achievement-link fa-solid fa-link"></i>
						</a>
					{/if}
				</li>
			{/each}
		</ul>
		<a href="/achievements">
			<button class="small-btn">
				<i class="nav-icon fa-solid fa-star"></i>
				View All Achievements
				<i class="fa-solid fa-arrow-right"></i>
			</button>
		</a>
	</section>

	<section class="achievements">
		<h2>Awards</h2>
		<ul>
			{#each (data.awards || []) as award}
				<li>
					<b>{ award.title }</b> - <i>{ award.summary}</i>
					{#if award.source}
						<a href={award.source} title={makeUrlretty(award.source)} target="_blank" rel="nofollow">
							<i class="achievement-link fa-solid fa-link"></i>
						</a>
					{/if}
				</li>
			{/each}
		</ul>

  </section>
</div>
<style>
.achievement-link {
	color: var(--text-color);
	opacity: 0.8;
	font-size: 0.6rem;
	transition: all 0.2s ease-in-out;
	&:hover {
		color: var(--primary);
	}
}
</style>
