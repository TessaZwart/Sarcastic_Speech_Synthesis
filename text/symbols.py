""" from https://github.com/keithito/tacotron """

"""
Defines the set of symbols used in text input to the model.

The default is a set of ASCII characters that works well for English or text that has been run through Unidecode. For other data, you can modify _characters. See TRAINING_DATA.md for details. """

from text import cmudict, pinyin

_pad = "_"
_punctuation = "!'(),.:;? "
_special = "-"
_letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
_silences = ["@sp", "@spn", "@sil"]

phones = ['aː', 'b', 'd', 'eː', 'f', 'h', 'i', 'iː', 'j', 'k', 'l', 'm', 'n', 'oː', 'p', 'r', 's', 't', 'u', 'uː', 'v', 'x', 'y', 'yː', 'z', 'øː', 'ŋ', 'œ', 'œː', 'ɑ', 'ɒː', 'ɔ', 'ə', 'ɛ', 'ɛː', 'ɡ', 'ɣ', 'ɪ', 'ʃ', 'ʉ', 'ʋ', 'ʒ', 'ʤ']



# Prepend "@" to ARPAbet symbols to ensure uniqueness (some are the same as uppercase letters):
_arpabet = ["@" + s for s in cmudict.valid_symbols]
_pinyin = ["@" + s for s in pinyin.valid_symbols]
_phones = ["@" + s for s in phones]

print("arpabet")
print(type(_arpabet))
print(_arpabet)
print("phones")
print(type(_phones))
print(_phones)

# Export all symbols:
symbols = (
    [_pad]
    + list(_special)
    + list(_punctuation)
    + list(_letters)
    + _phones
    + _silences
)
