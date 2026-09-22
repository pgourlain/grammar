-module(fun_expression).

-type zero_arity_fun() :: fun().
-type unary_fun() :: fun((term()) -> ok).

-spec a() -> fun(() -> integer()).
a() -> fun () -> 123 end.

b() -> fun() -> ok end.

c(AllGens) ->
    GetNextIndex = fun NextIndex () ->
        case get(k) of
            undefined -> NextIndex();
            N -> N
        end
    end,
    D = fun Loop(0) -> done; Loop(N) -> Loop(N - 1) end,
    {GetNextIndex, D, lists:nth(1, AllGens)}.

e() ->
    fun
        Loop(0) -> done;
        Loop(N) -> Loop(N - 1)
    end.

f(L) ->
    lists:map(fun plus_one/1, L),
    lists:map(fun ?MODULE:plus_one/1, L),
    lists:map(fun erlang:abs/1, L).

-spec d(integer()) -> integer().
d(X) -> X.
