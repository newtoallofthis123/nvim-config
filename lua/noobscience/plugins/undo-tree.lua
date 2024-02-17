return {
	'mbbill/undotree',
	config = function ()
		vim.keymap.set('n', '<leader>y', vim.cmd.UndotreeToggle)
	end
}
