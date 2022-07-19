const data = JSON.parse(document.querySelector("#exercise-data").innerHTML)

//console.log(data)

const today = (new Date()).toISOString().substring(0,10);
today_index = data.find(ex => ex.date == today).index
data.splice(today_index)

const recent = data.slice(-6).reverse()
const latest = recent.shift()
console.log(latest, recent)

const renderSummary = exercise => [
  `<a href="/exercise/${exercise.index}" class="exercise-summary">`,
  `<span class="index">${exercise.index}:</span>`,
  exercise.parts.map(p => `<span>${p.short_name}</span>`).join(""),
  `</a>`
].join("")

document.querySelector(".latest").innerHTML = renderSummary(latest)

document.querySelector(".recent").innerHTML =
  recent.map(exercise => `<li>${renderSummary(exercise)}</li>`).join("")

