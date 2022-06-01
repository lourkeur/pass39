import secrets

with open('@english_word_list@') as f:
    wordlist = [w.strip() for w in f.readlines()]

assert len(wordlist) == 2 ** 11, "wordlist doesn't have the expected length"
wordlist = [w[:4] for w in wordlist]
assert len(set(wordlist)) == len(wordlist), "wordlist contains duplicates"
print(''.join(secrets.choice(wordlist) for _ in range(5)))
