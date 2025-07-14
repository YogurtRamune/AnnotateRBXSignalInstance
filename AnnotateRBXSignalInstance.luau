
--!strict

local RBXSignalInstanceAnnotate = table.freeze({})

type ConnectAtServer<FiredParameter...> = {
	Connect: (self: ConnectAtServer<FiredParameter...>, player: Player, FiredParameter...) -> (),
	Once: (self: ConnectAtServer<FiredParameter...>, player: Player, FiredParameter...) -> (),
	Wait: (self: ConnectAtServer<FiredParameter...>) -> (Player, FiredParameter...),
}

type ConnectAtClient<FiredParameter...> = {
	Connect: (self: ConnectAtClient<FiredParameter...>, FiredParameter...) -> (),
	Once: (self: ConnectAtClient<FiredParameter...>, FiredParameter...) -> (),
	Wait: (self: ConnectAtClient<FiredParameter...>) -> (FiredParameter...),
}

export type AnnotateRemoteEvent<ToClient..., ToServer...> = {
	FireAllClients: (self: AnnotateRemoteEvent<ToClient..., ToServer...>, ToClient...) -> (),
	FireClient: (self: AnnotateRemoteEvent<ToClient..., ToServer...>, player: Player, ToClient...) -> (),
	FireServer: (self: AnnotateRemoteEvent<ToClient..., ToServer...>, ToServer...) -> (),
	OnServerEvent: ConnectAtServer<ToServer...>,
	OnClientEvent: ConnectAtClient<ToClient...>,
} & RemoteEvent

export type AnnotateRemoteFunction<ToClient..., FromClient..., ToServer..., FromServer...> = {
	InvokeClient: (self: AnnotateRemoteFunction<ToClient..., FromClient..., ToServer..., FromServer...>, player: Player, ToClient...) -> (FromClient...),
	InvokeServer: (self: AnnotateRemoteFunction<ToClient..., FromClient..., ToServer..., FromServer...>, ToServer...) -> (FromServer...),
	OnClientInvoke: (player: Player, ToClient...) -> (FromClient...),
	OnServerInvoke: (ToServer...) -> (FromServer...),
} & RemoteFunction

export type AnnotateBindableEvent<FiredParameter...> = {
	Fire: (self: AnnotateBindableEvent<FiredParameter...>, FiredParameter...) -> (),
	Event: ConnectAtClient<FiredParameter...>,
} & BindableEvent

export type AnnotateBindableFunction<Parameter..., Return...> = {
	Invoke: (self: AnnotateBindableFunction<Parameter..., Return...>, Parameter...) -> (Return...),
	OnInvoke: (Parameter...) -> (Return...),
} & BindableFunction

return RBXSignalInstanceAnnotate
