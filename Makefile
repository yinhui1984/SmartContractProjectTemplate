all:build

run:
	cd ./mychain/ && ./run.sh && cd ../


attach:
	cd ./mychain/ && ./attach.sh && cd ../

new:
ifdef name
	cd ./contracts/ && ./newContract.sh $(name) && cd ../
else
	@echo "Please specify a name for the contract. example: make new name=MyContract"
endif

delete:
ifdef name
	cd ./contracts/ && ./deleteContract.sh $(name) && cd ../
else
	@echo "Please specify a name for the contract. example: make delete name=MyContract"
endif

mine:
	cd ./pyscripts/ && ./autoMine.py && cd ../

deploy:
ifdef name
	cd ./contracts/ && ./deployContract.sh $(name) && cd ../
else
	@echo "Please specify a name for the contract. example: make deploy name=MyContract"
endif