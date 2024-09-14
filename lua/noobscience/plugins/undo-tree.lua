return {
	'mbbill/undotree',
	config = function ()
		vim.keymap.set('n', '<leader>l', vim.cmd.UndotreeToggle)
		vim.keymap.set('n', '<leader>lp', vim.cmd.UndotreePersistUndo)
	end
}
