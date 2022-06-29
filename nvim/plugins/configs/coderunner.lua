local code_runner = require("code_runner")

code_runner.setup({
  -- put here the commands by filetype
  filetype = {
		java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
		python = "python3 -u",
		typescript = "deno run",
		rust = "cd $dir && cargo run",
    go = "cd $dir && go run $fileName",
    sh = "bash $file",
	},
})

