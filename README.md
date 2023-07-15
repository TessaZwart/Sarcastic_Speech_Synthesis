# Sarcastic_Transformation

This is the code that is used to generate sarcastic speech using the FastSpeech2 model found [here](https://github.com/ming024/FastSpeech2}. Additionally, the [Montreal Forced Aligner](https://montreal-forced-aligner.readthedocs.io/en/latest/) is used to align the speech data. The speech data can be found [here](https://www.kaggle.com/datasets/bryanpark/dutch-single-speaker-speech-dataset).

## FastSpeech2 - synthesizing
For the FastSpeech2 model, it is important to use a GPU. For this project [Hábrók](https://wiki.hpc.rug.nl/habrok/start) is used. Add the files of this repository to Hábrók to be able to use the model.

Various jobs are created for each step. These jobs can be runned individually in order to do each step towards synthesizing separately.

First, the model need to be prepared for alignment and preprocessed. This is done using the following lines of code:


Note that in this repository these steps are already done. So you can directly start with training. To train the model, the following code is used:




The trained model can finally be used to synthesize the speech files. The text can be changed in the jobscript by changing the text behind '--text'.

To manipulate the speech the speech values can be added to the line of code. In this example code three type of sentences are synthesized and manipulated to sarcastic speech. 
