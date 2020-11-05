# DomainLock

WIP do not use for production yet. Please test and report issues. Doc below is WIP as well.

Secure your HTML5 Defold games so they can't (easily) be stolen by other sites. Someone with enough technical knowledge determination could break your game to work on other sites, but this method of domain locking will deter most if not all from even bothering to try and steal your game.

I can't guarantee that even with this project your game won't get easily stolen, there may possibly some workaround. If you find a way to improve this project please submit a pull request or create an issue.

Note that if the page your game is on manually refreshes ever it may change the document.referrer, which can change the subdomain that the game thinks has it embedded on.

If you allow embeds, nothing stops a site you allow to embed your game to make a fullscreen page of its own which other sites are allowed to embed, so make sure the sites you allow don't do that.

Use a JSON validator helper to make sure your manifest is formatted properly. One option is https://jsonformatter.curiousconcept.com/

The link to your external manfiest is hard coded in your project because you cannot trust it being relative to your project as the external manifest is easy to edit so that you can modify it without needing to rebundle your game. You can choose to use an internal manfiest, which is inside of your game bundle, and will require you to rebundle your game to modify if you wish to use this option.

You must list ALL versions of your domain you want your game to be playable on. This means both the domain.com and www.domain.com if you want both to be able to host/embed the game. The reason for this is that certain domain styles like www.domain.co.uk are hard to detect without including a list of all known TLDs.

Do your due dilligence and test. If you release a version of your game that is not properly setup / not working then people may be able to rip it and redistribute it.

If you want to manually decide what to do in your game if the DomainLock check fails then you will want to edit config.use_return_link in your manifest.

In addition to using config.use_return_link you should also have your game go into frozen / bricked state where it presents a text link to your main domain and says the game is not authorized.

> This game is blocked for this site. 
> If you want to play this game, visit yourdomain.com {go to site}
> {another link to go to site}

You should do this because it is posible to prevent iframes from redirecting the top window. Which means if you only had config.use_return_link people could still put your game in a sandboxed iframe to steal it.

There are also ways to prevent iframes from opening links, which is why you should also visually display your return link domain on your brick/deny in game screen.

If you are licensing your game so that partners can embed it in their sites they may not like your game redirecting them to your site is something goes wrong. So in this case you may not want to use the config.use_return_link option.

If you wish for your game to run on clients such as the itch.io desktop client make sure you have config.protocol_override set to true. You can add more override protocols if there are other special clients you want to allow.

If you are really serious about protection then since the game.projectc is editable, you should make sure you enforce that your main collection is actually the one that is loaded first. This can be done by setting a value in the main collection that if it's not set the rest of the game dies. This is only a real problem if your collection names are able to be guessed and allow the game to play without the main collection being set properly.

If you want to use an external manifest then you will need to setup CORS.

If you want to publish your game on itch.io you should probably use an internal manifest to keep it simple.

If you allow protocol override with itch-cave: then others could potentially host your game on their account with people able to play that version within the itch.io desktop client. Probably not something to worry about.

If you host your game on itch and the page your game is on refreshes it may mess up the referrer of the iframe to be itch.io instead of for example pixcade.itch.io so avoid having your page refresh if hosting on itch. You can add itch.io to your domains too but it would mean someone could potentially host your game on their account if they were able to trigger a one time refresh. I'm not 100% on these but I've seen odd results sometimes when iframes fresh.

If your game is set to not allow localhost override then make sure you have an internal manifest set as in this case one should be for return link.

You can use https://www.epochconverter.com/ to calculate expiration time for partners if you want to limit their access that way.