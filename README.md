# Yet another password generator

This is my take on sufficiently secure and memorable passwords.
I use 5 words from the [BIP0039] English wordlist.
Since there are 2048 words, this gives us 11 bits of entropy per word,
for a total of 2⁵⁵ possibilities.
And since the list is designed so that no two words start with the same 4 characters,
we can shorten them and stick them together to mimimize keystrokes without loss of entropy.

[BIP0039]: https://github.com/bitcoin/bips/blob/master/bip-0039.mediawiki

## Example
One possible result is `dogridelibrlabewhen`. The words are *dog, ride, library, label,* and *when.*
