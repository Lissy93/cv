<script>
	import '../../styles/resume-main.scss';
	import '../../styles/other-pages.scss';

  import Language from '../../components/Language.svelte';
  export let data = {};
 
  const techStack = data.techStack;
  
  const softSkills = [
  { skill: 'Problem Solving', desc: 'Proven track record of resolving complex technical challenges across diverse industries, delivering scalable and maintainable solutions.' },
  { skill: 'Visionary Leadership', desc: 'Led teams of up to 40 engineers, driving long-term strategy while ensuring alignment with business goals and technical vision.' },
  { skill: 'Cross-functional Collaboration', desc: 'Collaborated closely with product managers, designers, and backend teams to ensure seamless integration and project success.' },
  { skill: 'Agile Mindset & Adaptability', desc: 'Successfully led and contributed to agile development processes, adapting to changing requirements and delivering iterative improvements.' },
  { skill: 'Technical Mentorship', desc: 'Mentored junior and mid-level engineers, leading upskilling initiatives and fostering growth within development teams.' },
  { skill: 'Data-driven Decision Making', desc: 'Consistently used analytics and data to inform technical decisions, ensuring solutions are backed by measurable insights.' },
  { skill: 'Innovation Catalyst', desc: 'Spearheaded the development of cutting-edge solutions, winning over 10 international hackathons and driving forward technical innovation.' },
  { skill: 'Stakeholder Influence', desc: 'Built strong relationships with key stakeholders, ensuring project buy-in and alignment with both business and technical objectives.' },
  { skill: 'Enterprise Architecture Thinking', desc: 'Applied enterprise-level architecture principles to design scalable, maintainable systems, ensuring long-term viability.' },
  { skill: 'Change Management', desc: 'Successfully led teams through major technical transformations, minimizing disruption while optimizing for future growth.' },
  { skill: 'Customer Focus', desc: 'Designed and delivered customer-centric solutions, always prioritizing user experience and real-world impact.' }
];

</script>

<svelte:head>	
	<title>Alicia Sykes | CV | Skills</title>
</svelte:head>

<section class="skills-page">
<h1>Skills</h1>
<p>
  Below is a list of technologies that I've worked extensively with, along with links to projects I've build with each.
  I enjoy staying up-to-date with the latest technologies,
  so that I'm in the best position to use the optimum tech stack for any given project.
</p>

{#each Object.keys(techStack) as technologyArea}
  <h3>{technologyArea}</h3>
  <ul>
    {#each techStack[technologyArea] as technology}
      <li>
        <b><Language language={technology.language} /> </b>
        <br>
        <details class="projects-collapsable">
          <summary class="project-list-title">Sample Projects ({technology.projects.length})</summary>
          <ul>
            {#each technology.projects as project}
            <li>
              <i class="fa-brands fa-github"></i>
              <a href="https://github.com/lissy93/{project}" target="_blank" rel="nofollow">
                {project}
              </a>
            </li>
          {/each}
          </ul>
        </details>
      </li>
      {/each}
    </ul>
{/each}

<h3>Soft Skills</h3>
<ul class="soft-skills">
  {#each softSkills as skill}
    <li>
      {skill.skill}<br>
      <span class="skill-desc">{skill.desc}</span>
    </li>
  {/each}

<div class="note">
  <p>
    <b>Note</b>: The technology list is not exhaustive, as it doesn't include some technologies I've used professionally at work, or for private clients.
    <br><br>
    For a full-list of programming languages and frameworks I've worked extensivley with, as well as links to code written in each,
    please reference <a href="https://apps.aliciasykes.com">apps.aliciasykes.com</a>.
    <br><br>
    For the soft skills, I can provide references, or put you in touch with previous colleagues who can vouch for my abilities.
  </p>
</div>

</section>

<style lang="scss">
  p {
    font-size: 0.95rem;
  }
  .second-intro {
    font-size: 0.8rem;
    opacity: 0.8;
  }
  ul {
    padding-left: 0.5rem;
    list-style: none;
    li {
      margin: 0.1rem 0;
      font-size: 0.95rem;
      .projects-collapsable {
        margin-left: 2rem;
        opacity: 0.8;
        font-size: 0.8rem;
        ul {
          margin-bottom: 0.5rem;
        }
        .project-list-title {
          cursor: pointer;
        }
        a {
          color: var(--text-color);
          text-transform: capitalize;
          &:hover {
            opacity: 1;
          }
          &:not(:last-child) {
            margin-right: 0.25rem;
            &::after {
              content: ', ';
            }
          }
        }
      }
    }
  }
  .soft-skills {
    list-style: none;
    // padding-left: 1.5rem;
     li {
      font-size: 0.95rem;
      font-weight: 500;
      margin: 0.25rem 0 0 0;
      &:before {
        content: '✓';
        margin-right: 0.5rem;
      }
      .skill-desc {
        font-size: 0.8rem;
        opacity: 0.8;
        font-style: italic; 
        font-weight: 400;
        margin: 0 0 0 1rem;

        display: -webkit-box;
        max-width: 100%;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
      }
     }
  }
  .note {
    border: 2px solid var(--primary);
    padding: 0.25rem 0.5rem;
    margin: 1rem auto;
    border-radius: 4px;
    background: #0000000a;
    b, p, a {font-size: 0.8rem;}
    b, a { font-weight: 500; }
  }
</style>
