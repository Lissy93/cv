<script>
	import '../../styles/resume-main.scss';
	import '../../styles/other-pages.scss';

  import Language from '../../components/Language.svelte';
  export let data = {};
 
  const techStack = data.techStack;
</script>

<section class="skills-page">
<h1>Skills</h1>
<p>
  Below is a list of technologies that I've worked extensivley with.
  I've included links to projects I've built using each tech stack.
  I enjoy staying up-to-date with the latest technologies,
  so that I'm in the best position to use the optimum tech stack for any given project.
</p>

{#each Object.keys(techStack) as technologyArea}
  <h3>{technologyArea}</h3>
  <ul>
    {#each techStack[technologyArea] as technology}
      <li>
        <b><Language language={technology.language} />: </b>
        <span class="project-list">
        {#each technology.projects as project}
          <a href="https://github.com/lissy93/{project}" target="_blank" rel="nofollow">{project}</a>
        {/each}
        </span>
        <!-- {technology.projects.join(', ')} -->
      </li>
      {/each}
    </ul>
{/each}

<div class="note">
  <p>
    <b>Note</b>: This list is not exhaustive, it doesn't include some technologies I've used profesionally at work, or for private clients.
    <br>
    You can view some of the projects I have built with the above technologies at <a href="https://apps.aliciasykes.com">apps.aliciasykes.com</a>.
  </p>
</div>

</section>

<style lang="scss">
  p {
    font-size: 0.95rem;
  }
  ul {
    padding-left: 0.5rem;
    list-style: none;
    li {
      margin: 0.1rem 0;
      font-size: 0.95rem;
      .project-list a {
        color: var(--text-color);
        opacity: 0.8;
        text-transform: capitalize;
        font-size: 0.95rem;
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
