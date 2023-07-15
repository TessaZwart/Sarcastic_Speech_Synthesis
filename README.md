# Sarcastic_Transformation

This is the code that is used to generate sarcastic speech using the FastSpeech2 model by ming024 and can be found [here](https://github.com/ming024/FastSpeech2). This code completely used with a few changes and additions to include Dutch synthesize. Additionally, the [Montreal Forced Aligner](https://montreal-forced-aligner.readthedocs.io/en/latest/) is used to align the speech data. The speech data can be found [here](https://www.kaggle.com/datasets/bryanpark/dutch-single-speaker-speech-dataset). The files that are already synthesized can be found in `/synthesized_speech`.


## Corpus preparation
The data is first downloaded from https://www.kaggle.com/datasets/bryanpark/dutch-single-speaker-speech-dataset. All the text of each speech fragment is extracted from the transcript file and each text is stored in a LAB file with a name corresponding to the audio (WAV) file. The combination of these LAB and WAV files form the corpus. 

## Montreal Forced Aligner
To create the alignments for the FastSpeech2 model, the Montreal Forced Aligner is used. The Dutch dictionary is downloaded from https://github.com/open-dict-data/ipa-dict (only the nl.txt in data folder). We will refer to the dictionary as `dictionary` in the code. `corpus` is the corpus that is generated in the corpus preparation above. The `~` can be changed to the folder name in which you can find the files.

First, an environment is created the the aligner is installed:

`conda create -n aligner -c conda-forge montreal-forced-aligner`

This environment is activated using:

`conda activate aligner`

Then, an acoustic model was created:

`mfa train ~/corpus ~/dictionary.txt ~/new_acoustic_model.zip`

However, the Out Of Vocabulary number was high, so a G2P model was created:

`mfa train_g2p ~/dictionary.txt ~/my_g2p_model.zip`

Then, the dictionary was updated by using the G2P model:

`mfa g2p ~/corpus ~/my_g2p_model.zip ~/new_dictionary.txt`

Finally, this dictionary is used to create a new acoustic model and the alignment in TextGrids:

`mfa train ~/corpus ~/new_dictionary.txt ~/new_acoustic_model.zip --output_directory ~/my_corpus_aligned`

In `my_corpus_aligned` the aligned TextGrids can be found. These TextGrids are used in the FastSpeech2 model.


## FastSpeech2 
For the FastSpeech2 model, it is important to use a GPU. For this project [Hábrók](https://wiki.hpc.rug.nl/habrok/start) is used. Add the files of this repository to Hábrók to be able to use the model. Additionally, a folder `dutch_files` need to be added with the data downloaded from https://www.kaggle.com/datasets/bryanpark/dutch-single-speaker-speech-dataset. The TextGrid files created using the Montreal Forced Aligner need to be added to the folder `preprocessed_data/Dutch_data/`.

Various jobs are created for each step. These jobs can be runned individually to do each step towards synthesizing separately.

First, the model need to be prepared for alignment and preprocessed. This is done using the following lines of code:

`sbatch job_prepare_align.sh`

`sbatch job_preprocess.sh`

To train the model, the following code is used (this can take around 16 hours):

`sbatch job_train.sh`

The trained model can finally be used to synthesize the speech files. The text can be changed in the jobscript by changing the text behind '--text'.

`sbatch job_sincere.sh`

The parameters for `--duration-control`, `--pitch-control`, and `--energy-control` can be changed to manipulate the speech. In this example code three type of sentences are synthesized and manipulated to sarcastic speech. 

`sbatch job_sarcastic.sh`

The synthesized speech will be placed in `~/output/result`.
