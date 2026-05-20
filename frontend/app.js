async function loadDemoSeries() {
  try {
    const response = await fetch('/api/demo/series?code=600519');
    const data = await response.json();
    console.log('Demo series response:', data);
  } catch (error) {
    console.error('Failed to load demo series:', error);
  }
}

loadDemoSeries();
