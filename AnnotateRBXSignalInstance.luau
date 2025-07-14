
--!strict

local RBXSignalInstanceAnnotate = table.freeze({})

export type __ConnectWithPlayer<FiredParameter...> = {
	Connect: (self: __ConnectWithPlayer<FiredParameter...>, (player: Player, FiredParameter...) -> ()) -> RBXScriptConnection,
	Once: (self: __ConnectWithPlayer<FiredParameter...>, (player: Player, FiredParameter...) -> ()) -> RBXScriptConnection,
	Wait: (self: __ConnectWithPlayer<FiredParameter...>) -> (Player, FiredParameter...),
}

export type __ConnectSansPlayer<FiredParameter...> = {
	Connect: (self: __ConnectSansPlayer<FiredParameter...>, (FiredParameter...) -> ()) -> RBXScriptConnection,
	Once: (self: __ConnectSansPlayer<FiredParameter...>, (FiredParameter...) -> ()) -> RBXScriptConnection,
	Wait: (self: __ConnectSansPlayer<FiredParameter...>) -> (FiredParameter...),
}

export type AnnotateRemoteEvent<ToClient..., ToServer...> = {
	FireAllClients: (self: AnnotateRemoteEvent<ToClient..., ToServer...>, ToClient...) -> (),
	FireClient: (self: AnnotateRemoteEvent<ToClient..., ToServer...>, player: Player, ToClient...) -> (),
	FireServer: (self: AnnotateRemoteEvent<ToClient..., ToServer...>, ToServer...) -> (),
	OnServerEvent: __ConnectWithPlayer<ToServer...>,
	OnClientEvent: __ConnectSansPlayer<ToClient...>,
}

export type AnnotateRemoteFunction<ToClient..., FromClient..., ToServer..., FromServer...> = {
	InvokeClient: (self: AnnotateRemoteFunction<ToClient..., FromClient..., ToServer..., FromServer...>, player: Player, ToClient...) -> (FromClient...),
	InvokeServer: (self: AnnotateRemoteFunction<ToClient..., FromClient..., ToServer..., FromServer...>, ToServer...) -> (FromServer...),
	OnClientInvoke: (ToClient...) -> (FromClient...),
	OnServerInvoke: (player: Player, ToServer...) -> (FromServer...),
}

export type AnnotateBindableEvent<FiredParameter...> = {
	Fire: (self: AnnotateBindableEvent<FiredParameter...>, FiredParameter...) -> (),
	Event: __ConnectSansPlayer<FiredParameter...>,
}

export type AnnotateBindableFunction<Parameter..., Return...> = {
	Invoke: (self: AnnotateBindableFunction<Parameter..., Return...>, Parameter...) -> (Return...),
	OnInvoke: (Parameter...) -> (Return...),
}

return RBXSignalInstanceAnnotate
