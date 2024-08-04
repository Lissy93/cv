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

	const mdToHtml = (md: string) => {
		return marked(md);
	}

</script>

<svelte:head>	
	<title>CV</title>
	<meta name="description" content="Svelte demo app" />
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
  </section>

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
  </section>

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

  <section class="skills">
    <h2>Skills</h2>
		<ul>
		{#each data.skills as skill}
			<li>
				<b>{skill.name}: </b> {skill.keywords.join(', ')}
			</li>
    {/each}
		</ul>
  </section>

  <section class="achievements">
		<h2>Achievements</h2>
		{#each data.achivments as achievement}
			<p>{@html mdToHtml(achievement)}</p>
		{/each}
  </section>
</div>
<style>

</style>
