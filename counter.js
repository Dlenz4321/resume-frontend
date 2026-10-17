cat > site/counter.js <<EOF
// Visitor counter: records this visit via the API and shows the total.
(function () {
  const API_URL = "$API_URL";
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
EOF

grep -n "API_URL =" site/counter.js
