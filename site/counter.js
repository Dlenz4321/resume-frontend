// Visitor counter: records this visit via the API and shows the total.
(function () {
  const API_URL = "https://func-resume-5ldg0q.azurewebsites.net/api/visitor-count";
  const el = document.getElementById("visits");
  if (!el) return;

  fetch(API_URL, { method: "POST" })
    .then(function (res) {
      if (!res.ok) throw new Error("HTTP " + res.status);
      return res.json();
    })
    .then(function (data) {
      el.textContent = Number(data.count).toLocaleString();
    })
    .catch(function (err) {
      console.error("Visitor counter unavailable:", err);
      el.textContent = "unavailable";
    });
})();
