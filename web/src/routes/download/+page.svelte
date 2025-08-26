<script lang="ts">
  import { onMount } from 'svelte';
  import { browser } from '$app/environment';

  let loading = true;
  let error = false;

  onMount(async () => {
    if (browser) {
      try {
        // Try to download the PDF directly from the website
        const pdfUrl = '/alicia-sykes-cv.pdf';
        
        // Check if the PDF exists
        const response = await fetch(pdfUrl, { method: 'HEAD' });
        if (response.ok) {
          // PDF exists, redirect to it
          window.location.href = pdfUrl;
        } else {
          // Fallback to GitHub releases
          const repoOwner = 'Lissy93';
          const repoName = 'cv'; 
          const assetName = 'Alicia-Sykes-CV.pdf';

          const releaseResponse = await fetch(`https://api.github.com/repos/${repoOwner}/${repoName}/releases/latest`);
          if (!releaseResponse.ok) {
            throw new Error('Failed to fetch release info');
          }

          const release = await releaseResponse.json();
          const tagName = release.tag_name;
          const downloadUrl = `https://github.com/${repoOwner}/${repoName}/releases/download/${tagName}/${assetName}`;
          
          window.location.href = downloadUrl;
        }
      } catch (err) {
        console.error('Download error:', err);
        error = true;
        loading = false;
      }
    }
  });
</script>

<svelte:head>
  <title>Downloading CV...</title>
  <meta name="robots" content="noindex" />
</svelte:head>

{#if loading && !error}
  <div class="loading">
    <h1>Downloading CV...</h1>
    <p>Your download should start automatically. If it doesn't, please check that JavaScript is enabled.</p>
  </div>
{:else if error}
  <div class="error">
    <h1>Download Error</h1>
    <p>Sorry, there was an issue downloading the CV. You can try:</p>
    <ul>
      <li><a href="https://github.com/Lissy93/cv/releases/latest" target="_blank" rel="noopener">Visit the releases page directly</a></li>
      <li><a href="/">Return to the CV website</a></li>
    </ul>
  </div>
{/if}

<style>
  .loading, .error {
    text-align: center;
    padding: 2rem;
    max-width: 600px;
    margin: 2rem auto;
  }
  
  .error ul {
    list-style: none;
    padding: 0;
  }
  
  .error li {
    margin: 1rem 0;
  }
  
  .error a {
    color: var(--color-primary, #007acc);
    text-decoration: none;
  }
  
  .error a:hover {
    text-decoration: underline;
  }
</style>