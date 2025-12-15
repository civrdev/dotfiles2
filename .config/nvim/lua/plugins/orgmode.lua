return {
{
	'nvim-orgmode/orgmode',
	event  = 'VeryLazy',
	ft     = {'org'},
	config = function()
		require('orgmode').setup({
			org_agenda_files       = '~/org/**/*',
			org_default_notes_file = '~/org/refile.org',
			win_split_mode = {'float', 0.6},
			win_border     = 'rounded',
			org_capture_templates  = {
				t = {
					description = 'task',
					template    = '* TODO %?\n  %U',
					target      = '~/org/tasks.org',
				},
				d = {
					description = 'daylik',
						template = [[
* Обязательное

** В течение дня
- [ ] Зарядка
- [ ] Тайпинг
- [ ] Курс по C
- [ ] Чтение книги
- [ ] Английский
- [ ] Рисование
- [ ] Матрицы
- [ ] Курс по матеше
- [ ] Лабы по физике

** Перед сном
- [ ] Чтение книги
- [ ] Душ
- [ ] Ежедневная заметка

* Задачи на конкретный день
- [ ]
]],
					target = '~/org/diary/dayliks/%<%y-%m-%d>.org',
				},
				n = {
					description = 'daily',
					template = '* %<%H:%M>\n%?\n',
					target = '~/org/diary/notes/%<%y-%m-%d>.org',
				}
			},
			org_custom_exports = {
				p = {
					label = 'Export to PDF',
					action = function(exporter)
						local current_file = vim.api.nvim_buf_get_name(0)
						local target = vim.fn.fnamemodify(current_file, ':p:r') .. '.pdf'
						
						local command = {
							'pandoc',
							current_file,
							'-o', target,
							'--pdf-engine=xelatex'
						}
						
						local on_success = function(output)
							print('PDF экспорт завершён')
						end
						
						local on_error = function(err)
							print('Ошибка экспорта PDF!')
							vim.api.nvim_echo({{ table.concat(err, '\n'), 'ErrorMsg' }}, true, {})
						end
						
						return exporter(command, target, on_success, on_error)
					end
					}
				}
		})

		vim.api.nvim_set_keymap('n', '<leader>oa', ':Org agenda<CR>',  { noremap = true, silent = true })
		vim.api.nvim_set_keymap('n', '<leader>oc', ':Org capture<CR>', { noremap = true, silent = true })

	end,
}
}
