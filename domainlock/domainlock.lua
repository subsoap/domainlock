local M = {}
M.ready = false
M.allowed = false
M.block_external_embed = true -- this will force not allowing external embeds, otherwise manifest rules will be checked
M.debug_override = false -- if game is ran in debug it will auto allow
M.manifest_link = "https://www.pixcade.com/domainlock.json" -- so you can update rules without needing to rebundle your game
M.use_external_manifest = true -- if false internal manifest will be used
M.localhost_override = true -- will allow you to test without checking manifest / allow people to run on localhost
M.retry_time = 0.75 -- how often in seconds manifest will be attempted to get until it is successful
M.retry_max = 10 -- how many times the manifest retry can be done before it forces to not allow
M.retry_times = 0 -- how many times retry has been done already

function M.is_ready()
	return M.ready
end

function M.is_allowed()
	return M.allowed
end

return M