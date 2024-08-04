export async function GET() {
  const repoOwner = 'Lissy93';
  const repoName = 'cv';
  const assetName = 'Alicia-Sykes-CV.pdf';

  // Fetch the latest release data from GitHub API
  const response = await fetch(`https://api.github.com/repos/${repoOwner}/${repoName}/releases/latest`);
  if (!response.ok) {
    return new Response('Failed to fetch the latest release information', { status: response.status });
  }

  const release = await response.json();
  const tagName = release.tag_name;

  // Construct the download URL for the PDF
  const downloadUrl = `https://github.com/${repoOwner}/${repoName}/releases/download/${tagName}/${assetName}`;

  // Redirect to the download URL
  return new Response(null, {
    status: 302,
    headers: {
      location: downloadUrl
    }
  });
}
