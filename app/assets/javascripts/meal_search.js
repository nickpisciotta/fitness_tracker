$(document).ready(function(){

  $("#meal_search").on('click', function(){
    var mealTitle = $("#meal_title").val()
    $.ajax({
      url: "https://api.edamam.com/api/nutrition-data",
      method: "GET",
      data: {app_id: "eee1746f", app_key: "181cf369eed7e36b966c9803955f10ec", ingr: mealTitle },
      dataType: "jsonp",
      success: function (data) {
        window.location.reload()
        var totalCalories = $("<li>")
        var totalCarbohydrates = $("<li>")
        var totalProtein = $("<li>")
        var totalFat = $("<li>")
        var postData = {meal_info: {totalCalories: data.calories}}
          $.ajax({
            url: "/meals",
            method: "POST",
            dataType: "JSON",
            data: postData
            // success: function (data) {
            // window.location.reload()
            // }
          })
        totalCalories.text("Total Calories: " + data.calories)
        totalCarbohydrates.text("Total Carbohydrates: " + Math.round(data.totalNutrients.CHOCDF.quantity))
        totalFat.text("Total Fat: " + Math.round(data.totalNutrients.FAT.quantity))
        totalProtein.text("Total Protein: " + Math.round(data.totalNutrients.PROCNT.quantity))
        $("#meal_search_results").append(totalCalories)
        $("#meal_search_results").append(totalCarbohydrates)
        $("#meal_search_results").append(totalFat)
        $("#meal_search_results").append(totalProtein)
      }
    })
  })
})
