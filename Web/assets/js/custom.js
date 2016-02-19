var addInputButton = function(id, txt, clk) {
    var btn = $('<a>')
        .text(txt)
        .attr("id", id)
        .addClass("btn")
        .addClass("btn-mini")
          //.attr("data-toggle", "button")
          //.addClass("btn-info")
        .click(clk);
    $('#input_help_section').append(btn);
    return btn;
};

// CHEATSHEET -----------------
(function() {
    var toggleName = "markdownCheatSheetIsVisible";
    var btnId = "markdownCheatsheetToggleButton";
    var box = $("#markdownCheatsheet");

    var showBox = function() {
	var cheatSheetButton = $('#' + btnId);
    /*if (!cheatSheetButton.hasClass("active")) {
      cheatSheetButton.toggle();
      cheatSheetButton.show();
      }*/
	$("#markdownCheatsheetToggleButton").addClass("active");
	box.show();
    };

    var hideBox = function() {
	var cheatSheetButton = $('#' + btnId);
    /*if (cheatSheetButton.hasClass("active")) {
      cheatSheetButton.toggle();
      cheatSheetButton.show();
      }*/
	$("#markdownCheatsheetToggleButton").removeClass("active");
	box.hide();
    };

    addInputButton(btnId, "BibTeX", function(event) { 
	if ($('#' + btnId).hasClass("active") === false) {
	    showBox();
	} else {
	    hideBox();
	}
    });

    $("#markdownCheatsheetClose").click(function() {
	hideBox();
    });

  // start shown
    //showBox();
    hideBox();

})();