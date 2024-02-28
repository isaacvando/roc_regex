app "regex"
    packages {
        cli: "https://github.com/roc-lang/basic-cli/releases/download/0.8.1/x8URkvfyi9I0QhmVG98roKBUs_AZRkLFwFJVJ3942YA.tar.br",
        regex: "../package/main.roc",
    }
    imports [
        cli.Stderr,
        cli.Stdout,
        cli.Task.{ Task },
        regex.Regex,
    ]
    provides [main] to cli

# main : Task {} []
main =
    {} <- Stdout.line "Start." |> Task.await
    {} <- Stdout.line "-----------" |> Task.await
    _ <- Task.await task0
    _ <- Stdout.line "-----------" |> Task.await
    _ <- Task.await task1
    _ <- Stdout.line "-----------" |> Task.await
    {} <- Task.await task2
    {} <- Stdout.line "-----------" |> Task.await
    {} <- Task.await task3
    {} <- Stdout.line "-----------" |> Task.await
    {} <- Task.await task4
    {} <- Stdout.line "-----------" |> Task.await
    {} <- Task.await task5
    {} <- Stdout.line "-----------" |> Task.await
    {} <- Task.await task6
    {} <- Stdout.line "-----------" |> Task.await
    {} <- Task.await task7
    {} <- Stdout.line "-----------" |> Task.await
    Stdout.line "Done."

task0 : Task {} []
task0 =
    regex = ""
    {} <- Stdout.line "Regex: '$(regex)'" |> Task.await
    when Regex.fromStr regex is
        Ok regex1 ->
            {} <- Task.await
                    (
                        if Regex.matches regex1 "" then
                            Stdout.line "Matched ''"
                        else
                            Stdout.line "Didn't match '', but it should have"
                    )
            {} <- Task.await
                    (
                        if Regex.matches regex1 "a" then
                            Stdout.line "Matched 'a', but it shouldn't have"
                        else
                            Stdout.line "Didn't match 'a'"
                    )

            Task.ok {}

        Err err -> handleRegexParseError err

task1 : Task {} *
task1 =
    regex = "abc"
    {} <- Stdout.line "Regex: '$(regex)'" |> Task.await
    when Regex.fromStr regex is
        Ok regex1 ->
            {} <- Task.await
                    (
                        if Regex.matches regex1 "abc" then
                            Stdout.line "Matched 'abc'"
                        else
                            Stdout.line "Didn't match 'abc', but it should have"
                    )
            {} <- Task.await
                    (
                        if Regex.matches regex1 "abd" then
                            Stdout.line "Matched 'abd', but it shouldn't have"
                        else
                            Stdout.line "Didn't match 'abd'"
                    )

            Task.ok {}

        Err err -> handleRegexParseError err

task2 : Task {} *
task2 =
    regex = "a*****"
    {} <- Stdout.line "Regex: '$(regex)'" |> Task.await
    when Regex.fromStr regex is
        Ok regex1 ->
            {} <- Task.await
                    (
                        if Regex.matches regex1 "" then
                            Stdout.line "Matched ''"
                        else
                            Stdout.line "Didn't match '', but it should have"
                    )
            {} <- Task.await
                    (
                        if Regex.matches regex1 "a" then
                            Stdout.line "Matched 'a'"
                        else
                            Stdout.line "Didn't match 'a', but it should have"
                    )
            {} <- Task.await
                    (
                        if Regex.matches regex1 "aaaaaa" then
                            Stdout.line "Matched 'aaaaaa'"
                        else
                            Stdout.line "Didn't match 'aaaaaa', but it should have"
                    )
            {} <- Task.await
                    (
                        if Regex.matches regex1 "b" then
                            Stdout.line "Matched 'b', but it shouldn't have"
                        else
                            Stdout.line "Didn't match 'b'"
                    )
            {} <- Task.await
                    (
                        if Regex.matches regex1 "aaaaab" then
                            Stdout.line "Matched 'aaaaab', but it shouldn't have"
                        else
                            Stdout.line "Didn't match 'aaaaab'"
                    )
            Task.ok {}

        Err err -> handleRegexParseError err

task3 : Task {} *
task3 =
    regex = "a|b"
    {} <- Stdout.line "Regex: '$(regex)'" |> Task.await
    when Regex.fromStr regex is
        Ok regex1 ->
            {} <- Task.await
                    (
                        if Regex.matches regex1 "a" then
                            Stdout.line "Matched 'a'"
                        else
                            Stdout.line "Didn't match 'a', but it should have"
                    )
            {} <- Task.await
                    (
                        if Regex.matches regex1 "b" then
                            Stdout.line "Matched 'b'"
                        else
                            Stdout.line "Didn't match 'b', but it should have"
                    )
            {} <- Task.await
                    (
                        if Regex.matches regex1 "c" then
                            Stdout.line "Matched 'c', but it shouldn't have"
                        else
                            Stdout.line "Didn't match 'c'"
                    )
            {} <- Task.await
                    (
                        if Regex.matches regex1 "ab" then
                            Stdout.line "Matched 'ab', but it shouldn't have"
                        else
                            Stdout.line "Didn't match 'ab'"
                    )
            Task.ok {}

        Err err -> handleRegexParseError err

