/* Defined in: "IRC.app -> Contents -> Resources -> JavaScript -> API -> core.js" */

IRC.viewFinishedLoading = function()
{
	IRC.fadeInLoadingScreen(1.00, 0.95);

	setTimeout(function() {
			   IRC.scrollToBottomOfView()
			   }, 500);
}

IRC.viewFinishedReload = function()
{
	IRC.viewFinishedLoading();
}
