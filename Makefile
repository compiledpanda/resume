.PHONY: build
build:
	mkdir -p ./dist
	cp ./src/index.html ./dist/index.html
	npx tailwindcss -i ./src/site.css -o ./dist/site.css


.PHONY: copy-and-watch-files
copy-and-watch-files:
	npx copy-and-watch --watch src/**/*.html dist/

.PHONY: serve-static
serve-static:
	npx http-server -c-1 ./dist

.PHONY: serve-tailwind
serve-tailwind:
	npx tailwindcss -i ./src/site.css -o ./dist/site.css --watch

.PHONY: serve
serve:
	npx concurrently "make copy-and-watch-files" "make serve-static" "make serve-tailwind"