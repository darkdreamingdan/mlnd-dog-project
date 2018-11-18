[//]: # (Image References)

[image1]: ./images/sample_dog_output_new.png "Sample Output"

# Project Overview

 Given an image of a dog, the notebook algorithm will identify an estimate of the canine’s breed.  If supplied an image of a human, the code will identify the resembling dog breed.  

![Sample Output][image1]

# Project Instructions

*NOTE: Instructions are only tested on Linux*

1. Clone the repository and navigate to the repository root directory in a Bash or Powershell.

2. Run the dependencies downloader tool:

	**Linux/OSX**:

	```
	bash install_dependencies.sh
	```

	**Windows**:

	```
	.\install_dependencies.ps1
	```

3. Install the Conda environment (requires a Miniconda or Anaconda environment):

	*NOTE: The Conda environment is intended for GPU usage and uses the latest `tensorflow-gpu` package from conda* 

	```
	conda env create -f dog.yml
	conda activate dog
	```  

4. Open the notebook.
	
	```
	jupyter notebook dog_app.ipynb
	```
