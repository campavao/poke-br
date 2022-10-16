RUBY_VERSION =~ /(\d+.\d+)/
version = $1

require 'socket'
require "./bin/#{version}/mysql_api"
require './server.rb'
require './mysql.rb'
require './client.rb'
require './clienthandler.rb'
require './send.rb'


IP = '25.5.154.43'
PORT = 5000
SQLHOST = "127.0.0.1"
SQLUSR = "root"
SQLPASS = "Ihave5dogs!" #EDIT
SQLDBASE = "peo"
VERSION = 1
MAXIMUM_CONNECTIONS = 20
TRADETIMEOUT = 30
BATTLETIMEOUT = 30 



	def main
		while true
		Client.reset
		Send.reset
		$clients = ClientHandler.new
		@server = Server.new
		@server.run
		end
	end
	
#begin
	print "Starting Server on #{IP}:#{PORT}\n"
	main
#rescue Interrupt
#end