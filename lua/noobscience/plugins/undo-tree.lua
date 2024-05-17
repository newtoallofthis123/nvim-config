return {
	'mbbill/undotree',
	config = function ()
		vim.keymap.set('n', '<leader>l', vim.cmd.UndotreeToggle)
	end
}
