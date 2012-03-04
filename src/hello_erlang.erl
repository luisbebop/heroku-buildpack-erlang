% -module(hello_erlang).
% -export([loop/1, start_link/0]).
% 
% start_link() ->
%     Port = list_to_integer(os:getenv("PORT")),
%     io:format("start web server on port ~p~n", [Port]),
%     Options = [{ip, "0.0.0.0"},
%                {port, Port},
%                {backlog, 1024},
%                {loop, {?MODULE, loop}}],
%     mochiweb_http:start(Options).
% 
% loop(Req) ->
%     io:format("Serve request for ~p ~p~n", [Req:get(method), Req:get(path)]),
%     Req:respond({200, [], <<"Hello world from Erlang, simple test ! XD\n">>}).

-module(hello_erlang).
-compile(export_all).

start_link() ->
	Port = list_to_integer(os:getenv("PORT")),
	Pid = spawn_link(fun() ->
		{ok, Listen} = gen_tcp:listen(Port, [binary, {active, false}]),
		spawn(fun() -> acceptor(Listen) end),
		timer:sleep(infinity)
	end),
	{ok, Pid}.

acceptor(ListenSocket) ->
	{ok, Socket} = gen_tcp:accept(ListenSocket),
	spawn(fun() -> acceptor(ListenSocket) end),
	handle(Socket).

%% Echoing back whatever was obtained
handle(Socket) ->
	inet:setopts(Socket, [{active, once}]),
	receive
		{tcp, Socket, <<"quit", _/binary>>} ->
			gen_tcp:close(Socket);
		{tcp, Socket, Msg} ->
			gen_tcp:send(Socket, Msg),
			handle(Socket)
	end.
