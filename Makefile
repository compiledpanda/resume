.PHONY: build
build:
	mkdir -p ./dist
	cp ./src/index.html ./dist/index.html
	npx tailwindcss -i ./src/site.css -o ./dist/site.css

.PHONY: serve-static
serve-static:
	npx http-server ./dist

.PHONY: serve-tailwind
serve-tailwind:
	npx tailwindcss -i ./src/site.css -o ./dist/site.css --watch

.PHONY: serve
serve:
	npx concurrently "make serve-static" "make serve-tailwind"