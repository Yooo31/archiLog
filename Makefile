.PHONY: help build start stop logs shell down test lint fix

help:
	@echo "Les cibles disponibles et leur utilité :"
	@echo ""
	@echo "  build     : Construit et lance les conteneurs Docker en arrière-plan"
	@echo "  start     : Lance les conteneurs Docker en arrière-plan"
	@echo "  stop      : Arrête les conteneurs Docker"
	@echo "  logs      : Affiche les logs des conteneurs Docker"
	@echo "  shell     : Lance un shell Bash dans le conteneur 'app'"
	@echo "  down      : Arrête et supprime les conteneurs Docker (avec les volumes)"
	@echo "  test      : Exécute les tests PHPUnit"
	@echo "  lint      : Analyse le code avec PHPStan"
	@echo "  fix       : Corrige les erreurs de formatage avec PHP-CS-Fixer"
	@echo ""
	@echo "Exécutez 'make <cible>' pour utiliser une cible."

build:
	docker compose up --build -d

start:
	docker compose up -d

stop:
	docker compose stop

logs:
	docker compose logs -f

shell:
	docker compose exec app bash

down:
	docker compose down -v

test:
	php bin/phpunit

lint:
	php vendor/bin/phpstan analyse

fix:
	php vendor/bin/php-cs-fixer fix
