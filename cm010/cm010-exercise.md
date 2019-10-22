---
title: "cm010 Exercises: Tibble Joins"
author: Erika Luna
output: 
  html_document:
    keep_md: true
    theme: paper
---

## Requirements

You will need Joey's `singer` R package for this exercise. And to install that, you'll need to install `devtools`. Running this code in your console should do the trick:

```
install.packages("devtools")
devtools::install_github("JoeyBernhardt/singer")
```

Load required packages:


```
## Warning: package 'ggplot2' was built under R version 3.5.2
```

<!---The following chunk allows errors when knitting--->




## Exercise 1: `singer`

The package `singer` comes with two smallish data frames about songs. Let's take a look at them (after minor modifications by renaming and shuffling):


```r
(time <- as_tibble(songs) %>% 
   rename(song = title))
```

```
## Error in as_tibble(songs): could not find function "as_tibble"
```


```r
(album <- as_tibble(locations) %>% 
   select(title, everything()) %>% 
   rename(album = release,
          song  = title))
```

```
## Error in as_tibble(locations): could not find function "as_tibble"
```


1. We really care about the songs in `time`. But, which of those songs do we know its corresponding album?


```r
time %>% 
  semi_join(album, by = c("song", "artist_name"))
```

```
## Error in semi_join(., album, by = c("song", "artist_name")): could not find function "semi_join"
```

```r
time %>% 
  inner_join(album, by = c("song", "artist_name"))
```

```
## Error in inner_join(., album, by = c("song", "artist_name")): could not find function "inner_join"
```

2. Go ahead and add the corresponding albums to the `time` tibble, being sure to preserve rows even if album info is not readily available.


```r
time %>% 
  left_join(album, by = c("song", "artist_name"))
```

```
## Error in left_join(., album, by = c("song", "artist_name")): could not find function "left_join"
```

3. Which songs do we have "year", but not album info?


```r
time %>% 
  semi_join(album, by = "song")
```

```
## Error in semi_join(., album, by = "song"): could not find function "semi_join"
```

4. Which artists are in `time`, but not in `album`?


```r
time %>% 
  anti_join(album, by = "artist_name")
```

```
## Error in anti_join(., album, by = "artist_name"): could not find function "anti_join"
```


5. You've come across these two tibbles, and just wish all the info was available in one tibble. What would you do?


```r
time %>% 
  full_join(album, by = c("song", "artist_name"))
```

```
## Error in full_join(., album, by = c("song", "artist_name")): could not find function "full_join"
```


## Exercise 2: LOTR

Load in the three Lord of the Rings tibbles that we saw last time:


```r
fell <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Fellowship_Of_The_Ring.csv")
```

```
## Error in read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Fellowship_Of_The_Ring.csv"): could not find function "read_csv"
```

```r
ttow <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Two_Towers.csv")
```

```
## Error in read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Two_Towers.csv"): could not find function "read_csv"
```

```r
retk <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Return_Of_The_King.csv")
```

```
## Error in read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Return_Of_The_King.csv"): could not find function "read_csv"
```

1. Combine these into a single tibble.


```r
bind_rows(fell, ttow, retk)
```

```
## Error in bind_rows(fell, ttow, retk): could not find function "bind_rows"
```

2. Which races are present in "The Fellowship of the Ring" (`fell`), but not in any of the other ones?


```r
fell %>% 
  anti_join(ttow, by = "Race") %>% 
  anti_join(retk, by = "Race")
```

```
## Error in eval(lhs, parent, parent): object 'fell' not found
```



## Exercise 3: Set Operations

Let's use three set functions: `intersect`, `union` and `setdiff`. We'll work with two toy tibbles named `y` and `z`, similar to Data Wrangling Cheatsheet


```r
(y <-  tibble(x1 = LETTERS[1:3], x2 = 1:3))
```

```
## Error in tibble(x1 = LETTERS[1:3], x2 = 1:3): could not find function "tibble"
```


```r
(z <- tibble(x1 = c("B", "C", "D"), x2 = 2:4))
```

```
## Error in tibble(x1 = c("B", "C", "D"), x2 = 2:4): could not find function "tibble"
```

1. Rows that appear in both `y` and `z`


```r
intersect(y, z)
```

```
## Error in as.vector(y): object 'z' not found
```

```r
#interjoin(y, z)
```

2. You collected the data in `y` on Day 1, and `z` in Day 2. Make a data set to reflect that.


```r
bind_rows(
  mutate(y, day = "Day 1"),
  mutate(z, day = "Day 2")
)
```

```
## Error in bind_rows(mutate(y, day = "Day 1"), mutate(z, day = "Day 2")): could not find function "bind_rows"
```

3. The rows contained in `z` are bad! Remove those rows from `y`.


```r
setdiff(y, z)
```

```
## Error in as.vector(x): object 'y' not found
```

```r
anti_join(y, z)
```

```
## Error in anti_join(y, z): could not find function "anti_join"
```
