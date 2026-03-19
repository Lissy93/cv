<script lang="ts">
	import { page } from '$app/state';
</script>

<svelte:head>
	<title>Alicia Sykes | CV | {page.status}</title>
</svelte:head>

<div class="error-page">
	<span class="status">{page.status}</span>
	<h1>{page.error?.message || 'Something went wrong'}</h1>
	<p>
		{#if page.status === 404}
			The page you're looking for doesn't exist or has been moved.
		{:else}
			An unexpected error occurred. Please try again later.
		{/if}
	</p>
	<a href="/" class="no-underline big-btn">
		<i class="fa-solid fa-arrow-left"></i>
		Back to CV
	</a>
</div>

<style lang="scss">
	.error-page {
		text-align: center;
		padding: 3rem 1rem;
		display: flex;
		flex-direction: column;
		align-items: center;
		gap: 0.25rem;
	}
	.status {
		font-size: 5rem;
		font-weight: 700;
		color: var(--primary);
		line-height: 1;
		opacity: 0.8;
	}
	h1 {
		font-size: 1.4rem;
		font-weight: 600;
		margin: 0;
	}
	p {
		font-size: 0.9rem;
		opacity: 0.7;
		margin: 0.25rem 0 1.5rem;
	}
</style>