task4 : Task {} *
task4 =
    regex = "a+++++"
    {} <- Stdout.line "Regex: '\(regex)'" |> Task.await
    when Regex.fromStr regex is
        Ok regex1 ->
            {} <- Task.await
                    (
                        if Regex.matches regex1 "a" then
                            Stdout.line "Matched 'a'"
                        else
                            Stdout.line "Didn't match 'a', but it should have"
                    )
            {} <- Task.await
                    (
                        if Regex.matches regex1 "aaaaa" then
                            Stdout.line "Matched 'aaaaa'"
                        else
                            Stdout.line "Didn't match 'aaaaa', but it should have"
                    )
            {} <- Task.await
                    (
                        if Regex.matches regex1 "" then
                            Stdout.line "Matched '', but it shouldn't have"
                        else
                            Stdout.line "Didn't match ''"
                    )
            {} <- Task.await
                    (
                        if Regex.matches regex1 "b" then
                            Stdout.line "Matched 'b', but it shouldn't have"
                        else
                            Stdout.line "Didn't match 'b'"
                    )
            Task.ok {}

        Err err -> handleRegexParseError err

task5 : Task {} *
task5 =
    regex = "a?????"
    {} <- Stdout.line "Regex: '\(regex)'" |> Task.await
    when Regex.fromStr regex is
        Ok regex1 ->
            {} <- Task.await
                    (
                        if Regex.matches regex1 "a" then
                            Stdout.line "Matched 'a'"
                        else
                            Stdout.line "Didn't match 'a', but it should have"
                    )
            {} <- Task.await
                    (
                        if Regex.matches regex1 "" then
                            Stdout.line "Matched ''"
                        else
                            Stdout.line "Didn't match '', but it should have"
                    )
            {} <- Task.await
                    (
                        if Regex.matches regex1 "aa" then
                            Stdout.line "Matched 'aa', but it shouldn't have"
                        else
                            Stdout.line "Didn't match 'aa'"
                    )
            {} <- Task.await
                    (
                        if Regex.matches regex1 "b" then
                            Stdout.line "Matched 'b', but it shouldn't have"
                        else
                            Stdout.line "Didn't match 'b'"
                    )
            Task.ok {}

        Err err -> handleRegexParseError err

task6 : Task {} *
task6 =
    regex = "[abc]"
    {} <- Stdout.line "Regex: '\(regex)'" |> Task.await
    when Regex.fromStr regex is
        Ok regex1 ->
            {} <- Task.await
                    (
                        if Regex.matches regex1 "a" then
                            Stdout.line "Matched 'a'"
                        else
                            Stdout.line "Didn't match 'a', but it should have"
                    )
            {} <- Task.await
                    (
                        if Regex.matches regex1 "b" then
                            Stdout.line "Matched 'b'"
                        else
                            Stdout.line "Didn't match 'b', but it should have"
                    )
            {} <- Task.await
                    (
                        if Regex.matches regex1 "c" then
                            Stdout.line "Matched 'c'"
                        else
                            Stdout.line "Didn't match 'c', but it should have"
                    )
            {} <- Task.await
                    (
                        if Regex.matches regex1 "" then
                            Stdout.line "Matched '', but it shouldn't have"
                        else
                            Stdout.line "Didn't match ''"
                    )
            {} <- Task.await
                    (
                        if Regex.matches regex1 "ab" then
                            Stdout.line "Matched 'ab', but it shouldn't have"
                        else
                            Stdout.line "Didn't match 'ab'"
                    )
            {} <- Task.await
                    (
                        if Regex.matches regex1 "aa" then
                            Stdout.line "Matched 'aa', but it shouldn't have"
                        else
                            Stdout.line "Didn't match 'aa'"
                    )
            Task.ok {}

        Err err -> handleRegexParseError err

task7 : Task {} *
task7 =
    regex = "[\\[\\]]"
    {} <- Stdout.line "Regex: '\(regex)'" |> Task.await
    when Regex.fromStr regex is
        Ok regex1 ->
            {} <- Task.await
                    (
                        if Regex.matches regex1 "[" then
                            Stdout.line "Matched '['"
                        else
                            Stdout.line "Didn't match '[', but it should have"
                    )
            {} <- Task.await
                    (
                        if Regex.matches regex1 "]" then
                            Stdout.line "Matched ']'"
                        else
                            Stdout.line "Didn't match ']', but it should have"
                    )
            {} <- Task.await
                    (
                        if Regex.matches regex1 "" then
                            Stdout.line "Matched '', but it shouldn't have"
                        else
                            Stdout.line "Didn't match ''"
                    )
            {} <- Task.await
                    (
                        if Regex.matches regex1 "[]" then
                            Stdout.line "Matched '[]', but it shouldn't have"
                        else
                            Stdout.line "Didn't match '[]'"
                    )
            Task.ok {}

        Err err -> handleRegexParseError err

handleRegexParseError : Regex.ParseError -> Task {} *
handleRegexParseError = \err ->
    when err is
        Expected want Got got AtIndex index ->
            {} <- Stderr.line "Expected $(byteToStr want), got $(byteToStr got) at index $(Num.toStr index)" |> Task.await
            Stderr.line "Error."

        ExpectedEnd Got got AtIndex index ->
            {} <- Stderr.line "Expected end of string, got $(byteToStr got) at index $(Num.toStr index)" |> Task.await
            Stderr.line "Error."

        EscapeAtEnd ->
            msg = "Escape at end of string"
            {} <- Stderr.line msg |> Task.await
            Stderr.line "Error."

        UnterminatedBracketGroup AtIndex index ->
            indexStr = Num.toStr index
            msg = "Bracket group not terminated, started at index $(indexStr)"
            {} <- Stderr.line msg |> Task.await
            Stderr.line "Error."

byteToStr : U8 -> Str
byteToStr = \byte ->
    when Str.fromUtf8 [byte] is
        Err _ -> crash "Error converting $(Num.toStr byte) to a Str"
        Ok str -> str
