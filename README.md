# DEPRECATED
This repository is part of the initial [multiserver](https://github.com/HimbeerserverDE/multiserver) project and should not be used.

There is no successor, however [mt-multiserver-proxy](https://github.com/HimbeerserverDE/mt-multiserver-proxy) supports Go plugins
that can provide an interface to it to internal servers (e.g. using HTTP APIs).
Mod channel support between `mt-multiserver-proxy` and the Minetest servers
or an official implementation to replace this repository may be added in the future (contributions are welcome).

# multiserver API
A multiserver RPC API for Minetest Servers
## multiserver project
This project is intended for use in combination with [multiserver](https://github.com/HimbeerserverDE/multiserver).
## Usage
Install this mod on your minetest servers and enable mod channels on
each server. You can now use the API in your own mods.
## Methods
> `multiserver.alert(msg)`
```
msg: Message to send
Description: Sends msg to all clients that are connected to the proxy
```
> `multiserver.get_default_server(callback)`
```
callback: Callback function (params: default_server)
Description: Gets the default server and passes it to the callback
function
```
> `multiserver.get_player_count(callback)`
```
callback: Callback function (params: player_count)
Description: Gets the count of players that are connected to the proxy
and passes it to the callback function
```
> `multiserver.is_online(name, callback)`
```
name: Player name to use for check
callback: Callback function (params: is_online)
Description: Reports to the callback function if a player is online
```
> `multiserver.check_privs(name, privs, callback)`
```
name: Player name to use for check
privs: Privileges the player has to have
callback: Callback function (params: has_privs)
Description: Reports to the callback function if a player has the
specified privileges
```
> `multiserver.get_privs(name, callback)`
```
name: Player name to use for check
callback: Callback function (params: privs)
Description: Gets the proxy-level privileges of a player and passes it
to the callback function
```
> `multiserver.set_privs(name, privs)`
```
name: Player name to set privileges for
Description: Sets the proxy-level privileges of a player
```
> `multiserver.get_server_name(name, callback)`
```
name: Player name to perform lookup on
callback: Callback function (params: server_name)
Description: Gets the name of the server a player is currently
connected to and passes it to the callback function
```
> `multiserver.redirect(name, tosrv)`
```
name: Name of player to redirect
tosrv: Name of server to connect player to
Description: Redirects a player to the specified server
```
> `multiserver.get_address(name, callback)`
```
name: Player name to perform lookup on
callback: Callback function (params: address)
Description: Gets the address of a player (format: IP_ADDRESS:PORT) and
passes it to the callback function; This is needed because minetest
servers only see the address of the proxy
```
> `multiserver.is_banned(target, callback)`
```
target: IP address to perform check on
callback: Callback function (params: is_banned)
Description: Reports to the callback function if a player is banned
```
> `multiserver.ban(target)`
```
target: Name or IP address to ban
Description: Bans a player, can only use name if the player is online
```
> `multiserver.unban(target)`
```
target: Name or IP address to unban
Description: Unbans a player
```
> `multiserver.get_servers(callback)`
```
callback: Callback function (params: srvs)
Description: Returns an indexed table containing all server names
to the callback function
```
> `multiserver.broadcast_msg(msg)`
```
msg: Message to send
Description: Sends a message to all other minetest servers
```
> `multiserver.send_msg(tosrv, msg)`
```
tosrv: Server to send the message to
msg: Message to send
Description: Sends a message to another minetest server
```
> `multiserver.register_on_joinplayer(callback)`
```
callback: Callback function (params: name, srv)
Description: Registers a callback for global join events
```
> `multiserver.register_on_leaveplayer(callback)`
```
callback: Callback function (params: name)
Description: Registers a callback for global leave events
```
> `multiserver.register_on_redirect_done(callback)`
```
callback: Callback function (params: name, newsrv, success)
Description: Registers a callback function for global redirect events;
newsrv is the server the client was being redirected to, success
indicates whether the redirection was successful
```
> `multiserver.register_on_msg(callback)`
```
callback: Callback function (params: msg, broadcast)
Description: Registers a callback function for messages sent by other
minetest servers, broadcast is true if all servers were sent
the message
```
