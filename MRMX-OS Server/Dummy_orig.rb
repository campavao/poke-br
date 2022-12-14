#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# RPG Maker XP Online System (RMX-OS)
#------------------------------------------------------------------------------
# Author: Blizzard
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
#   
#  This work is protected by the following license:
# #----------------------------------------------------------------------------
# #  
# #  Creative Commons - Attribution-NonCommercial-ShareAlike 3.0 Unported
# #  ( http://creativecommons.org/licenses/by-nc-sa/3.0/ )
# #  
# #  You are free:
# #  
# #  to Share - to copy, distribute and transmit the work
# #  to Remix - to adapt the work
# #  
# #  Under the following conditions:
# #  
# #  Attribution. You must attribute the work in the manner specified by the
# #  author or licensor (but not in any way that suggests that they endorse you
# #  or your use of the work).
# #  
# #  Noncommercial. You may not use this work for commercial purposes.
# #  
# #  Share alike. If you alter, transform, or build upon this work, you may
# #  distribute the resulting work only under the same or similar license to
# #  this one.
# #  
# #  - For any reuse or distribution, you must make clear to others the license
# #    terms of this work. The best way to do this is with a link to this web
# #    page.
# #  
# #  - Any of the above conditions can be waived if you get permission from the
# #    copyright holder.
# #  
# #  - Nothing in this license impairs or restricts the author's moral rights.
# #  
# #----------------------------------------------------------------------------
# 
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# Information:
# 
#   There is a documentation for this system. Read it in order to learn how to
#   use this system. A server also comes with this system.
# 
# 
# If you find any bugs, please report them here:
# http://forum.chaos-project.com
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#==============================================================================
# module RMXOS
#------------------------------------------------------------------------------
# Main module for all RMX-OS classes and procedures.
#==============================================================================

module RMXOS
  
  # RMX-OS version, should be changed only when server was changed to ensure
  # compatibility between server and client.
  VERSION = 2.0
  
  # these values MUST correspond with the values specified in the server
  GROUP_ADMIN = 10
  GROUP_2NDADMIN = 9
  GROUP_MOD = 8
  GROUP_PLAYER = 0
  
  # special permission group command sets
  COMMANDS = {}
  COMMANDS[GROUP_ADMIN] = ['admin']
  COMMANDS[GROUP_2NDADMIN] = ['kickall', 'mod', 'revoke', 'pass', 'gpass',
      'eval', 'geval', 'seval', 'sql']
  COMMANDS[GROUP_MOD] = ['kick', 'ban', 'unban', 'global']
  
  # login messages
  LOGIN_SUCCESS = 11
  LOGIN_NOUSER = 12
  LOGIN_NOPASS = 13
  LOGIN_BANNED = 14
  # register messages
  REGISTER_SUCCESS = 21
  REGISTER_EXIST = 22
  REGISTER_BANNED = 23
  # connection messages
  CONNECTION_SUCCESS = 31
  CONNECTION_DENIED = 32
  CONNECTION_CLIENT_VERSION = 33
  CONNECTION_GAME_VERSION = 34
  # loading messages
  LOADING_UPDATE = 41
  LOADING_END = 42
  
  #============================================================================
  # module RMXOS::Data
  #----------------------------------------------------------------------------
  # Contains constants for all secondary configurable aspects in RMX-OS.
  #============================================================================
  
  module Data
    
    #::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    # Text constants
    #::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    AvailableCommands     = 'Available Commands:'
    Banned                = 'You are banned from this server.'
    BuddyAlreadyInList    = 'Player already in buddy list.'
    BuddyNotInList        = 'Player not in buddy list.'
    BuddySelfError        = 'You cannot add yourself to your buddy list.'
    Cancel                = 'Cancel'
    CancelingTradeAbort   = 'Canceling... Press CANCEL again to abort trade.'
    Connecting            = 'Connecting...'
    Disconnected          = 'You have been disconnected.'
    EnterUserPass         = 'Enter username and password.'
    ExecutingTrade        = 'Executing trade...'
    Exit                  = 'Exit'
    HelpText              = 'Use /help COMMAND for detailed explanations of a specific command.'
    GuildAlready          = 'You are already in a guild.'
    GuildAlreadyLeader    = 'You are already the guild leader.'
    GuildAlreadyMember    = 'Player is already a member of your guild.'
    GuildCannotLeave      = 'You are the guild leader. You cannot leave the guild unless you transfer leadership to another guild member first.'
    GuildNone             = 'You are not in a guild.'
    GuildNotLeader        = 'You are not the leader of your guild.'
    GuildNotMember        = 'Player is not a member of your guild.'
    GuildNoTransfer       = 'You have not been asked to take over leadership of your guild.'
    GuildReserved         = 'You cannot use this name for a guild.'
    GuildTooLong          = 'Guild name is too long.'
    Kicked                = 'You have been kicked.'
    LoadingMessage        = 'Loading...'
    LoggingIn             = 'Logging in...'
    LoggedIn              = 'Logged in.'
    Login                 = 'Login'
    LoginTimedOut         = 'Login timed out.'
    NoResponse            = 'Server did not respond.'
    NoPMsRetrieved        = 'No PMs were retrieved.'
    NoUsername            = 'Username does not exist.'
    OnlineTag             = ' (ON)'
    PassChar              = '*'
    PassTooShort          = 'Password is too short.'
    PassNotRepeated       = 'The confirmation password does not match!'
    Password              = 'Password:'
    Register              = 'Register'
    Registering           = 'Registering...'
    RegisterUserPass      = 'Register username and password.'
    Repeat                = 'Repeat:'
    SelectServer          = 'Select a server. Press F5 to refresh the list.'
    ServerOffline         = 'Offline'
    ServerOnline          = 'Online'
    ServerTesting         = 'Testing...'
    Submit                = 'Submit'
    TradeNoPlayer         = 'Your trade partner is gone.'
    TradeSelfError        = 'You cannot trade with yourself.'
    BattleSelfError       = 'You cannot battle yourself.'
    Username              = 'Username:'
    UserRegistered        = 'Username registered!'
    UserRegisteredAlready = 'Username already exists!'
    UserReserved          = 'You cannot use this username.'
    UserTooShort          = 'Username is too short.'
    Version               = 'Version'
    WhisperNoLastName     = 'You first have to use /w once before using /wr.'
    WrongPassword         = 'Wrong password.'
    #::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    # Special constants
    #::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    BuddyList        = 'Your buddies: BUDDIES'
    GuildInfo        = 'Guild Name: GUILD; Leader: LEADER; Members: MEMBERS'
    PMTooLong        = 'PM is COUNT characters too long.'
    PMInfo           = 'ID:NUMBER by \'SENDER\' @ TIME'
    PMText           = '\'SENDER\' @ TIME: MESSAGE'
    TradeWait        = 'Waiting for \'PLAYER\'...'
    ReceivingMessage = 'Receiving: NOW / MAX'
    #::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    # Numeric constants
    #::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    CursorBlinkPeriod = 20
    ChatLogSize = 100
    ChatFontHeight = 16
    ChatLineEntries = 50
    ChatBubbleEntries = 8
    ChatBubbleMaxWidth = 192
    BubbleDisplayTime = 5
    #::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    # Array constants
    #::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    NoTradeItems = [23, 24, 25, 26, 27, 28, 29, 30, 31, 32]
    TradeCommands = ['Select yours', 'View other', 'Confirm', 'Abort']
    #::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    # Chatbox color constants
    #::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    ColorAction        = Color.new(0xBF, 0xFF, 0xBF)
    ColorError         = Color.new(0xFF, 0xBF, 0x3F)
    ColorGlobal        = Color.new(0x7F, 0xBF, 0xFF)
    ColorGuild         = Color.new(0x1F, 0xFF, 0x7F)
    ColorInfo          = Color.new(0xBF, 0xBF, 0xFF)
    ColorOk            = Color.new(0x1F, 0xFF, 0x1F)
    ColorNo            = Color.new(0x3F, 0x7F, 0xFF)
    ColorNormal        = Color.new(0xFF, 0xFF, 0xFF)
    ColorServerError   = Color.new(0xFF, 0xFF, 0x1F)
    ColorServerOffline = Color.new(0xFF, 0x1F, 0x1F)
    ColorServerOnline  = Color.new(0x1F, 0xFF, 0x1F)
    ColorWhisper       = Color.new(0xFF, 0xFF, 0x1F)
    #::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    # Other constants
    #::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    SCREEN_WIDTH = 640
    SCREEN_HEIGHT = 480
    COLORS = {}
    COLORS['self']         = Color.new(0, 255, 0)
    COLORS[GROUP_ADMIN]    = Color.new(64, 192, 255)
    COLORS[GROUP_2NDADMIN] = Color.new(128, 192, 255)
    COLORS[GROUP_MOD]      = Color.new(255, 255, 0)
    COLORS[GROUP_PLAYER]   = Color.new(255, 255, 255)
    COLORS['guild']        = Color.new(255, 192, 0)
    
  end
  
  #============================================================================
  # module RMXOS::Error
  #----------------------------------------------------------------------------
  # Contains constants and methods for RMX-OS specific errors.
  #============================================================================
  
  module Error
    
    # error message contants
    InvalidSyntax = 'Invalid Syntax!'
    # special error message contants
    Command           = 'Error! Command \'CMD\' not used correctly. ' + RMXOS::Data::HelpText
    CommandPermission = 'Error! You do not have permission to use command \'CMD\'. Use /cmd for a list of available commands to you. ' + RMXOS::Data::HelpText
    CommandNotExist   = 'Error! Command \'CMD\' does not exist. Use /cmd for a list of available commands to you. ' + RMXOS::Data::HelpText
    Save              = 'Error! Saving for class CLASS undefined!'
    ServerFull        = 'The server is full!'
    Version           = 'Client outdated: VERSION'
    GameVersion       = 'Game outdated: VERSION'
    
    #--------------------------------------------------------------------------
    # Gets the client version error message.
    # Returns: Client version error message.
    #--------------------------------------------------------------------------
    def self.get_client_version_error
      return Version.sub('VERSION') {$network.version.to_s}
    end
    #--------------------------------------------------------------------------
    # Gets the game version error message.
    # Returns: Game version error message.
    #--------------------------------------------------------------------------
    def self.get_game_version_error
      return GameVersion.sub('VERSION') {$network.game_version.to_s}
    end
    #--------------------------------------------------------------------------
    # Gets the save error message.
    #  object - any object that can't be saved
    # Returns: Save error message for the given class.
    #--------------------------------------------------------------------------
    def self.get_save_error(object)
      return Save.sub('CLASS') {object.class.name}
    end
    #--------------------------------------------------------------------------
    # Gets the chat command error message.
    #  command - the used command
    # Returns: Command error message for the given command.
    #--------------------------------------------------------------------------
    def self.get_command_error(command)
      return Command.sub('CMD') {command}
    end
    #--------------------------------------------------------------------------
    # Gets the chat command error message.
    #  command - the used command
    # Returns: Permission command error message for the given command.
    #--------------------------------------------------------------------------
    def self.get_permission_command_error(command)
      return CommandPermission.sub('CMD') {command}
    end
    #--------------------------------------------------------------------------
    # Gets the chat command error message.
    #  command - the used command
    # Returns: No command error message for the given command.
    #--------------------------------------------------------------------------
    def self.get_no_command_error(command)
      return CommandNotExist.sub('CMD') {command}
    end
            
  end
  
  #============================================================================
  # module RMXOS::Documentation
  #----------------------------------------------------------------------------
  # Contains data for in-game information how to use RMX-OS. This should not
  # be edited but only extended in case of adding new functionality (i.e.
  # additional chat commands).
  #============================================================================
  
  module Documentation
    
    # permission group names
    GROUP_NAMES = {}
    GROUP_NAMES[GROUP_ADMIN]    = 'Admin'
    GROUP_NAMES[GROUP_2NDADMIN] = 'Secondary Admin'
    GROUP_NAMES[GROUP_MOD]      = 'Moderator'
    
    PARAMETERS = {}
    # Admin commands
    PARAMETERS['admin']     = 'USERNAME'
    # Secondary Admin commands
    PARAMETERS['mod']       = 'USERNAME'
    PARAMETERS['revoke']    = 'USERNAME'
    PARAMETERS['kickall']   = 'none'
    PARAMETERS['pass']      = 'USERNAME NEWPASS'
    PARAMETERS['gpass']     = 'GUILDNAME NEWPASS'
    PARAMETERS['eval']      = 'SCRIPT'
    PARAMETERS['geval']     = 'SCRIPT'
    PARAMETERS['seval']     = 'SCRIPT'
    PARAMETERS['sql']       = 'SCRIPT'
    # Moderator commands
    PARAMETERS['kick']      = 'USERNAME'
    PARAMETERS['ban']       = 'USERNAME'
    PARAMETERS['unban']     = 'USERNAME'
    PARAMETERS['global']    = 'MESSAGE'
    # Normal commands
    PARAMETERS['w']         = 'USERNAME MESSAGE'
    PARAMETERS['wr']        = 'MESSAGE'
    PARAMETERS['me']        = 'MESSAGE'
    PARAMETERS['trade']     = 'USERNAME'
    PARAMETERS['battle']    = 'BATTLE'
    PARAMETERS['newpass']   = 'OLDPASS NEWPASS'
    PARAMETERS['y']         = 'REQUEST_ID'
    PARAMETERS['n']         = 'REQUEST_ID'
    PARAMETERS['req']       = 'none'
    PARAMETERS['cancel']    = 'REQUEST_ID'
    PARAMETERS['cmd']       = 'none'
    PARAMETERS['help']      = 'none|COMMAND'
    # Buddy List commands
    PARAMETERS['badd']      = 'USERNAME'
    PARAMETERS['bremove']   = 'USERNAME'
    PARAMETERS['bshow']     = 'none'
    # PM commands#
    PARAMETERS['pmsend']    = 'USERNAME MESSAGE'
    PARAMETERS['pmunread']  = 'none'
    PARAMETERS['pmall']     = 'none'
    PARAMETERS['pmopen']    = 'MESSAGE_ID'
    PARAMETERS['pmdelete']  = 'MESSAGE_ID'
    PARAMETERS['pmdelall']  = 'none'
    PARAMETERS['pmstatus']  = 'none'
    # Guild commands
    PARAMETERS['gcreate']   = 'GUILDNAME PASSWORD'
    PARAMETERS['gnewpass']  = 'OLDGUILDPASS NEWGUILDPASS'
    PARAMETERS['gdisband']  = 'GUILDPASS'
    PARAMETERS['gtransfer'] = 'NEWLEADER GUILDPASS'
    PARAMETERS['ginvite']   = 'USERNAME'
    PARAMETERS['gremove']   = 'USERNAME GUILDPASS'
    PARAMETERS['gleave']    = 'PASSWORD'
    PARAMETERS['gmsg']      = 'MESSAGE'
    PARAMETERS['ginfo']     = 'none'
    
    DESCRIPTIONS = {}
    # Admin commands
    DESCRIPTIONS['admin']     = 'Gives a player the permission group of a Secondary Admin.'
    # Secondary Admin commands
    DESCRIPTIONS['mod']       = 'Gives a player the permission group of a Moderator.'
    DESCRIPTIONS['revoke']    = 'Revokes all permissions from a player. This works only on players that have a lower permission group.'
    DESCRIPTIONS['kickall']   = 'Kicks all connected players with a lower permission group.'
    DESCRIPTIONS['pass']      = 'Changes the password of a player forcibly. This can be used to help players that have forgotten their password.'
    DESCRIPTIONS['gpass']     = 'Changes the password of a guild forcibly. This can be used to help players that have forgotten their guild\'s password.'
    DESCRIPTIONS['eval']      = 'Executes an RGSS script on your machine.'
    DESCRIPTIONS['geval']     = 'Executes an RGSS script on every connected player.'
    DESCRIPTIONS['seval']     = 'Executes an RGSS script on the server.'
    DESCRIPTIONS['sql']       = 'Executes an SQL command on the server.'
    # Moderator commands
    DESCRIPTIONS['kick']      = 'Kick a player. This works only on players that have a lower permission group.'
    DESCRIPTIONS['ban']       = 'Bans and kicks a player. This works only on players that have a lower permission group.'
    DESCRIPTIONS['unban']     = 'Unbans a player. This works only on players that have a lower permission group.'
    DESCRIPTIONS['global']    = 'Sends a global message to all currently connected players.'
    # Normal commands
    DESCRIPTIONS['w']         = 'Sends a whisper message to a player. Nobody else receives the message. The player does not have to be on the same map.'
    DESCRIPTIONS['wr']        = 'Sends a whisper message to the player lastly used with /w. See /w command for more information.'
    DESCRIPTIONS['me']        = 'Displays the message as action.'
    DESCRIPTIONS['trade']     = 'Sends a trade request to another player. Only one request can be sent at the time. Timeout for requests is 15 seconds.'
    DESCRIPTIONS['battle']    = 'Sends a battle request to another player. Only one request can be sent at the time. Timeout for requests is 15 seconds.'
    DESCRIPTIONS['newpass']   = 'Changes your password.'
    DESCRIPTIONS['y']         = 'Answers YES to the action request with the given ID.'
    DESCRIPTIONS['n']         = 'Answers NO to the action request with the given ID.'
    DESCRIPTIONS['req']       = 'Displays a list of currently active action requests.'
    DESCRIPTIONS['cancel']    = 'Cancels the action request with the given ID. Works only requests that have been sent by you.'
    DESCRIPTIONS['cmd']       = 'Lists all available chat commands depending on your permission group.'
    DESCRIPTIONS['help']      = 'Explains a command. If no command is specified, it lists all available chat commands depending on your permission group.'
    # Buddy List commands
    DESCRIPTIONS['badd']      = 'Requests to adds a user for the Buddy List.'
    DESCRIPTIONS['bremove']   = 'Removes a player from the Buddy List and removes you from the other player\'s buddy list.'
    DESCRIPTIONS['bshow']     = 'Displays all players in your Buddy List. Their online status is also displayed.'
    # PM commands
    DESCRIPTIONS['pmsend']    = 'Sends a message to a player in the Buddy List.'
    DESCRIPTIONS['pmunread']  = 'Gets a list of all unread messages.'
    DESCRIPTIONS['pmall']     = 'Gets a list of all messages.'
    DESCRIPTIONS['pmopen']    = 'Displays a specific message and marks it as read.'
    DESCRIPTIONS['pmdelete']  = 'Deletes a specific message.'
    DESCRIPTIONS['pmdelall']  = 'Deletes all messages in the inbox.'
    DESCRIPTIONS['pmstatus']  = 'Gets the number of PMs and the number of maximum PMs allowed in the inbox.'
    # Guild commands
    DESCRIPTIONS['gcreate']   = 'Creates a new guild with you as leader.'
    DESCRIPTIONS['gnewpass']  = 'Changes the password of your guild.'
    DESCRIPTIONS['gdisband']  = 'Disbands your guild.'
    DESCRIPTIONS['gtransfer'] = 'Transfers leadership of your guild to another player. The other player must be a member of your guild.'
    DESCRIPTIONS['ginvite']   = 'Invites a player into your guild.'
    DESCRIPTIONS['gremove']   = 'Removes a player from your guild.'
    DESCRIPTIONS['gleave']    = 'Leaves the current guild.'
    DESCRIPTIONS['gmsg']      = 'Sends a message to all guild members that are currently online.'
    DESCRIPTIONS['ginfo']     = 'Displays information about your guild.'
    
    # delete disabled commands
    RMXOS::Options::DISABLED_CHAT_COMMANDS.each {|command|
      PARAMETERS.delete(command)
      DESCRIPTIONS.delete(command)
    }
    #--------------------------------------------------------------------------
    # Gets the help text for a command.
    #  command - the command
    # Returns: Help text for the given command.
    #--------------------------------------------------------------------------
    def self.get_command_help(command)
      # get all available commands
      commands = self.get_command_list
      # command is valid
      if commands.include?(command)
        message = "'/#{command}'"
        message += " Parameters: #{PARAMETERS[command]};"
        message += " Description: #{DESCRIPTIONS[command]}"
        # add permission requirement message if necessary
        COMMANDS.each_key {|key|
          if COMMANDS[key].include?(command)
            message += " Requires minimum #{GROUP_NAMES[key]} permission group."
            break
          end
        }
        return message
      # no permission to access this information
      elsif DESCRIPTIONS.has_key?(command)
        return "You do not have permission to access the command '#{command}'."
      end
      # command does not exist
      return "Command '#{command}' does not exist."
    end
    #--------------------------------------------------------------------------
    # Gets a list of all available commands.
    # Returns: List of all available commands.
    #--------------------------------------------------------------------------
    def self.get_command_list
      # get all commands
      commands = DESCRIPTIONS.keys.sort
      # remove all commands that require a higher permission group
      COMMANDS.each_key {|group|
        commands -= COMMANDS[group] if group > $network.usergroup
      }
      return commands
    end
    
  end
  
  #============================================================================
  # RMXOS::Result
  #----------------------------------------------------------------------------
  # Contains action result constants. It's a class only for consistency between
  # server and client and should not be used as a class on the client.
  #============================================================================
  
  class Result
    
    # these values MUST correspond with the values specified in the server
    SUCCESS = 0
    DENIED = 1
    SERVER_VERSION_MISMATCH = 3
    GAME_VERSION_MISMATCH = 4
    
    PASSWORD_INCORRECT = 21
    ACCOUNT_ALREADY_EXIST = 22
    
    PLAYER_NOT_EXIST = 31
    
  end
  
  #============================================================================
  # RMXOS::Server
  #----------------------------------------------------------------------------
  # Contains server connection data.
  #============================================================================
  
  class Server
    
    # setting all accessible variables
    attr_reader :name
    attr_reader :host
    attr_reader :port
    #--------------------------------------------------------------------------
    # Initialization
    #  name      - server display name
    #  host      - IP address or URL
    #  port      - port to connect to
    #--------------------------------------------------------------------------
    def initialize(name, host, port)
      @name = name
      @host = host
      @port = port
    end
    
  end
  
  #============================================================================
  # RMXOS::ChatMessage
  #----------------------------------------------------------------------------
  # Contains chat message data.
  #============================================================================
  
  class ChatMessage
    
    # setting all accessible variables
    attr_reader :text
    attr_reader :color
    #--------------------------------------------------------------------------
    # Initialization
    #  text  - chat message text
    #  color - chat message color
    #--------------------------------------------------------------------------
    def initialize(text, color)
      @text = text
      @color = color
    end
    
  end
  
  #============================================================================
  # RMXOS::ChatBubbleMessage
  #----------------------------------------------------------------------------
  # Contains chat message data for chat bubbles.
  #============================================================================
  
  class ChatBubbleMessage < ChatMessage
    
    # setting all accessible variables
    attr_accessor :time
    #--------------------------------------------------------------------------
    # Initialization
    #  text  - chat message text
    #  color - chat message color
    #--------------------------------------------------------------------------
    def initialize(text, color)
      super
      @time = RMXOS::Data::BubbleDisplayTime * Graphics.frame_rate
    end
    #--------------------------------------------------------------------------
    # Checks if the message display has expired.
    # Returns: True or False.
    #--------------------------------------------------------------------------
    def expired?
      return (@time <= 0)
    end
    
  end
  
  #============================================================================
  # module RMXOS::Options
  #============================================================================

  module Options
    
    SERVERS.each_index {|i|
      SERVERS[i] = Server.new(SERVERS[i][0], SERVERS[i][1], SERVERS[i][2])
    }
    RESERVED_USERNAMES.each {|name| name.downcase!}
    
  end
  
  #----------------------------------------------------------------------------
  # Creates a message for sending over the network to the server.
  #  args - all arguments in an array
  # Returns: Message for sending over the network to the server.
  #----------------------------------------------------------------------------
  def self.make_message(*args)
    return args.map {|arg| arg = arg.to_s}.join("\t")
  end
  #----------------------------------------------------------------------------
  # Checks a username for reserved usernames.
  #  username - the guild name that needs to be checked
  # Returns: Whether the username can be used or not.
  #----------------------------------------------------------------------------
  def self.reserved_username?(username)
    return self.string_match?(RMXOS::Options::RESERVED_USERNAMES, username)
  end
  #----------------------------------------------------------------------------
  # Checks a username for reserved guildnames.
  #  guildname - the guild name that needs to be checked
  # Returns: Whether the guildname can be used or not.
  #----------------------------------------------------------------------------
  def self.reserved_guildname?(guildname)
    return self.string_match?(RMXOS::Options::RESERVED_GUILDNAMES, guildname)
  end
  #----------------------------------------------------------------------------
  # Checks a name against an array of strings.
  #  strings - array of strings that are used for filtering
  #  name    - the name that needs to be checked.
  # Returns: Whether the name matches one of the other strings or not.
  #----------------------------------------------------------------------------
  def self.string_match?(strings, name)
    return strings.any? {|string| name.downcase.gsub!(string) {''} &&
        !name.downcase.gsub!(/([A-Za-z]+#{string})|(#{string}[A-Za-z]+)/i) {''}}
  end
  #----------------------------------------------------------------------------
  # Fixes strings for SQL queries and eval expressions.
  #  string - string to be converted
  # Returns: Converted string.
  #----------------------------------------------------------------------------
  def self.fix_string(string)
    return string.gsub('\'') {'\\\''}
  end
  #----------------------------------------------------------------------------
  # Checks a chat message for being disabled.
  #  message - the message to be checked
  # Returns: Whether this command is disabled or not.
  #----------------------------------------------------------------------------
  def self.chat_command_disabled?(message)
    if message =~ /\A\/(\S+)/
      return RMXOS::Options::DISABLED_CHAT_COMMANDS.include?($1)
    end
    return false
  end
  #----------------------------------------------------------------------------
  # Checks a chat message for usergroup permission.
  #  message   - the message to be checked
  #  usergroup - usergroup
  # Returns: Whether this command can be used by this usergroup.
  #----------------------------------------------------------------------------
  def self.chat_command_permission?(message, usergroup)
    if message =~ /\A\/(\S+)/
      command = $1
      COMMANDS.each_key {|group|
        return (usergroup >= group) if COMMANDS[group].include?(command)
      }
    end
    return true
  end
  
end

#==============================================================================
# module RMXOS
#------------------------------------------------------------------------------
# Main module for all RMX-OS classes and procedures.
#==============================================================================

module RMXOS
  
  #============================================================================
  # RMXOS::Network
  #----------------------------------------------------------------------------
  # This class handles network communication and basic processing of server
  # commands and messages.
  #============================================================================

  class Network
    
    # setting all accessible variables
    attr_reader :socket
    attr_reader :user_id
    attr_reader :username
    attr_reader :usergroup
    attr_reader :buddies
    attr_reader :guildname
    attr_reader :guildleader
    attr_reader :version
    attr_reader :game_version
    attr_reader :servername
    attr_reader :players
    attr_reader :map_players
    attr_reader :messages
    attr_reader :load_data
    attr_reader :load_size
    attr_reader :load_sizes
    #--------------------------------------------------------------------------
    # Initialization.
    #--------------------------------------------------------------------------
    def initialize
      # autosave timer
      @autosave_time = RMXOS::Options::AUTOSAVE_FREQUENCY * 40
      # ping timeout
      @ping_timeout = RMXOS::Options::PING_TIMEOUT * 40
      # reset general data
      self.reset
    end
    #--------------------------------------------------------------------------
    # Resets the network data.
    #--------------------------------------------------------------------------
    def reset
      # socket
      @socket = nil
      # database user ID
      @user_id = -1
      # database user name
      @username = ''
      # user group
      @usergroup = RMXOS::GROUP_PLAYER
      # currently logged in players
      @players = {}
      # players on the current map
      @map_players = {}
      # received messages in this frame
      @messages = []
      # saved game data loaded from the server
      @load_size = 0
      @load_sizes = []
      @load_data = {}
      # buddy list
      @buddies = []
      # last whisper message username
      @last_whisper_name = ''
      # guild
      self.guild_reset
    end
    #--------------------------------------------------------------------------
    # Resets guild data.
    #--------------------------------------------------------------------------
    def guild_reset
      @guildname = ''
      @guildleader = ''
      @guildmembers = []
    end
    #--------------------------------------------------------------------------
    # Checks if this player is a admin.
    # Returns: Whether this player is an admin or not.
    #--------------------------------------------------------------------------
    def admin?
      return (@usergroup == RMXOS::GROUP_ADMIN ||
          @usergroup == RMXOS::GROUP_2NDADMIN)
    end
    #--------------------------------------------------------------------------
    # Checks if this player is a mod.
    # Returns: Whether this player is a mod or not.
    #--------------------------------------------------------------------------
    def mod?
      return (@usergroup == RMXOS::GROUP_MOD || self.admin?)
    end
    #--------------------------------------------------------------------------
    # Checks if this player is in a guild.
    # Returns: Whether this player is in a guild or not.
    #--------------------------------------------------------------------------
    def in_guild?
      return (@guildname != '')
    end
    #--------------------------------------------------------------------------
    # Checks if this player is the guild leader.
    # Returns: Whether this player is the guild leader or not.
    #--------------------------------------------------------------------------
    def guildleader?
      return (self.in_guild? && @guildleader == @username)
    end
    #--------------------------------------------------------------------------
    # Starts a connection.
    #  host - IP address or URL (as string)
    #  port - port for connection
    #--------------------------------------------------------------------------
    def start_connection(host, port)
      self.reset
      @socket = TCPSocket.new(host, port)
    end
    #--------------------------------------------------------------------------
    # Tests the connection capability to a host.
    #  host  - IP address or URL (as string)
    #  port  - port for connection
    #  index - index for simultanous tests
    # Returns: Whether a connection could be astablished or not.
    #--------------------------------------------------------------------------
    def test_connection(host, port, index)
      begin
        # try to create a socket
        socket = TCPSocket.new(host, port)
        # try to send something
        socket.send("HAI\n")
        # try to close the socket
        socket.close
        # connection works
        return true
      rescue Hangup
        # cease further testing
        return nil
      rescue
      ensure
        # make sure socket is closed
        socket.close rescue nil
      end
      # connection failed
      return false
    end
    #--------------------------------------------------------------------------
    # Encapsulates the socket as connection between client and server for
    # message sending.
    #  args - the message to be sent in form of arguments
    #--------------------------------------------------------------------------
    def send(*args)
      if self.connected?
        message = RMXOS.make_message(*args)
        @socket.send(message + "\n")
      end
    end
    #--------------------------------------------------------------------------
    # Disconnects this client from the server.
    #--------------------------------------------------------------------------
    def disconnect
      # if a connection actually exists
      if self.connected?
        # save the game first if saving is not disabled
        self.save if !$game_system.map_interpreter.running?
        # send disconnection message
        self.send('DCT')
      end
      # delete connection and reset data
      self.reset
    end
    #--------------------------------------------------------------------------
    # Disconnects this client from the server forcefully.
    #--------------------------------------------------------------------------
    def force_disconnect
      # delete connection and reset data
      self.reset
    end
    #--------------------------------------------------------------------------
    # Checks if an connection actually exists.
    # Returns: Whether this client is connected to a server or not.
    #--------------------------------------------------------------------------
    def connected?
      return (@socket != nil)
    end
    #--------------------------------------------------------------------------
    # Removes all players on the current map.
    #--------------------------------------------------------------------------
    def clear_map_players
      @map_players = {}
    end
    #--------------------------------------------------------------------------
    # Handles a player's server entry.
    #  id     - user ID of the player
    #--------------------------------------------------------------------------
    def player_entry(id)
      # create a new character for him if player just connected
      @players[id] = Game_OnlineCharacter.new if !@players.has_key?(id)
    end
    #--------------------------------------------------------------------------
    # Deletes a disconnected player.
    #  id - user ID of the player that has disconnected
    #--------------------------------------------------------------------------
    def player_disconnect(id)
      # removes the player from the map
      @map_players.delete(id) if @map_players.has_key?(id)
      # deletes the player
      @players.delete(id) if @players.has_key?(id)
    end
    #--------------------------------------------------------------------------
    # Handles a player's map entry.
    #  id     - user ID of the player
    #  map_id - map ID of the player
    #--------------------------------------------------------------------------
    def map_player_entry(id, map_id)
      # assign map ID
      @players[id].map_id = map_id
      # if player on the same map
      if @players[id].map_id == $game_map.map_id && !@map_players.has_key?(id)
        # assign the player to a map player
        @map_players[id] = @players[id]
      end
    end
    #--------------------------------------------------------------------------
    # Handles a player's map exit.
    #  id - user ID of the player
    #--------------------------------------------------------------------------
    def map_player_exit(id)
      # reset map ID
      @players[id].map_id = 0
      # remove player from the map if still regarded as player on the map
      @map_players.delete(id) if @map_players.has_key?(id)
    end
    #--------------------------------------------------------------------------
    # Updates all players on the map.
    #--------------------------------------------------------------------------
    def update_map_players
      @map_players.each_value {|player| player.update}
    end
    #--------------------------------------------------------------------------
    # Saves the game automatically after a specifc amount of time.
    #--------------------------------------------------------------------------
    def update_autosave
      # decrease timer
      @autosave_time -= 1
      # abort if event is running
      return if $game_system.map_interpreter.running?
      # if timer expired
      if @autosave_time < 0
        # save all data
        self.save
        # reset timer
        @autosave_time = RMXOS::Options::AUTOSAVE_FREQUENCY * 40
      end
    end
    #--------------------------------------------------------------------------
    # Listens for incoming server messages.
    #--------------------------------------------------------------------------
    def listen
      @messages.clear
      # stop if socket is not ready
      return if !self.connected? || !@socket.ready?
      # get 0xFFFF bytes from a received message
      buffer = @socket.recv(0xFFFF)
      # split by \n without suppressing trailing empty strings
      buffer = buffer.split("\n", -1)
      # if chunk from previous incomplete message exists
      if @previous_chunk != nil
        # complete chunk with first new message
        buffer[0] = @previous_chunk + buffer[0]
        # delete chunk buffer
        @previous_chunk = nil
      end
      # remove last message in buffer
      last_chunk = buffer.pop
      # incomplete message if it exists (meaning last message has no \n)
      @previous_chunk = last_chunk if last_chunk != ''
      # check each message in the buffer
      buffer.each {|message|
        next if self.check_game(message)
        next if self.check_communication(message)
        next if self.check_connection(message)
        next if self.check_loading(message)
      }
    end
    #--------------------------------------------------------------------------
    # Checks general game messages.
    #  message - the received message
    # Returns: True or false whether to stop checking this message.
    #--------------------------------------------------------------------------
    def check_game(message)
      case message
      when /\ACHT\t(.{6})\t(.+)\t(.+)/ # chat message
        # color encoded in hex
        c = [$1[0, 2].hex, $1[2, 2].hex, $1[4, 2].hex]
        self.add_message(eval($2), $3, Color.new(c[0], c[1], c[2]))
        return true
      when /\ACHA\t(.{6})\t(.+)\t(.+)/ # chat message
        # color encoded in hex
        c = [$1[0, 2].hex, $1[2, 2].hex, $1[4, 2].hex]
        self.add_message(eval($2), $3, Color.new(c[0], c[1], c[2]), true)
        return true
      when /\ADCS\Z/ # disconnected
        # disconnect
        $network.force_disconnect
        # show message
        p RMXOS::Data::Disconnected
        # return to server selection
        $scene = Scene_Servers.new
        return true
      when /\ADCL\Z/ # disconnected due to login timeout
        # disconnect
        $network.force_disconnect
        # show message
        p RMXOS::Data::LoginTimedOut
        # return to server selection
        $scene = Scene_Servers.new
        return true
      when /\ADCT\t(.+)/ # disconnection message for another player
        id = $1.to_i
        self.player_disconnect(id)
        $game_temp.trade_abort = true if id == $game_temp.trade_id
        return true
      when /\AENT\t(.+)\t(.+)\t(.+)\t(.+)/ # server entry message
        # get all necessary data from the message
        id = $1.to_i
        name = $2
        group = $3.to_i
        guild = eval($4)
        # handle player's server entry
        self.player_entry(id)
        # handle player's map data
        @players[id].set_user_data(id, name, group, guild)
        return true
      when /\APLA\t(.+)\t(.+)\t(.+)\t(.+)/ # connected player data
        # get all necessary data from the message
        id = $1.to_i
        name = $2
        group = $3.to_i
        guild = eval($4)
        # handle player's server entry
        self.player_entry(id)
        # handle player's map data
        @players[id].set_user_data(id, name, group, guild)
        return true
      when /\AMEN\t(.+)\t(.+)\t(.+)\t(.+)\t(.+)\t(.+)/ # map entry message
        # get all necessary data from the message
        map_id = $1.to_i
        id = $2.to_i
        name = $3
        group = $4.to_i
        guild = eval($5)
        variables = eval($6)
        # handle player's map entry
        self.map_player_entry(id, map_id)
        # handle player's map data
        @players[id].set_user_data(id, name, group, guild)
        # update player
        @players[id].evaluate(variables)
        # update player's position
        @players[id].moveto(@players[id].x, @players[id].y)
        return true
      when /\AMEF/ # map entry finished
        $game_temp.entering_map = false
        return true
      when /\AMEX\t(.+)/ # map exit message
        # get all necessary data from the message
        id = $1.to_i
        # handle player's map exit
        self.map_player_exit(id)
        return true
      when /\AMEV\t(.+)\t(.+)\t(.+)\t(.+)\t(.+)/ # exchange variable message
        # get all necessary data from the message
        id = $1.to_i
        name = $2
        group = $3.to_i
        guild = eval($4)
        variables = eval($5)
        # handle player's map data
        @players[id].set_user_data(id, name, group, guild)
        # update player
        @players[id].evaluate(variables)
        return true
      when /\ATRS\t(.+)\t(.+)/ # trade start
        $game_temp.trade_active = true
        $game_temp.trade_host = ($1 != '0')
        $game_temp.trade_id = $2.to_i
        $game_temp.chat_active = false
        return true
      when /\ATBS\t(.+)\t(.+)/ # battle start
        #$game_temp.trade_active = true
        #$game_temp.trade_host = ($1 != '0')
        #$game_temp.trade_id = $2.to_i
        $game_switches[54] = false
        $game_variables[50] = @username
        $game_variables[51] = @username
        $game_variables[52] = @username
        $game_variables[53] = $2
        $game_switches[38] = true
        $scene = BattlePVP.new
        return true
      when /\ATCO\Z/ # trade confirm
        $game_temp.trade_confirmed = true
        return true
      when /\ATCA\Z/ # trade complete abort
        $game_temp.trade_abort = true
        return true
      when /\ATRI\t(.+)/ # trade item list
        data = $1.gsub('>') {'=>'}
        $game_temp.trade_items = eval("{#{data}}")
        return true
      when /\ATRC\Z/ # trade cancel
        $game_temp.trade_canceled = true
        return true
      when /\ATCC\Z/ # trade cancel confirmation
        $game_temp.trade_cancel_confirmed = true
        return true
      when /\ATRF\Z/ # trade finalization
        $game_temp.trade_finalized = true
        return true
      when /\AEVA\t(.+)/ # script to evaluate from server
        begin
          eval($1)
        rescue SyntaxError
        rescue
        end
        return true
      end
      return false
    end
    #--------------------------------------------------------------------------
    # Checks server-client communication messages.
    #  message - the received message
    # Returns: True or false whether to stop checking this message.
    #--------------------------------------------------------------------------
    def check_communication(message)
      case message
      when /\ABAD\t(.+)/ # new buddy
        @buddies = (@buddies + [$1]).sort
        return true
      when /\ABRE\t(.+)/ # removed buddy
        @buddies.delete($1)
        return true
      when /\AGJO\t(.+)/ # a new member joined the guild
        @guildmembers = (@guildmembers + [$1]).sort
        return true
      when /\AGRE\t(.+)/ # removing a member from the guild
        @guildmembers.delete($1)
        return true
      when /\AGRM\Z/ # removal from guild
        self.guild_reset
        return true
      when /\AGLE\t(.+)/ # new guild leader
        @guildleader = $1
        return true
      when /\APMA\t(.+)/ # retrieved PMs
        # evaluate received data
        data = eval("[#{$1}]")
        # get PM data
        pms = self.decode_pm_data(data)
        # display each PM
        pms.each {|pm| self.add_info(pm)}
        return true
      when /\APMO\t(.+)\t(.+)\t(.+)/ # opened PM
        sender, time, message = $1, $2, $3
        # get time
        time = time.split(',')
        time = Time.mktime(time[0], time[1], time[2], time[3], time[4], time[5])
        time += Time.now.utc_offset
        # create display string
        string = RMXOS::Data::PMText.sub('SENDER') {sender}
        string.sub!('TIME') {time.strftime('%Y-%m-%d %H:%M:%S')}
        string.sub!('MESSAGE') {message}
        # display PM
        self.add_chat(string)
        return true
      end
      return false
    end
    #--------------------------------------------------------------------------
    # Checks connection and account related messages.
    #  message - the received message
    # Returns: True or false whether to stop checking this message.
    #--------------------------------------------------------------------------
    def check_connection(message)
      case message
      when /\AUID\t(.+)\t(.+)\t(.+)\t(.+)/ # user data
        @user_id = $1.to_i
        @username = $2
        @usergroup = $3.to_i
        @buddies = eval("[#{$4}]").compact.sort
        return true
      when /\AGIN\t(.+)\t(.+)\t(.+)/ # guild info
        @guildname = $1
        @guildleader = $2
        @guildmembers = eval("[#{$3}]").compact.sort
        return true
      when /\ACON\t(.+)\t(.+)\t(.+)/ # received connection message
        # pass message to game about connection try
        case $1.to_i
        when RMXOS::Result::SUCCESS then @messages.push(RMXOS::CONNECTION_SUCCESS)
        when RMXOS::Result::DENIED then @messages.push(RMXOS::CONNECTION_DENIED)
        when RMXOS::Result::SERVER_VERSION_MISMATCH then @messages.push(RMXOS::CONNECTION_CLIENT_VERSION)
        when RMXOS::Result::GAME_VERSION_MISMATCH then @messages.push(RMXOS::CONNECTION_GAME_VERSION)
        end
        # server version
        @version = $2.to_f
        # game version
        @game_version = $3.to_f
        return true
      when /\ALIN\t(.+)/ # login result
        # pass message to game about login try
        case $1.to_i
        when RMXOS::Result::SUCCESS then @messages.push(RMXOS::LOGIN_SUCCESS)
        when RMXOS::Result::DENIED then @messages.push(RMXOS::LOGIN_BANNED)
        when RMXOS::Result::PLAYER_NOT_EXIST then @messages.push(RMXOS::LOGIN_NOUSER)
        when RMXOS::Result::PASSWORD_INCORRECT then @messages.push(RMXOS::LOGIN_NOPASS)
        end
        return true
      when /\AREG\t(.+)/ # register result
        # pass message to game about register try
        case $1.to_i
        when RMXOS::Result::SUCCESS then @messages.push(RMXOS::REGISTER_SUCCESS)
        when RMXOS::Result::DENIED then @messages.push(RMXOS::REGISTER_BANNED)
        when RMXOS::Result::ACCOUNT_ALREADY_EXIST then @messages.push(RMXOS::REGISTER_EXIST)
        end
        return true
      when /\AKCK\Z/ # kicked
        # disconnect
        $network.force_disconnect
        # show message
        p RMXOS::Data::Kicked
        # return to server selection
        $scene = Scene_Servers.new
        return true
      end
      return false
    end
    #--------------------------------------------------------------------------
    # Checks messages related to loading of game data.
    #  message - the received message
    # Returns: True or false whether to stop checking this message.
    #--------------------------------------------------------------------------
    def check_loading(message)
      case message
      when /\ALOA\t(.+)\t(.+)/ # game data message
        # create data string entry
        @load_data[$1] = $2
        @load_sizes.push(@load_data.size)
        @messages.push(RMXOS::LOADING_UPDATE)
        return true
      when /\ALOS\t(.+)/ # game data size
        @load_size = $1.to_i
        @load_sizes.push(0)
        @messages.push(RMXOS::LOADING_UPDATE)
        return true
      when /\ALEN\Z/ # loading end
        @load_sizes.push(@load_data.size)
        self.load_game
        # broadcasts server entry of new player
        self.enter_server
        # remove loading data
        @load_data = {}
        @messages.push(RMXOS::LOADING_END)
        return true
      end
      return false
    end
    #--------------------------------------------------------------------------
    # Adds a chat message to the queue to be drawn.
    #  data - raw data received from the server
    # Returns: Array of PM data strings.
    #--------------------------------------------------------------------------
    def decode_pm_data(data)
      # evaluate received data
      pms = []
      (0...(data.size / 8)).each {|i|
          # split PM data
          pm = data[i * 8, 8]
          # get data fragments
          message_id = pm.shift
          sender = pm.shift
          # get time
          time = Time.mktime(pm[0], pm[1], pm[2], pm[3], pm[4], pm[5])
          time += Time.now.utc_offset
          # create display string
          string = RMXOS::Data::PMInfo.sub('NUMBER') {message_id.to_s}
          string.sub!('SENDER') {sender}
          string.sub!('TIME') {time.strftime('%Y-%m-%d %H:%M:%S')}
          # add string to final result
          pms.push(string)}
      return pms
    end
    #--------------------------------------------------------------------------
    # Adds an error message to the queue to be drawn.
    #  message - the message to add
    #--------------------------------------------------------------------------
    def add_error(message)
      self.add_message(nil, message, RMXOS::Data::ColorError)
    end
    #--------------------------------------------------------------------------
    # Adds an info message to the queue to be drawn.
    #  message - the message to add
    #--------------------------------------------------------------------------
    def add_info(message)
      self.add_message(0, message, RMXOS::Data::ColorInfo)
    end
    #--------------------------------------------------------------------------
    # Adds an explicit chat message to the queue to be drawn.
    #  message - the message to add
    #--------------------------------------------------------------------------
    def add_chat(message)
      self.add_message(nil, message, RMXOS::Data::ColorNormal)
    end
    #--------------------------------------------------------------------------
    # Adds a chat message to the queue to be drawn.
    #  user_id - user ID of the sender
    #  message - the message to add
    #  color   - message color
    #  action  - action message flag
    #--------------------------------------------------------------------------
    def add_message(id, message, color, action = false)
      # create a bitmap
      bitmap = Bitmap.new(1, 1)
      bitmap.font.size = RMXOS::Data::ChatFontHeight
      # if not generic chat message
      if id != nil
        # if sent by a player
        if id > 0
          # message from this player
          if @user_id == id
            player = $game_player
            username = @username
          # message from other player
          elsif @players.has_key?(id)
            player = @players[id]
            username = player.username
          else
            player = nil
            username = nil
          end
          # if really sent by a player
          if player != nil
            # if chat bubbles active
            if RMXOS::Options::CHAT_BUBBLES
              # slice the text for chat bubbles
              slices = bitmap.slice_text(action ? '* ' + message : message,
                  RMXOS::Data::ChatBubbleMaxWidth)
              # add messages for bubble chat
              player.add_chat_messages(slices, color)
            end
            # add username to message
            if action
              message = "* #{username} #{message}"
            else
              message = "#{username}: #{message}"
            end
          end
        end
      end
      # slice the text if necessary
      slices = bitmap.slice_text(message, RMXOS::Options::CHATBOX_WIDTH - 40)
      bitmap.dispose
      # add each text slice to chat display
      slices.each {|slice| $game_temp.chat_messages.push(
        RMXOS::ChatMessage.new(slice, color))
      }
      # if exceeding log size
      if $game_temp.chat_messages.size > RMXOS::Data::ChatLineEntries
        # remove a few messages from before
        i = $game_temp.chat_messages.size
        lines = RMXOS::Data::ChatLineEntries
        $game_temp.chat_messages = $game_temp.chat_messages[i - lines, lines]
      end
      # chat box needs refreshing
      $game_temp.chat_refresh = 0 if !$game_temp.chat_refresh
      $game_temp.chat_refresh += slices.size
    end
    #--------------------------------------------------------------------------
    # Requests a valid game connection from the server.
    #--------------------------------------------------------------------------
    def request_connection
      self.send('CON', RMXOS::VERSION, RMXOS::Options::GAME_VERSION)
    end
    #--------------------------------------------------------------------------
    # Requests a login. The server responds with whether the login has
    # succeeded or failed.
    #  username - username of the player
    #  password - password of the player
    #--------------------------------------------------------------------------
    def try_login(username, password)
      self.send('LIN', username, encrypt_password(password))
    end
    #--------------------------------------------------------------------------
    # Requests the registering of an acocunt. The server responds with whether
    # the login has succeeded or failed.
    #  username - username of the player
    #  password - password of the player
    #--------------------------------------------------------------------------
    def try_register(username, password)
      self.send('REG', username, encrypt_password(password))
    end
    #--------------------------------------------------------------------------
    # Broadcasts leaving of a map.
    #--------------------------------------------------------------------------
    def leave_map
      self.send('MEX')
    end
    #--------------------------------------------------------------------------
    # Broadcasts entering of a new map.
    #--------------------------------------------------------------------------
    def enter_map
      self.send('MEN', $game_map.map_id)
      self.ping_server
    end
    #--------------------------------------------------------------------------
    # Broadcasts entering of the server.
    #--------------------------------------------------------------------------
    def enter_server
      self.send('ENT')
    end
    #--------------------------------------------------------------------------
    # Waits for server to send all map data.
    # Note: Do not call directly. This must go after an enter_map call.
    #--------------------------------------------------------------------------
    def wait_for_map_data
      # set waiting flag
      $game_temp.entering_map = true
      # wait for server to reply
      while $game_temp.entering_map
        $network.update_server_ping
        $network.listen
        Graphics.update
      end
    end
    #--------------------------------------------------------------------------
    # Updates server ping timeout.
    #--------------------------------------------------------------------------
    def update_server_ping
      @ping_timeout -= 1
      self.ping_server if @ping_timeout <= 0
    end
    #--------------------------------------------------------------------------
    # Pings the server (keep-alive).
    #--------------------------------------------------------------------------
    def ping_server
      self.send('PNG')
      @ping_timeout = RMXOS::Options::PING_TIMEOUT * 40
    end
    #--------------------------------------------------------------------------
    # Sends a chatbox message.
    #  message - the message to be sent
    #  color   - the message color
    #  prefix  - message code with additional data
    #--------------------------------------------------------------------------
    def send_chat_message(message, color, prefix)
      color = sprintf('%02X%02X%02X', color.red.to_i, color.green.to_i, color.blue.to_i)
      self.send(prefix, color, @user_id, message)
    end
    #--------------------------------------------------------------------------
    # Sends player exchange variables to the server.
    #  variables - player exchange variables
    #--------------------------------------------------------------------------
    def send_exchange_variables(variables = nil)
      variables = $game_player.get_exchange_variables if variables == nil
      self.send('MEV', variables.inspect)
    end
    #--------------------------------------------------------------------------
    # Encrypts the password into an unsigned 32-bit hash value as string.
    #  password - original password
    # Returns: Unsigned 32-bit hash of the given password as string.
    #--------------------------------------------------------------------------
    def encrypt_password(password)
      # encrypting password
      encrypted = password.crypt(RMXOS::Options::ENCRYPTION_SALT)
      # removing first two characters which actually are the salt for safety
      return encrypted[2, encrypted.size - 2]
    end
    #--------------------------------------------------------------------------
    # Sends a trade confirmation message.
    #--------------------------------------------------------------------------
    def trade_confirm
      self.send('TCO', $game_temp.trade_id)
    end
    #--------------------------------------------------------------------------
    # Sends a message to abort the trade.
    #--------------------------------------------------------------------------
    def trade_abort
      self.send('TCA', $game_temp.trade_id)
    end
    #--------------------------------------------------------------------------
    # Sends a message with trade item data.
    #--------------------------------------------------------------------------
    def trade_send_items(items)
      items = items.clone
      items.keys.each {|key| items.delete(key) if items[key] == 0}
      data = items.inspect.gsub(' '){''}.gsub('{'){''}.gsub('}'){''}.gsub('='){''}
      self.send('TRI', $game_temp.trade_id, data)
    end
    #--------------------------------------------------------------------------
    # Sends a trade cancelation message.
    #--------------------------------------------------------------------------
    def trade_cancel
      self.send('TRC', $game_temp.trade_id)
    end
    #--------------------------------------------------------------------------
    # Sends a trade cancel confirmation message.
    #--------------------------------------------------------------------------
    def trade_confirm_cancel
      self.send('TCC', $game_temp.trade_id)
    end
    #--------------------------------------------------------------------------
    # Sends a trade execution message.
    #--------------------------------------------------------------------------
    def trade_execute
      self.send('TRX', $game_temp.trade_id)
    end
    #--------------------------------------------------------------------------
    # Checks actions that require not to be in a guild.
    # Returns: Whether the action can be executed or not.
    #--------------------------------------------------------------------------
    def check_no_guild_action
      # if in a guild
      if self.in_guild?
        # show error message
        self.add_error(RMXOS::Data::GuildAlready)
        return false
      end
      return true
    end
    #--------------------------------------------------------------------------
    # Checks actions that require to be in a guild.
    # Returns: Whether the action can be executed or not.
    #--------------------------------------------------------------------------
    def check_guild_action
      # if not in a guild
      if !self.in_guild?
        # show error message
        self.add_error(RMXOS::Data::GuildNone)
        return false
      end
      return true
    end
    #--------------------------------------------------------------------------
    # Checks actions that require to be the guild leader.
    # Returns: Whether the action can be executed or not.
    #--------------------------------------------------------------------------
    def check_guildleader_action
      # if not guild leader
      if !self.guildleader?
        # show error message
        self.add_error(RMXOS::Data::GuildNotLeader)
        return false
      end
      return true
    end
    #--------------------------------------------------------------------------
    # Checks a chat message for chat commands.
    #  message - the message to be checked
    # Returns: Whether this message is a command or not.
    #--------------------------------------------------------------------------
    def check_chat_commands(message)
      if !RMXOS.chat_command_disabled?(message) &&
          RMXOS.chat_command_permission?(message, @usergroup)
        return true if check_admin_commands(message)
        return true if check_mod_commands(message)
        return true if check_normal_commands(message)
        return true if check_buddy_commands(message)
        return true if check_pm_commands(message)
        return true if check_guild_commands(message)
      end
      return true if check_command_error(message)
      return false
    end
    #--------------------------------------------------------------------------
    # Checks a chat message for admin commands.
    #  message - the message to be checked
    # Returns: Whether this message is a command or not.
    #--------------------------------------------------------------------------
    def check_admin_commands(message)
      case message
      when /\A\/admin (\S+)\Z/ # giving secondary admin permission group
        command_usergroup_change($1, RMXOS::GROUP_2NDADMIN)
        return true
      when /\A\/kickall\Z/ # kicking all players
        command_kickall
        return true
      when /\A\/mod (\S+)\Z/ # giving mod permission group
        command_usergroup_change($1, RMXOS::GROUP_MOD)
        return true
      when /\A\/revoke (\S+)\Z/ # revoking of all permission groups
        command_usergroup_change($1, RMXOS::GROUP_PLAYER)
        return true
      when /\A\/pass (\S+) (\S+)\Z/ # forced user password change
        command_forced_password_change($1, $2, 'APA')
        return true
      when /\A\/gpass (\S+) (\S+)\Z/ # forced guild password change
        command_forced_password_change($1, $2, 'AGP')
        return true
      when /\A\/eval (\S{1}.*)/ # script evaluation on own machine
        command_eval_script($1)
        return true
      when /\A\/geval (\S{1}.*)/ # script evaluation on every connected client
        command_eval_script($1, true)
        return true
      when /\A\/seval (\S{1}.*)/ # script evaluation on server
        command_server_script($1)
        return true
      when /\A\/sql (\S{1}.*)/ # SQL script evaluation on server
        command_sql_script($1)
        return true
      end
      return false
    end
    #--------------------------------------------------------------------------
    # Checks a chat message for mod commands.
    #  message - the message to be checked
    # Returns: Whether this message is a command or not.
    #--------------------------------------------------------------------------
    def check_mod_commands(message)
      case message
      when /\A\/kick (\S+)\Z/ # kick player
        command_kick_player($1)
        return true
      when /\A\/ban (\S+)\Z/ # ban player
        command_ban_player($1)
        return true
      when /\A\/unban (\S+)\Z/ # unban player
        command_unban_player($1)
        return true
      when /\A\/global (\S{1}.*)/ # global message
        command_global_chat($1)
        return true
      end
      return false
    end
    #--------------------------------------------------------------------------
    # Checks a chat message for normal commands.
    #  message - the message to be checked
    # Returns: Whether this message is a command or not.
    #--------------------------------------------------------------------------
    def check_normal_commands(message)
      case message
      when /\A\/w (\S+) (\S{1}.*)/ # whisper chat
        command_whisper_chat($2, $1)
        return true
      when /\A\/wr (\S{1}.*)/ # whisper chat
        command_whisper_chat($1)
        return true
      when /\A\/me (\S{1}.*)/ # action chat
        command_action_chat($1)
        return true
      when /\A\/trade (\S{1}.*)/ # trade request
        command_trade_request($1)
        return true
      when /\A\/battle (\S{1}.*)/ # battle request
        command_battle_request($1)
        return true
      when /\A\/newpass (\S+) (\S+)\Z/ # password change
        command_password_change($1, $2)
        return true
      when /\A\/y (\S+)\Z/ # answer YES to an action request
        command_yes($1)
        return true
      when /\A\/n (\S+)\Z/ # answer NO to an action request
        command_no($1)
        return true
      when /\A\/cancel (\S+)\Z/ # cancel action request
        command_cancel($1)
        return true
      when /\A\/req\Z/ # display all action requests
        command_req
        return true
      when /\A\/cmd\Z/, /\A\/help(\s*)\Z/ # listing of all commands
        command_show_commands
        return true
      when /\A\/help (\S+)/ # display help for a command
        command_help($1)
        return true
      end
      return false
    end
    #--------------------------------------------------------------------------
    # Checks a chat message for buddy list commands.
    #  message - the message to be checked
    # Returns: Whether this message is a command or not.
    #--------------------------------------------------------------------------
    def check_buddy_commands(message)
      case message
      when /\A\/badd (\S+)\Z/ # adding a player to the buddy list
        command_buddy_add($1)
        return true
      when /\A\/bremove (\S+)\Z/ # removing a player from the buddy list
        command_buddy_remove($1)
        return true
      when /\A\/bshow\Z/ # displays the buddy list
        command_buddy_show
        return true
      end
      return false
    end
    #--------------------------------------------------------------------------
    # Checks a chat message for normal commands.
    #  message - the message to be checked
    # Returns: Whether this message is a command or not.
    #--------------------------------------------------------------------------
    def check_pm_commands(message)
      case message
      when /\A\/pmsend (\S+) (\S{1}.*)/ # sending a PM to a buddy
        command_pm_send($1, $2)
        return true
      when /\A\/pmunread\Z/ # getting unread PMs
        command_pm_get_unread
        return true
      when /\A\/pmall\Z/ # getting all PMs
        command_pm_get_all
        return true
      when /\A\/pmopen (\d+)\Z/ # opening a PM
        command_pm_open($1.to_i)
        return true
      when /\A\/pmdelete (\d+)\Z/ # deleting a PM
        command_pm_delete($1.to_i)
        return true
      when /\A\/pmdelall\Z/ # deleting all PMs
        command_pm_delete_all
        return true
      when /\A\/pmstatus\Z/ # inbox status
        command_pm_status
        return true
      end
      return false
    end
    #--------------------------------------------------------------------------
    # Checks a chat message for normal commands.
    #  message - the message to be checked
    # Returns: Whether this message is a command or not.
    #--------------------------------------------------------------------------
    def check_guild_commands(message)
      case message
      when /\A\/gcreate (\S+) (\S+)\Z/ # creating a guild
        command_guild_create($1, $2)
        return true
      when /\A\/gnewpass (\S+) (\S+)\Z/ # changing the guild password
        command_password_change($1, $2, 'GPS') if self.check_guildleader_action
        return true
      when /\A\/gdisband (\S+)\Z/ # disbanding the guild
        command_guild_disband($1)
        return true
      when /\A\/gtransfer (\S+) (\S+)\Z/ # transferring leadership of guild
        command_guild_transfer($1, $2)
        return true
      when /\A\/ginvite (\S+)\Z/ # inviting a player into the guild
        command_guild_invite($1)
        return true
      when /\A\/gremove (\S+) (\S+)\Z/ # removing a player from the guild
        command_guild_remove($1, $2)
        return true
      when /\A\/gleave (\S+)\Z/ # leaving the guild
        command_guild_leave($1)
        return true
      when /\A\/gmsg (\S{1}.*)/ # message to all online guild members
        command_guild_chat($1)
        return true
      when /\A\/ginfo\Z/ # guild information
        command_guild_info
        return true
      end
      return false
    end
    #--------------------------------------------------------------------------
    # Checks a chat message for errorous commands.
    #  message - the message to be checked
    # Returns: Whether this message is an invalid command or not.
    #--------------------------------------------------------------------------
    def check_command_error(message)
      # if command usage
      if message =~ /\A\/(\S+)/
        used_command = $1
        # get all commands
        commands = RMXOS::Documentation.get_command_list
        # get commands with no permission
        other_commands = RMXOS::Documentation::DESCRIPTIONS.keys - commands 
        # check proper command syntax for available commands
        commands.each {|command|
          # command used wrongly
          if message =~ /\A\/#{command}/
            self.add_error(RMXOS::Error.get_command_error(command))
            return true
          end
        }
        # check for all commands without permission
        other_commands.each {|command|
          # no permission to use command
          if message =~ /\A\/#{command}/
            self.add_error(RMXOS::Error.get_permission_command_error(command))
            return true
          end
        }
        # command simply doesn't exist
        self.add_error(RMXOS::Error.get_no_command_error(used_command))
        return true
      end
      return false
    end
    #--------------------------------------------------------------------------
    # Executes chat command for usergroup change.
    #  username - username of the player
    #  group    - new usergroup
    #--------------------------------------------------------------------------
    def command_usergroup_change(username, group)
      self.send('GRC', username, group)
    end
    #--------------------------------------------------------------------------
    # Executes chat command for kicking all players.
    #--------------------------------------------------------------------------
    def command_kickall
      self.send('AKA')
    end
    #--------------------------------------------------------------------------
    # Executes chat command for forced password change.
    #  entity   - name of the entity (player or guild)
    #  password - new password
    #  prefix   - message prefix code
    #--------------------------------------------------------------------------
    def command_forced_password_change(entity, password, prefix)
      self.send(prefix, entity, encrypt_password(password))
    end
    #--------------------------------------------------------------------------
    # Executes chat command for executing a script.
    #  script - string containing Ruby script code
    #  global - execution on all connected clients.
    #--------------------------------------------------------------------------
    def command_eval_script(script, global = false)
      begin
        eval(script)
        self.send('AEV', script) if global
      rescue SyntaxError
        self.add_error("#{RMXOS::Error::InvalidSyntax} #{script}")
      rescue
        self.add_error("#{$!.message} #{script}")
      end
    end
    #--------------------------------------------------------------------------
    # Executes chat command for executing a Ruby script on the server.
    #  script - string containing Ruby script code
    #--------------------------------------------------------------------------
    def command_server_script(script)
      self.send('ASE', script)
    end
    #--------------------------------------------------------------------------
    # Executes chat command for executing an SQL script on the server.
    #  script - string containing SQL script code
    #--------------------------------------------------------------------------
    def command_sql_script(script)
      self.send('ASQ', script)
    end
    #--------------------------------------------------------------------------
    # Executes chat command for kicking a player.
    #  username - username of the player
    #--------------------------------------------------------------------------
    def command_kick_player(username)
      self.send('MKI', username)
    end
    #--------------------------------------------------------------------------
    # Executes chat command for banning a player.
    #  username - username of the player
    #--------------------------------------------------------------------------
    def command_ban_player(username)
      self.send('MBA', username)
    end
    #--------------------------------------------------------------------------
    # Executes chat command for unbanning a player.
    #  username - username of the player
    #--------------------------------------------------------------------------
    def command_unban_player(username)
      self.send('MUB', username)
    end
    #--------------------------------------------------------------------------
    # Executes chat command for a normal chat message.
    #  message - the message to be sent
    #--------------------------------------------------------------------------
    def command_chat(message)
      self.send_chat_message(message, RMXOS::Data::ColorNormal, 'CHT')
    end
    #--------------------------------------------------------------------------
    # Executes chat command for a global chat message.
    #  message - the message to be sent
    #--------------------------------------------------------------------------
    def command_global_chat(message)
      self.send_chat_message(message, RMXOS::Data::ColorGlobal, 'MGM')
    end
    #--------------------------------------------------------------------------
    # Executes chat command for a whisper chat message.
    #  username - the target player for the message
    #  message  - the message to be sent
    #--------------------------------------------------------------------------
    def command_whisper_chat(message, username = nil)
      @last_whisper_name = username if username != nil
      if @last_whisper_name != ''
        self.send_chat_message(message, RMXOS::Data::ColorWhisper,
            RMXOS.make_message('WCH', @last_whisper_name))
      else
        self.add_error(RMXOS::Data::WhisperNoLastName)
      end
    end
    #--------------------------------------------------------------------------
    # Executes chat command for a action chat message.
    #  message - the message to be sent
    #--------------------------------------------------------------------------
    def command_action_chat(message)
      self.send_chat_message(message, RMXOS::Data::ColorAction, 'CHA')
    end
    #--------------------------------------------------------------------------
    # Executes chat command for a guild chat message.
    #  message - the message to be sent
    #--------------------------------------------------------------------------
    def command_guild_chat(message)
      if self.check_guild_action
        self.send_chat_message(message, RMXOS::Data::ColorGuild, 'GME')
      end
    end
    #--------------------------------------------------------------------------
    # Executes chat command for trade request.
    #  username - the target player for the trade request
    #--------------------------------------------------------------------------
    def command_trade_request(username)
      # if self
      if @username == username
        # show error message
        self.add_error(RMXOS::Data::TradeSelfError)
      else
        # send request
        self.send('TRQ', username)
      end
    end
    #--------------------------------------------------------------------------
    # Executes chat command for battle request.
    #  username - the target player for the battle request
    #--------------------------------------------------------------------------
    def command_battle_request(username)
      # if self
      if @username == username
        # show error message
        self.add_error(RMXOS::Data::BattleSelfError)
      else
        # send request
        self.send('TBQ', username)
      end
    end
    #--------------------------------------------------------------------------
    # Executes chat command for password change.
    #  old    - old password
    #  new    - new password
    #  prefix - message prefix code
    #--------------------------------------------------------------------------
    def command_password_change(old, new, prefix = 'NPS')
      self.send(prefix, encrypt_password(old), encrypt_password(new))
    end
    #--------------------------------------------------------------------------
    # Executes chat command for answering YES to an action request.
    #  request_id - the ID of the action request
    #--------------------------------------------------------------------------
    def command_yes(request_id)
      self.send('YES', request_id)
    end
    #--------------------------------------------------------------------------
    # Executes chat command for answering NO to an action request.
    #  request_id - the ID of the action request
    #--------------------------------------------------------------------------
    def command_no(request_id)
      self.send('NOO', request_id)
    end
    #--------------------------------------------------------------------------
    # Executes chat command for canceling an action request.
    #  request_id - the ID of the action request
    #--------------------------------------------------------------------------
    def command_cancel(request_id)
      self.send('CAN', request_id)
    end
    #--------------------------------------------------------------------------
    # Executes chat command for displaying all currently active action
    # requests.
    #--------------------------------------------------------------------------
    def command_req
      self.send('REQ')
    end
    #--------------------------------------------------------------------------
    # Executes chat command for displaying all available commands.
    #--------------------------------------------------------------------------
    def command_show_commands
      text = RMXOS::Data::HelpText + ' ' + RMXOS::Data::AvailableCommands
      self.add_info(text + ' ' + RMXOS::Documentation.get_command_list.join(', '))
    end
    #--------------------------------------------------------------------------
    # Executes chat command for displaying help text for a command.
    #  command - the command to be displayed
    #--------------------------------------------------------------------------
    def command_help(command)
      self.add_info(RMXOS::Documentation.get_command_help(command))
    end
    #--------------------------------------------------------------------------
    # Executes chat command for adding a player to the buddy list.
    #  username - username of the player
    #--------------------------------------------------------------------------
    def command_buddy_add(username)
      # if already a buddy
      if @buddies.include?(username)
        # show error message
        self.add_error(RMXOS::Data::BuddyAlreadyInList)
      # if self
      elsif @username == username
        # show error message
        self.add_error(RMXOS::Data::BuddySelfError)
      else
        # send request
        self.send('BAD', username)
      end
    end
    #--------------------------------------------------------------------------
    # Executes chat command for removing a player from the buddy list.
    #  username - username of the player
    #--------------------------------------------------------------------------
    def command_buddy_remove(username)
      # if not a buddy
      if !@buddies.include?(username)
        # show error message
        self.add_error(RMXOS::Data::BuddyNotInList)
      else
        # send request
        self.send('BRE', username)
      end
    end
    #--------------------------------------------------------------------------
    # Executes chat command for displaying the buddy list.
    #--------------------------------------------------------------------------
    def command_buddy_show
      # show buddy list
      if @buddies.size > 0
        # add '(ON)' to buddies that are online right now
        buddies = @buddies.map {|username|
          if @players.any? {|key, value| value.username == username}
            username += RMXOS::Data::OnlineTag
          else
            username = username
          end
        }
        # create final display text
        text = RMXOS::Data::BuddyList.sub('BUDDIES') {buddies.join(', ')}
      else
        # create display text, no buddies
        text = RMXOS::Data::BuddyList.sub('BUDDIES') {'none'}
      end
      self.add_info(text)
    end
    #--------------------------------------------------------------------------
    # Executes chat command for sending a PM.
    #  username - username of the player
    #  message  - the message to be sent
    #--------------------------------------------------------------------------
    def command_pm_send(username, message)
      # if not a buddy
      if !@buddies.include?(username)
        # show error message
        self.add_error(RMXOS::Data::BuddyNotInList)
      else
        chars = message.scan(/./m)
        # if PM is too long
        if chars.size > RMXOS::Options::PM_MAX_LENGTH
          # show error message
          count = chars.size - RMXOS::Options::PM_MAX_LENGTH
          error = RMXOS::Data::PMTooLong.sub('COUNT') {count}
          self.add_error(error)
        else
          # send message
          self.send('PMM', username, message)
        end
      end
    end
    #--------------------------------------------------------------------------
    # Executes chat command for getting unread PMs.
    #--------------------------------------------------------------------------
    def command_pm_get_unread
      self.send('PMU')
    end
    #--------------------------------------------------------------------------
    # Executes chat command for getting all PMs.
    #--------------------------------------------------------------------------
    def command_pm_get_all
      self.send('PMA')
    end
    #--------------------------------------------------------------------------
    # Executes chat command for opening a PM.
    #  pm_id - ID of the PM
    #--------------------------------------------------------------------------
    def command_pm_open(pm_id)
      self.send('PMO', pm_id)
    end
    #--------------------------------------------------------------------------
    # Executes chat command for deleting a PM.
    #  pm_id - ID of the PM
    #--------------------------------------------------------------------------
    def command_pm_delete(pm_id)
      self.send('PMD', pm_id)
    end
    #--------------------------------------------------------------------------
    # Executes chat command for deleting all PMs.
    #--------------------------------------------------------------------------
    def command_pm_delete_all
      self.send('PMC')
    end
    #--------------------------------------------------------------------------
    # Executes chat command for getting the inbox status.
    #--------------------------------------------------------------------------
    def command_pm_status
      self.send('PMS')
    end
    #--------------------------------------------------------------------------
    # Executes chat command for creating a new guild.
    #  guildname - name of the new guild
    #  password  - password of the new guild
    #--------------------------------------------------------------------------
    def command_guild_create(guildname, password)
      # if allowed to execute action
      if self.check_no_guild_action
        # if guildname is reserved
        if RMXOS.reserved_guildname?(guildname)
          # show error message
          self.add_error(RMXOS::Data::GuildReserved)
        # if guildname is too long
        elsif guildname.scan(/./m).size > RMXOS::Options::GUILDNAME_MAX_LENGTH
          # show error message
          self.add_error(RMXOS::Data::GuildTooLong)
        else
          # register the guild
          self.send('GCR', guildname, encrypt_password(password))
        end
      end
    end
    #--------------------------------------------------------------------------
    # Executes chat command for disbanding the guild.
    #  password - password of the guild
    #--------------------------------------------------------------------------
    def command_guild_disband(password)
      # if allowed to execute action
      if self.check_guildleader_action
        # send password
        self.send('GDI', encrypt_password(password))
      end
    end
    #--------------------------------------------------------------------------
    # Executes chat command for transferring guild leadership.
    #  username - username of the new guild leader
    #  password - password of the guild
    #--------------------------------------------------------------------------
    def command_guild_transfer(username, password)
      # if allowed to execute action
      if self.check_guildleader_action
        # if username is self
        if @username == username
          # show error message
          self.add_error(RMXOS::Data::GuildAlreadyLeader)
        # if player is not a member of the guild
        elsif !@guildmembers.include?(username)
          # show error message
          self.add_error(RMXOS::Data::GuildNotMember)
        else
          # send username and password
          self.send('GTR', username, encrypt_password(password))
        end
      end
    end
    #--------------------------------------------------------------------------
    # Executes chat command for inviting a new member into the guild.
    #  username - username of the new guild member
    #--------------------------------------------------------------------------
    def command_guild_invite(username)
      # if allowed to execute action
      if self.check_guildleader_action
        # if already in the guild
        if @guildmembers.include?(username)
          # show error message
          self.add_error(RMXOS::Data::GuildAlreadyMember)
        else
          # send invitation
          self.send('GIN', username)
        end
      end
    end
    #--------------------------------------------------------------------------
    # Executes chat command for removing a member from the guild.
    #  username - username of the guild member to be removed
    #  password - password of the guild
    #--------------------------------------------------------------------------
    def command_guild_remove(username, password)
      # if allowed to execute action
      if self.check_guildleader_action
        # if already in the guild
        if !@guildmembers.include?(username)
          # show error message
          self.add_error(RMXOS::Data::GuildAlreadyMember)
        else
          # send username and password
          self.send('GRE', username, encrypt_password(password))
        end
      end
    end
    #--------------------------------------------------------------------------
    # Executes chat command for leaving the guild.
    #  password - password of the player
    #--------------------------------------------------------------------------
    def command_guild_leave(password)
      # if allowed to execute action
      if self.guildleader?
        # show error message
        self.add_error(RMXOS::Data::GuildCannotLeave)
      # if allowed to execute action
      elsif self.check_guild_action
        # send new password
        self.send('GLE', encrypt_password(password))
      end
    end
    #--------------------------------------------------------------------------
    # Executes chat command for displaying guild information.
    #--------------------------------------------------------------------------
    def command_guild_info
      # if allowed to execute action
      if self.check_guild_action
        # show guild info
        text = RMXOS::Data::GuildInfo.sub('GUILD') {@guildname}
        text = text.sub('LEADER') {@guildleader}
        if @guildmembers.size > 1
          # add '(ON)' to buddies that are online right now
          members = (@guildmembers - [@guildleader]).map {|username|
            if @players.any? {|key, value| value.username == username}
              username += RMXOS::Data::OnlineTag
            else
              username = username
            end
          }
          text = text.sub('MEMBERS') {members.join(', ')}
        else
          text = text.sub('MEMBERS') {'none'}
        end
        self.add_info(text)
      end
    end
    #--------------------------------------------------------------------------
    # Sends a load request server.
    #--------------------------------------------------------------------------
    def send_load_request
      self.send('LRQ')
    end
    #--------------------------------------------------------------------------
    # Sends save data to the server.
    #  classes - an array of classes which should be saved.
    #--------------------------------------------------------------------------
    def send_save_data(classes = RMXOS::Options::SAVE_DATA.keys)
      # repare data for saving
      save_data = {}
      classes.each {|classe|
        save_data[classe] = RMXOS::Options::SAVE_DATA[classe]
      }
      serializations = []
      # for each save container
      self.get_save_containers.each {|container|
        # if the container's class is on this saving list
        if save_data[container.class] != nil
          # recursively get save serializations
          serializations += container.rmxos_serialize
        end
      }
      # find all literals
      literals = RMXOS::Options::SAVE_DATA.keys.find_all {|key|
        !key.is_a?(Class)
      }
      # create serializations for literal saving data
      literals.each {|key|
        serializations.push(RMXOS.make_message('SAV', key, eval(key)))
      }
      # send all save serializations
      serializations.each {|query| self.send(query)}
    end
    #--------------------------------------------------------------------------
    # Saves the game. Only data from selected classes will be saved.
    #  classes - an array of classes which should be saved.
    #--------------------------------------------------------------------------
    def save(classes = nil)
      # abort if not logged in
      return if @user_id <= 0
      # if supposed to save all
      if classes == nil
        # get all classes
        classes = RMXOS::Options::SAVE_DATA.keys
        # clear leftover data
        self.send('SCL')
      end
      # send save data to server
      send_save_data(classes)
      # send save end message to begin saving process
      self.send('SEN')
      # double autosave timer
      @autosave_time *= 2
    end
    #--------------------------------------------------------------------------
    # Gets the actual game data that can be saved.
    # Returns: An array of all instances that can be saved.
    #--------------------------------------------------------------------------
    def get_save_containers
      containers = []
      RMXOS::Options::SAVE_CONTAINERS.each {|str| containers.push(eval(str))}
      return containers
    end
    #--------------------------------------------------------------------------
    # Loads the game from the data received from the server.
    #--------------------------------------------------------------------------
    def load_game
      containers = self.get_save_containers
      # get all loading data entries sorted ascending by string length
      keys = @load_data.keys.sort {|a, b| a.size - b.size}
      # filter out only high level entries
      keys = keys.find_all {|key| key.split('/').size == 1}
      # for each high level save data entry
      keys.each {|name|
        # evaluate the entry
        data = eval(name)
        # if entry is a class
        if data.is_a?(Class)
          # for each save container
          containers.each {|container|
            # if container class matches save data class
            if container.class == data
              # load this container's data with the entry's name
              container.rmxos_deserialize(name)
              break
            end
          }
        else
          # set the literal
          eval("#{name} = #{data.inspect}")
        end
      }
    end
    
  end
  
end

#==============================================================================
# module PointerDerefence
#------------------------------------------------------------------------------
# Provides memory copying.
#==============================================================================

module PointerDerefence

  #----------------------------------------------------------------------------
  # Copies data from a pointer.
  #  length - number of bytes
  # Returns: The copied data.
  #----------------------------------------------------------------------------
  def ref(length)
    buffer = "\0" * length
    Win32API.new('kernel32', 'RtlMoveMemory', 'ppl', '').call(buffer, self, length)
    return buffer
  end
  
end

class Numeric; include PointerDerefence; end;
class String;  include PointerDerefence; end;

#==============================================================================
# module Winsock
#------------------------------------------------------------------------------
# Serves as wrapper for the used Win32API Socket functions.
#==============================================================================

module Winsock

  DLL = 'ws2_32'

  Win32API_bind            = Win32API.new(DLL, 'bind', 'ppl', 'l')
  Win32API_closesocket     = Win32API.new(DLL, 'closesocket', 'p', 'l')
  Win32API_setsockopt      = Win32API.new(DLL, 'setsockopt', 'pllpl', 'l')
  Win32API_connect         = Win32API.new(DLL, 'connect', 'ppl', 'l')
  Win32API_gethostbyname   = Win32API.new(DLL, 'gethostbyname', 'p', 'l')
  Win32API_recv            = Win32API.new(DLL, 'recv', 'ppll', 'l')
  Win32API_select          = Win32API.new(DLL, 'select', 'lpppp', 'l')
  Win32API_send            = Win32API.new(DLL, 'send', 'ppll', 'l')
  Win32API_socket          = Win32API.new(DLL, 'socket', 'lll', 'l')
  Win32API_WSAGetLastError = Win32API.new(DLL, 'WSAGetLastError', '', 'l')
  
  def self.bind(*args);            Win32API_bind.call(*args);            end;
  def self.closesocket(*args);     Win32API_closesocket.call(*args);     end;
  def self.setsockopt(*args);      Win32API_setsockopt.call(*args);      end;
  def self.connect(*args);         Win32API_connect.call(*args);         end;
  def self.gethostbyname(*args);   Win32API_gethostbyname.call(*args);   end;
  def self.recv(*args);            Win32API_recv.call(*args);            end;
  def self.select(*args);          Win32API_select.call(*args);          end;
  def self.send(*args);            Win32API_send.call(*args);            end;
  def self.socket(*args);          Win32API_socket.call(*args);          end;
  def self.WSAGetLastError(*args); Win32API_WSAGetLastError.call(*args); end;
   
end

#==============================================================================
# Socket
#------------------------------------------------------------------------------
# Creates and manages sockets.
#==============================================================================

class Socket

  AF_INET     = 2
  SOCK_STREAM = 1
  SOCK_DGRAM  = 2
  IPPROTO_TCP = 6
  IPPROTO_UDP = 17
  
  # set all accessible variables
  attr_reader :host
  attr_reader :port
  
  #----------------------------------------------------------------------------
  # Returns information about the given hostname.
  #----------------------------------------------------------------------------
  def self.gethostbyname(name)
    data = Winsock.gethostbyname(name)
    raise SocketError::ENOASSOCHOST if data == 0
    host = data.ref(16).unpack('LLssL')
    name = host[0].ref(256).unpack("c*").pack("c*").split("\0")[0]
    address_type = host[2]
    address_list = host[4].ref(4).unpack('L')[0].ref(4).unpack("c*").pack("c*")
    return [name, [], address_type, address_list]
  end
  #----------------------------------------------------------------------------
  # Creates an INET-sockaddr struct.
  #----------------------------------------------------------------------------  
  def self.sockaddr_in(host, port)
    begin
      [AF_INET, port].pack('sn') + gethostbyname(host)[3] + [].pack('x8')
    rescue
    end
  end
  #----------------------------------------------------------------------------
  # Creates a new socket and connects it to the given host and port.
  #----------------------------------------------------------------------------  
  def self.open(*args)
    socket = new(*args)
    if block_given?
      begin
        yield socket
      ensure
        socket.close
      end
    end
    return nil
  end
  #----------------------------------------------------------------------------
  # Creates a new socket.
  #----------------------------------------------------------------------------
  def initialize(domain, type, protocol)
    @descriptor = Winsock.socket(domain, type, protocol)
    SocketError.check if @descriptor == -1
    return @descriptor
  end
  #----------------------------------------------------------------------------
  # Binds a socket to the given sockaddr.
  #----------------------------------------------------------------------------
  def bind(sockaddr)
    result = Winsock.bind(@descriptor, sockaddr, sockaddr.size)
    SocketError.check if result == -1
    return result
  end
  #----------------------------------------------------------------------------
  # Closes a socket.
  #----------------------------------------------------------------------------
  def close
    result = Winsock.closesocket(@descriptor)
    SocketError.check if result == -1
    return result
  end
  #----------------------------------------------------------------------------
  # Connects a socket to the given sockaddr.
  #----------------------------------------------------------------------------
  def connect(host, port)
    @host, @port = host, port
    sockaddr = Socket.sockaddr_in(@host, @port)
    result = Winsock.connect(@descriptor, sockaddr, sockaddr.size)
    SocketError.check if result == -1
    return result
  end
  #----------------------------------------------------------------------------
  # Checks waiting data's status.
  #----------------------------------------------------------------------------
  def select(timeout)
    result = Winsock.select(1, [1, @descriptor].pack('ll'), 0, 0, [timeout, timeout * 1000000].pack('ll'))
    SocketError.check if result == -1
    return result
  end
  #----------------------------------------------------------------------------
  # Checks if data is waiting.
  #----------------------------------------------------------------------------
  def ready?
    return (self.select(0) != 0)
  end  
  #----------------------------------------------------------------------------
  # Returns recieved data.
  #----------------------------------------------------------------------------
  def recv(length, flags = 0)
    buffer = "\0" * length
    result = Winsock.recv(@descriptor, buffer, length, flags)
    SocketError.check if result == -1
    return '' if result == 0
    return buffer[0, result].unpack("c*").pack("c*") # gets rid of a bunch of \0
  end
  #----------------------------------------------------------------------------
  # Sends data to a host.
  #----------------------------------------------------------------------------
  def send(data, flags = 0)
    result = Winsock.send(@descriptor, data, data.size, flags)
    SocketError.check if result == -1
    return result
  end

end

#==============================================================================
# TCPSocket
#------------------------------------------------------------------------------
# Represents a TCP Socket Connection.
#==============================================================================

class TCPSocket < Socket

  #----------------------------------------------------------------------------
  # Initialization.
  #  host - IP or URL of the hots
  #  port - port number
  #----------------------------------------------------------------------------
  def initialize(host = nil, port = nil)
    super(AF_INET, SOCK_STREAM, IPPROTO_TCP)
    self.connect(host, port) if host != nil && port != nil
  end
  
end

#==============================================================================
# SocketError
#------------------------------------------------------------------------------
# Default exception class for sockets.
#==============================================================================

class SocketError < StandardError
  
  ENOASSOCHOST = 'getaddrinfo: no address associated with hostname.'
  
  def self.check
    errno = Winsock.WSAGetLastError
    raise Errno.const_get(Errno.constants.detect {|c|
      Errno.const_get(c).new.errno == errno}
    )
  end
  
end

class Hangup < Exception
end

#==============================================================================
# Object
#------------------------------------------------------------------------------
# Enhanced with methods for self-encoding of contained data and methods for
# decoding of saved game data that was received from the server.
#==============================================================================

class Object
  
  #----------------------------------------------------------------------------
  # Checks whether this object is actually a literal. (Literals are here
  # defined as strings, numbers, ranges, true, false and nil.)
  # Returns: True or false.
  #----------------------------------------------------------------------------
  def literal?
    return (self.is_a?(String) || self.is_a?(Numeric) || self.is_a?(Range) ||
        self.is_a?(TrueClass) || self.is_a?(FalseClass) || self.is_a?(NilClass))
  end
  #----------------------------------------------------------------------------
  # Serializes the object and all contained objects for the RMX-OS SQL
  # database.
  #  prefix - semantical prefix for the serializations
  # Returns: Array of serialization strings.
  #----------------------------------------------------------------------------
  def rmxos_serialize(prefix = nil)
    # add prefix extension if this isn't a top level class
    (prefix == nil ? prefix = "SAV\t" : prefix += '/')
    # add class name
    prefix += self.class.name
    # prepare result and data arrays
    serializations, data = [], []
    # for each variable that this class should save
    RMXOS::Options::SAVE_DATA[self.class].each {|variable|
      # get value of variable
      value = self.instance_variable_get(variable)
      # if value is of a class that should be saved as well
      if RMXOS::Options::SAVE_DATA[value.class] != nil ||
          value.is_a?(Array) || value.is_a?(Hash)
        # get serializations from this value with this class as prefix
        serializations += value.rmxos_serialize("#{prefix}/#{variable}")
        data.push(value.class)
      # if value is literal
      elsif value.literal?
        data.push(value)
      else
        # can't save this value
        raise RMXOS::Error.get_save_error(value)
      end
    }
    # if there is any data
    if data.size > 0
      # inspect and compress
      data = data.inspect.gsub(', ') {','}
      # add data array query
      serializations.unshift("#{prefix}\t#{data}")
    end
    return serializations
  end
  #----------------------------------------------------------------------------
  # Serializes array and hashes for the RMX-OS SQL database.
  #  prefix       - semantical prefix for the serializations
  #  indices      - array of indices (array) or keys (hash)
  #  all_literals - whether all elements are literals or not
  # Returns: Array serialization strings.
  #----------------------------------------------------------------------------
  def rmxos_serialize_collection(prefix, indices, all_literals)
    # prepare result
    serializations = []
    # if all array elements are literals
    if all_literals
      # get as string
      data = self.inspect
    else
      # create new instance of this class
      data = self.class.new
      # for each index in enumerable
      indices.each {|i|
        # if element is literal
        if self[i].literal?
          # add it to the result
          data[i] = self[i]
        # if element is of a class that should be saved as well
        elsif RMXOS::Options::SAVE_DATA[self[i].class] != nil ||
            self[i].is_a?(Array) || self[i].is_a?(Hash)
          # get serializations from this element with this class as prefix
          serializations += self[i].rmxos_serialize("#{prefix}[#{i.inspect}]")
          # add elements's class to data array
          data[i] = self[i].class
        else
          # can't save this value
          raise RMXOS::Error.get_save_error(self[i])
        end
      }
      # inspect and compress
      data = data.inspect
    end
    # add a little bit of compression :)
    data.gsub!(', ') {','}
    # add data array query
    serializations.push("#{prefix}\t#{data}")
    return serializations
  end
  #----------------------------------------------------------------------------
  # Deserializes data retrieved from the server into this object.
  #  name - the key for the hash data retrieved from the server
  #----------------------------------------------------------------------------
  def rmxos_deserialize(name)
    # evaluate the data for this class which turns into an array
    data = eval($network.load_data[name])
    # iterate through all indices of variables that are to be saved
    RMXOS::Options::SAVE_DATA[self.class].each_index {|i|
      # get variable name
      variable = RMXOS::Options::SAVE_DATA[self.class][i]
      # if this variable's loaded value is a class
      if data[i].is_a?(Class)
        # access key for loaded data
        key = "#{name}/#{variable}"
        # if it's an array
        if data[i] == Array
          # evaluate and get the loaded array
          data[i] = eval($network.load_data[key])
          # load all classes contained in this array
          rmxos_deserialize_collection(name, variable, data[i],
              (0...data[i].size).to_a)
        elsif data[i] == Hash
          # evaluate and get the loaded hash
          data[i] = eval($network.load_data[key])
          # load all classes contained in this hash
          rmxos_deserialize_collection(name, variable, data[i], data[i].keys)
        else
          # load this class
          data[i] = rmxos_deserialize_object(key, data[i])
        end
      end
      # set the variable to this value
      self.instance_variable_set(variable, data[i])
    }
  end
  #----------------------------------------------------------------------------
  # Deserializes data retrieved from an array or a hash.
  #  name     - the key for the hash data retrieved from the server
  #  variable - name of the variable containing the array
  #  data     - actual array or hash
  #  indices  - array of indices (array) or keys (hash)
  #----------------------------------------------------------------------------
  def rmxos_deserialize_collection(name, variable, data, indices)
    # iterate through all indices
    indices.each {|i|
      # if data is a class
      if data[i].is_a?(Class)
        # access key for loaded data
        key = "#{name}/#{variable}[#{i.inspect}]"
        # if it's an array
        if data[i] == Array
          # evaluate and get the loaded array
          data[i] = eval($network.load_data[key])
          # load all classes contained in this array
          rmxos_deserialize_collection(name, "#{variable}[#{i.inspect}]",
              data[i], (0...data[i].size).to_a)
        elsif data[i] == Hash
          # evaluate and get the loaded hash
          data[i] = eval($network.load_data[key])
          # load all classes contained in this hash
          rmxos_deserialize_collection(name, "#{variable}[#{i.inspect}]",
              data[i], data[i].keys)
        else
          # load this class
          data[i] = rmxos_deserialize_object(key, data[i])
        end
      end
    }
  end
  #----------------------------------------------------------------------------
  # Deserializes data retrieved from the server into this object.
  #  prefix - semantical prefix for loaded data access
  #  classe - class that needs to be instantiated
  # Returns: New instance of a class after loading.
  #----------------------------------------------------------------------------
  def rmxos_deserialize_object(prefix, classe)
    # if classe requires additional creation arguments
    if RMXOS::Options::CREATION_DATA.has_key?(classe)
      # get the arguments
      args = RMXOS::Options::CREATION_DATA[classe]
      # create an instance with those arguments
      new = eval("#{classe.name}.new(#{args})")
    else
      # simply instantiate the class
      new = classe.new
    end
    # load data for this class
    new.rmxos_deserialize("#{prefix}/#{classe.name}")
    return new
  end
  
end

#==============================================================================
# Array
#------------------------------------------------------------------------------
# Arrays need to be encoded and decoded differently than other obejcts.
#==============================================================================

class Array
  
  #----------------------------------------------------------------------------
  # Serializes the object and all contained objects for the RMX-OS SQL
  # database.
  #  prefix - semantical prefix for the serializations
  # Returns: Array of serialization strings.
  #----------------------------------------------------------------------------
  def rmxos_serialize(prefix)
    # all indices
    indices = (0...self.size).to_a
    # are all elements literals
    all_literals = !self.any? {|val| !val.literal?}
    # return serializations from this array
    return self.rmxos_serialize_collection(prefix, indices, all_literals)
  end

end

#==============================================================================
# Hash
#------------------------------------------------------------------------------
# Hashes need to be encoded and decoded differently than other obejcts.
#==============================================================================

class Hash
  
  #----------------------------------------------------------------------------
  # Serializes the object and all contained objects for the RMX-OS SQL
  # database.
  #  prefix - semantical prefix for the serializations
  # Returns: Array of serialization strings.
  #----------------------------------------------------------------------------
  def rmxos_serialize(prefix)
    # all keys
    indices = self.keys
    # are all elements literals
    all_literals = !self.any? {|key, val| !val.literal?}
    # return serializations from this hash
    return self.rmxos_serialize_collection(prefix, indices, all_literals)
  end  
  
end

#==============================================================================
# Bitmap
#------------------------------------------------------------------------------
# Extended with text handling methods.
#==============================================================================

class Bitmap
  
  #----------------------------------------------------------------------------
  # Uses an aliased version of draw_text to draw outlined text.
  #  x2    - x-coordinate
  #  y2    - y-coordinate
  #  w2    - width
  #  h2    - height
  #  text2 - text
  #  a2    - align
  #----------------------------------------------------------------------------
  # if method not aliased already
  if $tons_version == nil || $tons_version < 1.6
    # alias original method
    alias draw_text_shaded_later draw_text
  end
  def draw_text_full(x2, y2, w2 = 0, h2 = 0, text2 = '', a2 = 0)
    # if x2 is a rectangle
    if x2.is_a?(Rect)
      # set temporary variables
      x, y, w, h, text, a = x2.x, x2.y, x2.width, x2.height, y2, w2
    else
      # set temporary variables
      x, y, w, h, text, a = x2, y2, w2, h2, text2, a2
    end
    # save old font color
    save_color = self.font.color.clone
    # set new font color (black)
    self.font.color = Color.new(0, 0, 0)
    # draw text with offsets in all directions
    [x - 1, x + 1].each {|xx|
      [y - 1, y + 1].each {|yy|
        draw_text_shaded_later(xx, yy, w, h, text, a)
      }
    }
    # restore original color
    self.font.color = save_color
    # drw text at normal postion
    draw_text_shaded_later(x, y, w, h, text, a)
  end
  #----------------------------------------------------------------------------
  # Slices text to fit a specific width.
  #  text  - text to slice
  #  width - max width of the text
  # Returns: Array of text slices
  #----------------------------------------------------------------------------
  def slice_text(text, width)
    # split string by words
    words = text.split(' ')
    # only one word, no need to split
    return words if words.size == 1
    # initialize
    result, current_text = [], words.shift
    # check each word
    words.each_index {|i|
      # if too long
      if self.text_size("#{current_text} #{words[i]}").width > width
        # save the text from before
        result.push(current_text)
        # next word
        current_text = words[i]
      else
        # add to text from before
        current_text = "#{current_text} #{words[i]}"
      end
      # add last word
      result.push(current_text) if i >= words.size - 1
    }
    return result
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Custom Game Controls by Blizzard
# Version: 4.1 RMX-OS Edition
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# Compatiblity:
# 
#   99% compatible with SDK 1.x, 90% compatible with SDK 2.x.
# 
# 
# Note:
# 
#   Why is this input module better than others? I has far less code and it
#   can handle keyboard language layout.
# 
# 
# Explanation & Configuration:
# 
#   This Add-on will allow you to specify your own game controls. Just below
#   is a list of possible keys, below that is the configuration. The default
#   configuration is RMXP's real game control configuration. You can add any
#   key specification into a key array and separate them with commas. Example:
#   
#   RIGHT = [Key['Arrow Right'], Key[','], Key['F'], Key['Ctrl'], Key['3'],
#            Key['NumberPad 6'], Key['F3'], Key['\''], Key['\\']]
#   
#   This example would assign for the RIGHT button the following keys:
#   - directional right (right arrow key)
#   - comma
#   - letter key F
#   - Control key (CTRL)
#   - Number Key 3 (on top over the letter keys)
#   - Numberpad Key 6 (number 6 on the numberpad on the right)
#   - Functional Key 3 (F3)
#   - apostrophe (')
#   - backslash (\)
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

if !$tons_version || !TONS_OF_ADDONS::CUSTOM_CONTROLS
  
#==============================================================================
# module Input
#==============================================================================

module Input
  
  #----------------------------------------------------------------------------
  # Simple ASCII table
  #----------------------------------------------------------------------------
  Key = {'A' => 65, 'B' => 66, 'C' => 67, 'D' => 68, 'E' => 69, 'F' => 70, 
         'G' => 71, 'H' => 72, 'I' => 73, 'J' => 74, 'K' => 75, 'L' => 76, 
         'M' => 77, 'N' => 78, 'O' => 79, 'P' => 80, 'Q' => 81, 'R' => 82, 
         'S' => 83, 'T' => 84, 'U' => 85, 'V' => 86, 'W' => 87, 'X' => 88, 
         'Y' => 89, 'Z' => 90,
         '0' => 48, '1' => 49, '2' => 50, '3' => 51, '4' => 52, '5' => 53,
         '6' => 54, '7' => 55, '8' => 56, '9' => 57,
         'NumberPad 0' => 45, 'NumberPad 1' => 35, 'NumberPad 2' => 40,
         'NumberPad 3' => 34, 'NumberPad 4' => 37, 'NumberPad 5' => 12,
         'NumberPad 6' => 39, 'NumberPad 7' => 36, 'NumberPad 8' => 38,
         'NumberPad 9' => 33,
         'F1' => 112, 'F2' => 113, 'F3' => 114, 'F4' => 115, 'F5' => 116,
         'F6' => 117, 'F7' => 118, 'F8' => 119, 'F9' => 120, 'F10' => 121,
         'F11' => 122, 'F12' => 123,
         ';' => 186, '=' => 187, ',' => 188, '-' => 189, '.' => 190, '/' => 220,
         '\\' => 191, '\'' => 222, '[' => 219, ']' => 221, '`' => 192,
         'Backspace' => 8, 'Tab' => 9, 'Enter' => 13, 'Shift' => 16,
         'Left Shift' => 160, 'Right Shift' => 161, 'Left Ctrl' => 162,
         'Right Ctrl' => 163, 'Left Alt' => 164, 'Right Alt' => 165, 
         'Ctrl' => 17, 'Alt' => 18, 'Esc' => 27, 'Space' => 32, 'Page Up' => 33,
         'Page Down' => 34, 'End' => 35, 'Home' => 36, 'Insert' => 45,
         'Delete' => 46, 'Arrow Left' => 37, 'Arrow Up' => 38,
         'Arrow Right' => 39, 'Arrow Down' => 40,
         'Mouse Left' => 1, 'Mouse Right' => 2, 'Mouse Middle' => 4,
         'Mouse 4' => 5, 'Mouse 5' => 6}
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  UP = [Key['Arrow Up']]
  LEFT = [Key['Arrow Left']]
  DOWN = [Key['Arrow Down']]
  RIGHT = [Key['Arrow Right']]
  A = [Key['Shift']]
  B = [Key['X']]
  C = [Key['C']]
  X = []
  Y = []
  Z = [Key['Z']]
  L = [Key['Page Down']]
  R = [Key['Page Up']]
  F5 = [Key['F5']]
  F6 = [Key['F6']]
  F7 = [Key['F7']]
  F8 = [Key['F8']]
  F9 = [Key['F9']]
  SHIFT = [Key['Shift']]
  CTRL = [Key['Ctrl']]
  ALT = [Key['Alt']]
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  # All keys
  KEY_COUNT = 256
  ALL_KEYS = (0...KEY_COUNT).to_a
  # Win32 API calls
  GetKeyboardState = Win32API.new('user32', 'GetKeyboardState', 'P', 'I')
  GetKeyboardLayout = Win32API.new('user32', 'GetKeyboardLayout', 'L', 'L')
  MapVirtualKeyEx = Win32API.new('user32', 'MapVirtualKeyEx', 'IIL', 'I')
  ToUnicodeEx = Win32API.new('user32', 'ToUnicodeEx', 'LLPPILL', 'L')
  # some other constants
  DOWN_STATE_MASK = 0x80
  DEAD_KEY_MASK = 0x80000000
  # data
  @state = "\0" * KEY_COUNT
  @triggered = Array.new(KEY_COUNT, false)
  @pressed = Array.new(KEY_COUNT, false)
  @released = Array.new(KEY_COUNT, false)
  @repeatedKey = -1
  @repeatedCount = 0
  #----------------------------------------------------------------------------
  # update
  #  Updates input.
  #----------------------------------------------------------------------------
  def self.update
    # get current language layout
    @language_layout = GetKeyboardLayout.call(0)
    # get new keyboard state
    GetKeyboardState.call(@state)
    # this special code is used because Ruby 1.9.x does not return a char
    # when using String#[] but another String
    key = 0
    @state.each_byte {|byte|
      # if pressed state
      if (byte & DOWN_STATE_MASK) == DOWN_STATE_MASK
        # not released anymore
        @released[key] = false
        # if not pressed yet
        if !@pressed[key]
          # pressed and triggered
          @pressed[key] = true
          @triggered[key] = true
          @repeatedKey = key
          @repeatedCount = 0
        else
          # not triggered anymore
          @triggered[key] = false
        end
        # update of repeat counter
        if key == @repeatedKey
          @repeatedCount < 17 ? @repeatedCount += 1 : @repeatedCount = 15
        end
      # not released yet
      elsif !@released[key]
        # if still pressed
        if @pressed[key]
          # not triggered, pressed or repeated, but released
          @triggered[key] = false
          @pressed[key] = false
          @released[key] = true
          if key == @repeatedKey
            @repeatedKey = -1
            @repeatedCount = 0
          end
        end
      else
        # not released anymore
        @released[key] = false
      end
      key += 1
    }
  end
  #----------------------------------------------------------------------------
  # dir4
  #  4 direction check.
  #----------------------------------------------------------------------------
  def self.dir4
    return 2 if self.press?(DOWN)
    return 4 if self.press?(LEFT)
    return 6 if self.press?(RIGHT)
    return 8 if self.press?(UP)
    return 0
  end
  #----------------------------------------------------------------------------
  # dir8
  #  8 direction check.
  #----------------------------------------------------------------------------
  def self.dir8
    down = self.press?(DOWN)
    left = self.press?(LEFT)
    return 1 if down && left
    right = self.press?(RIGHT)
    return 3 if down && right
    up = self.press?(UP)
    return 7 if up && left
    return 9 if up && right
    return 2 if down
    return 4 if left
    return 6 if right
    return 8 if up
    return 0
  end
  #----------------------------------------------------------------------------
  # trigger?
  #  Test if key was triggered once.
  #----------------------------------------------------------------------------
  def self.trigger?(keys)
    keys = [keys] if !keys.is_a?(Array)
    return keys.any? {|key| @triggered[key]}
  end
  #----------------------------------------------------------------------------
  # press?
  #  Test if key is being pressed.
  #----------------------------------------------------------------------------
  def self.press?(keys)
    keys = [keys] if !keys.is_a?(Array)
    return keys.any? {|key| @pressed[key]}
  end
  #----------------------------------------------------------------------------
  # repeat?
  #  Test if key is being pressed for repeating.
  #----------------------------------------------------------------------------
  def self.repeat?(keys)
    keys = [keys] if !keys.is_a?(Array)
    return (@repeatedKey >= 0 && keys.include?(@repeatedKey) &&
        (@repeatedCount == 1 || @repeatedCount == 16))
  end
  #----------------------------------------------------------------------------
  # release?
  #  Test if key was released.
  #----------------------------------------------------------------------------
  def self.release?(keys)
    keys = [keys] if !keys.is_a?(Array)
    return keys.any? {|key| @released[key]}
  end
  #----------------------------------------------------------------------------
  # get_character
  #  vk - virtual key
  #  Gets the character from keyboard input using the input locale identifier
  #  (formerly called keyboard layout handles).
  #----------------------------------------------------------------------------
  def self.get_character(vk)
    # get corresponding character from virtual key
    c = MapVirtualKeyEx.call(vk, 2, @language_layout)
    # stop if character is non-printable and not a dead key
    return '' if c < 32 && (c & DEAD_KEY_MASK) != DEAD_KEY_MASK
    # get scan code
    vsc = MapVirtualKeyEx.call(vk, 0, @language_layout)
    # result string is never longer than 4 bytes (Unicode)
    result = "\0" * 4
    # get input string from Win32 API
    length = ToUnicodeEx.call(vk, vsc, @state, result, 4, 0, @language_layout)
    return (length == 0 ? '' : result)
  end
  #----------------------------------------------------------------------------
  # get_input_string
  #  Gets the string that was entered using the keyboard over the input locale
  #  identifier (formerly called keyboard layout handles).
  #----------------------------------------------------------------------------
  def self.get_input_string
    result = ''
    # check every key
    ALL_KEYS.each {|key|
      # if repeated
      if self.repeat?(key)
        # get character from keyboard state
        c = self.get_character(key)
        # add character if there is a character
        result += c if c != ''
      end
    }
    # empty if result is empty
    return '' if result == ''
    # convert string from Unicode to UTF-8
    return self.unicode_to_utf8(result)
  end
  #----------------------------------------------------------------------------
  # unicode_to_utf8
  #  string - string in Unicode format
  #  Converts a string from Unicode format to UTF-8 format as RGSS does not
  #  support Unicode.
  #----------------------------------------------------------------------------
  def self.unicode_to_utf8(string)
    result = ''
    # L* format means a bunch of 4-byte wide-chars
    string.unpack('L*').each {|c|
      # characters under 0x80 are 1 byte characters
      if c < 0x0080
        result += c.chr
      # other characters under 0x800 are 2 byte characters
      elsif c < 0x0800
        result += (0xC0 | (c >> 6)).chr
        result += (0x80 | (c & 0x3F)).chr
      # other characters under 0x10000 are 3 byte characters
      elsif c < 0x10000
        result += (0xE0 | (c >> 12)).chr
        result += (0x80 | ((c >> 6) & 0x3F)).chr
        result += (0x80 | (c & 0x3F)).chr
      # other characters under 0x200000 are 4 byte characters
      elsif c < 0x200000
        result += (0xF0 | (c >> 18)).chr
        result += (0x80 | ((c >> 12) & 0x3F)).chr
        result += (0x80 | ((c >> 6) & 0x3F)).chr
        result += (0x80 | (c & 0x3F)).chr
      # other characters under 0x4000000 are 5 byte characters
      elsif c < 0x4000000
        result += (0xF8 | (c >> 24)).chr
        result += (0x80 | ((c >> 18) & 0x3F)).chr
        result += (0x80 | ((c >> 12) & 0x3F)).chr
        result += (0x80 | ((c >> 6) & 0x3F)).chr
        result += (0x80 | (c & 0x3F)).chr
      # other characters under 0x80000000 are 6 byte characters
      elsif c < 0x80000000
        result += (0xFC | (c >> 30)).chr
        result += (0x80 | ((c >> 24) & 0x3F)).chr
        result += (0x80 | ((c >> 18) & 0x3F)).chr
        result += (0x80 | ((c >> 12) & 0x3F)).chr
        result += (0x80 | ((c >> 6) & 0x3F)).chr
        result += (0x80 | (c & 0x3F)).chr
      end
    }
    return result
  end

end

end

#==============================================================================
# Game_Temp
#==============================================================================

class Game_Temp
  
  # setting all accessible variables
  attr_accessor :chat_calling
  attr_accessor :chat_visible
  attr_accessor :chat_active
  attr_accessor :chat_messages
  attr_accessor :chat_logs
  attr_accessor :chat_refresh
  attr_accessor :chat_sprites
  attr_accessor :name_sprites
  attr_accessor :entering_map
  attr_accessor :trade_active
  attr_accessor :trade_host
  attr_accessor :trade_id
  attr_accessor :trade_items
  attr_accessor :trade_abort
  attr_accessor :trade_confirmed
  attr_accessor :trade_canceled
  attr_accessor :trade_cancel_confirmed
  attr_accessor :trade_finalized
  #----------------------------------------------------------------------------
  # Altered to instantiate new variables.
  #----------------------------------------------------------------------------
  alias initialize_rmxos_later initialize
  def initialize
    initialize_rmxos_later
    @chat_calling = false
    @chat_visible = true
    @chat_active = false
    @chat_messages = []
    @chat_logs = []
    @chat_refresh = false
    @chat_sprites = true
    @name_sprites = true
    @entering_map = false
    self.trade_reset
  end
  #----------------------------------------------------------------------------
  # Resets all variables for trading.
  #----------------------------------------------------------------------------
  def trade_reset
    @trade_active = false
    @trade_host = false
    @trade_id = -1
    @trade_items = {}
    @trade_abort = false
    @trade_confirmed = false
    @trade_canceled = false
    @trade_cancel_confirmed = false
    @trade_finalized = nil
  end
  
end

#==============================================================================
# Game_Character
#==============================================================================

class Game_Map
  
  #----------------------------------------------------------------------------
  # Altered for map change execution.
  #----------------------------------------------------------------------------
  alias update_rmxos_later update
  def update
    update_rmxos_later
    if $game_temp.entering_map
      # remove all current players from this map
      $network.clear_map_players
      $network.send_exchange_variables
      # enter new map
      $network.enter_map
      $network.wait_for_map_data
    end
  end
  
end

#==============================================================================
# Game_Character
#==============================================================================

class Game_Character
  
  # setting all accessible variables
  attr_reader :anime_count
  attr_reader :chat_messages
  #----------------------------------------------------------------------------
  # Altered to updates chat message bubbles.
  #----------------------------------------------------------------------------
  alias update_rmxos_later update
  def update
    update_rmxos_later
    update_chat_messages
    update_exchange_variables
  end
  #----------------------------------------------------------------------------
  # Updates all chat message bubbles and removes the one that have expired.
  #----------------------------------------------------------------------------
  def update_chat_messages
    @chat_messages = [] if @chat_messages == nil
    @chat_messages.clone.each {|chat_message|
      if chat_message.expired?
        @chat_messages.delete(chat_message)
      else
        chat_message.time -= 1
      end
    }
  end
  #----------------------------------------------------------------------------
  # Adds chat messages to bubble chat display queue.
  #  messages - array of messages
  #  color    - text display color
  #----------------------------------------------------------------------------
  def add_chat_messages(messages, color)
    @chat_messages = [] if @chat_messages == nil
    messages.each {|text|
      @chat_messages.push(RMXOS::ChatBubbleMessage.new(text, color))
    }
    while @chat_messages.size > RMXOS::Data::ChatBubbleEntries
      @chat_messages.shift
    end
  end
  #----------------------------------------------------------------------------
  # Gets the used exchange variable names.
  # Returns: Array with variable names.
  #----------------------------------------------------------------------------
  def get_exchange_variable_names
    return []
  end
  #----------------------------------------------------------------------------
  # Stores exchange variables.
  #  variables - the exchange variables
  #----------------------------------------------------------------------------
  def store_exchange_variables(variables)
    # update the exchange variable records
    @exchange_variables = {} if @exchange_variables == nil
    variables.each_key {|key| @exchange_variables[key] = variables[key]}
  end
  #----------------------------------------------------------------------------
  # Sends a hash of exchange variables to the server.
  #  variables - the exchange variables the will be sent
  # Returns: The variables that were actually sent.
  #----------------------------------------------------------------------------
  def send_exchange_variables(variables = nil)
    return (variables != nil ? variables : self.get_exchange_variables)
  end
  #----------------------------------------------------------------------------
  # Gets a hash with the current values of the exchange variables.
  #  names - names of the exchange variables
  # Returns: Hash with values of variables.
  #----------------------------------------------------------------------------
  def get_exchange_variables(names = nil)
    # get all exchange variables if none were specified
    names = get_exchange_variable_names if names == nil
    variables = {}
    # for each exchange variable name
    names.each {|name|
      keys = name.split('|')
      current = self
      # recursively get the value
      while keys.size > 0 && current != nil
        current = current.instance_variable_get(keys.shift)
      end
      variables[name] = current if keys.size == 0
    }
    return variables
  end
  #----------------------------------------------------------------------------
  # Gets a hash with exchange variable values that have changed.
  # Returns: Hash with changed variables.
  #----------------------------------------------------------------------------
  def get_exchange_variables_changes
    @exchange_variables = {} if @exchange_variables == nil
    # get all variables
    variables = self.get_exchange_variables
    changed = {}
    # find new keys
    new_keys = variables.keys - @exchange_variables.keys
    # new variables need to be updated
    new_keys.each {|key| changed[key] = variables[key]}
    # get changed variables
    (@exchange_variables.keys - new_keys).each {|key|
      if @exchange_variables[key] != variables[key]
        changed[key] = variables[key]
      end
    }
    return changed
  end
  #----------------------------------------------------------------------------
  # Updates exchange variable values and sends them to server if necessary.
  #----------------------------------------------------------------------------
  def update_exchange_variables
  end
  #----------------------------------------------------------------------------
  # Evaluates player exchange variables received from the server.
  #  variables - hash of exchange_variables
  #----------------------------------------------------------------------------
  def evaluate(variables)
    # for each variable
    variables.each_key {|key|
      current = self
      keys = key.split('|')
      name = keys.pop
      # recursively get object
      while keys.size > 0 && current != nil
        current = current.instance_variable_get(keys.shift)
      end
      # set variable
      current.instance_variable_set(name, variables[key]) if current != nil
    }
  end
  
end

#==============================================================================
# Game_Player
#==============================================================================

class Game_Player
  
  # setting all accessible variables
  attr_reader :move_speed
  #----------------------------------------------------------------------------
  # Altered to send player coordinates to the server when there is a change
  # in positioning or other related attributes.
  #----------------------------------------------------------------------------
  alias update_network_later update
  def update
    # no freezing condition
    if !$game_temp.chat_active
      # call original method
      update_network_later
    else
      super
    end
  end
  #----------------------------------------------------------------------------
  # Gets the used exchange variable names.
  # Returns: Array with variable names.
  #----------------------------------------------------------------------------
  def get_exchange_variable_names
    return RMXOS::Options::EXCHANGE_VARIABLES.clone
  end
  #----------------------------------------------------------------------------
  # Updates exchange variable values and sends them to server if necessary.
  #----------------------------------------------------------------------------
  def update_exchange_variables
    changed = self.get_exchange_variables_changes
    if changed.size > 0
      self.send_exchange_variables(changed)
      self.store_exchange_variables(changed)
    end
  end
  #----------------------------------------------------------------------------
  # Sends a hash of exchange variables to the server.
  #  variables - the exchange variables the will be sent
  # Returns: The variables that were actually sent.
  #----------------------------------------------------------------------------
  def send_exchange_variables(variables = nil)
    variables = super(variables)
    # send variables over network
    $network.send_exchange_variables(variables)
    return variables
  end
  
end

#==============================================================================
# Sprite_Character
#==============================================================================

class Sprite_Character
  
  #--------------------------------------------------------------------------
  # Altered to update the name sprite as well.
  #--------------------------------------------------------------------------
  alias update_rmxos_later update
  def update
    # call original method
    update_rmxos_later
    # if name sprites are on
    if $game_temp.name_sprites
      # update name sprites
      update_name_sprite
    # if name sprite exists
    elsif @name_sprite != nil
      # delete it
      @name_sprite.dispose
      @name_sprite = nil
    end
    # if chat sprites are on
    if $game_temp.chat_sprites
      # update chat sprites if chat bubbles are active
      update_chat_sprite if RMXOS::Options::CHAT_BUBBLES
    # if chat sprite exists
    elsif @chat_sprite != nil
      # delete it
      @chat_sprite.dispose
      @chat_sprite = nil
    end
  end
  #--------------------------------------------------------------------------
  # Updates the name sprite.
  #--------------------------------------------------------------------------
  def update_name_sprite
    username = nil
    usergroup = nil
    guildname = nil
    # if player
    if @character == $game_player
      # get name
      username = $network.username
      guildname = $network.guildname
    # if any other player
    elsif @character.is_a?(Game_OnlineCharacter)
      # get name and group
      username = @character.username
      usergroup = @character.usergroup
      guildname = @character.guildname
    end
    # if name exists and either sprite doesn't exist or name wasn't set yet
    if username != nil && (@name_sprite == nil || @username != username ||
        @usergroup != usergroup || @guildname != guildname)
      # set username
      @username = username
      # set usergroup
      @usergroup = usergroup
      # set guildname
      @guildname = guildname
      # remove old sprite if one exists
      @name_sprite.dispose if @name_sprite != nil
      # create new sprite
      @name_sprite = Sprite.new
      @name_sprite.bitmap = Bitmap.new(1, 1)
      @name_sprite.bitmap.font.size = 21
      # calculate width of name
      has_guild = (RMXOS::Options::GUILD_NAME_SPRITES && guildname != '')
      text = username
      w = @name_sprite.bitmap.text_size(text).width + 2
      # coordinates offsets
      y = 0
      h = 24
      guild_text = "[#{guildname}]"
      # if has guild text
      if has_guild
        # modify coordinates
        y += 22
        h += 22
        guild_w = @name_sprite.bitmap.text_size(guild_text).width + 2
        w = guild_w if w < guild_w
      end
      # create bitmap
      @name_sprite.bitmap = Bitmap.new(w, h)
      @name_sprite.bitmap.font.size = 21
      # set coordinates
      @name_sprite.ox = w / 2
      @name_sprite.oy = self.bitmap.height / 4 + h
      # draw guild text
      if has_guild
        @name_sprite.bitmap.font.color = RMXOS::Data::COLORS['guild']
        @name_sprite.bitmap.draw_text_full(1, 1, w, 24, guild_text, 1)
      end
      # if this player
      if usergroup == nil
        # self color
        @name_sprite.bitmap.font.color = RMXOS::Data::COLORS['self']
      # if group color exists
      elsif RMXOS::Data::COLORS.has_key?(usergroup)
        # get group color
        @name_sprite.bitmap.font.color = RMXOS::Data::COLORS[usergroup]
      else
        # white
        @name_sprite.bitmap.font.color = RMXOS::Data::COLORS[GROUP_PLAYER]
      end
      # draw name
      @name_sprite.bitmap.draw_text_full(1, y + 1, w, 24, username, 1)
    end
    # if sprite exists
    if @name_sprite != nil
      # make sure name sprite is at the proper position
      @name_sprite.x, @name_sprite.y, @name_sprite.z = self.x, self.y, self.z
    end
  end
  #--------------------------------------------------------------------------
  # Updates the chat sprite.
  #--------------------------------------------------------------------------
  def update_chat_sprite
    # if this player or any other player
    if @character == $game_player || @character.is_a?(Game_OnlineCharacter)
      # get messages
      chat_messages = @character.chat_messages
    else
      chat_messages = nil
    end
    # if chat messages have changed
    if chat_messages != nil && @chat_messages != chat_messages
      @chat_messages = chat_messages.clone
      # if sprite exists
      if @chat_sprite != nil
        # remove old bitmap and sprite
        @chat_sprite.bitmap.dispose
        @chat_sprite.dispose
      end
      # if there are no chat messages
      if @chat_messages.size == 0
        @chat_sprite = nil
      else
        # create new sprite
        @chat_sprite = Sprite.new
        @chat_sprite.bitmap = Bitmap.new(1, 1)
        @chat_sprite.bitmap.font.size = RMXOS::Data::ChatFontHeight
        # calculate width of maximum message
        w = 0
        @chat_messages.each {|message|
          width = @chat_sprite.bitmap.text_size(message.text).width + 4
          w = width if width > w
        }
        h = 24
        h += 24 if (RMXOS::Options::GUILD_NAME_SPRITES && @guildname != '')
        # set offsets
        @chat_sprite.ox = w / 2
        @chat_sprite.oy = self.bitmap.height / 4 + h + @chat_messages.size *
            RMXOS::Data::ChatFontHeight
        @chat_sprite.bitmap.dispose
        @chat_sprite.bitmap = Bitmap.new(w, @chat_messages.size *
            RMXOS::Data::ChatFontHeight)
        @chat_sprite.bitmap.font.size = RMXOS::Data::ChatFontHeight
        @chat_sprite.bitmap.fill_rect(0, 0, w, @chat_sprite.bitmap.height,
            Frame::BACK_COLOR)
        # font height
        h = RMXOS::Data::ChatFontHeight
        # if using Tons of Add-ons that has Simple Shaded Text
        if $tons_version != nil && $tons_version >= 1.6
          # skip shadow drawing
          @chat_messages.each_index {|i|
            # draw message
            @chat_sprite.bitmap.font.color = @chat_messages[i].color
            @chat_sprite.bitmap.draw_text_shaded_later(2, i * h - 1, w, h,
                @chat_messages[i].text)
          }
        else
          # draw normally
          @chat_messages.each_index {|i|
            # draw message
            @chat_sprite.bitmap.font.color = @chat_messages[i].color
            @chat_sprite.bitmap.draw_text(2, i * h - 1, w, h,
                @chat_messages[i].text)
          }
        end
      end
    end
    # if sprite exists
    if @chat_sprite != nil
      # make sure name sprite is at the proper position
      @chat_sprite.x, @chat_sprite.y, @chat_sprite.z = self.x, self.y, self.z
    end
  end
  #--------------------------------------------------------------------------
  # Altered to dispose the additional name sprite.
  #--------------------------------------------------------------------------
  alias dispose_rmxos_later dispose
  def dispose
    @name_sprite.dispose if @name_sprite != nil
    @chat_sprite.dispose if @chat_sprite != nil
    dispose_rmxos_later
  end
  
end

#==============================================================================
# Spriteset_Map
#==============================================================================

class Spriteset_Map
  
  #----------------------------------------------------------------------------
  # Altered to include a hash of other's player characters so they can be
  # checked for changes in the actual hash for players in Network.
  #----------------------------------------------------------------------------
  alias initialize_rmxos_later initialize
  def initialize
    @players = {}
    # call original method
    initialize_rmxos_later
  end
  #----------------------------------------------------------------------------
  # Altered to include the creation and disposal of characters that enter/leave
  # the map or connect/disconnect.
  #----------------------------------------------------------------------------
  alias update_rmxos_later update
  def update
    # call original method
    update_rmxos_later
    # for each removed player
    (@players.keys - $network.map_players.keys).each {|id|
      # dispose sprite
      dispose_character_sprite(@players[id])
      # remove nil values from sprites
      @character_sprites.compact!
    }
    # for each new player
    ($network.map_players.keys - @players.keys).each {|id|
      # create a sprite
      create_character_sprite($network.map_players[id])
    }
    # store current players on the map
    @players = $network.map_players.clone
  end
  #----------------------------------------------------------------------------
  # Creates a sprite for the given character.
  #  character - character that needs a sprite
  #----------------------------------------------------------------------------
  def create_character_sprite(character)
    @character_sprites.push(Sprite_Character.new(@viewport1, character))
  end
  #----------------------------------------------------------------------------
  # Disposes the sprite of a character.
  #  character - character that is being removed
  #----------------------------------------------------------------------------
  def dispose_character_sprite(character)
    # iterate through all character sprites
    @character_sprites.each_index {|i|
      # if sprite's character matches
      if @character_sprites[i].character == character
        # dispose the sprite
        @character_sprites[i].dispose
        # remove the disposed sprite
        @character_sprites[i] = nil
        break
      end
    }
  end
  
end

#==============================================================================
# Window_Command
#==============================================================================

class Window_Command
  
  # setting all accessible variables
  attr_reader :commands
  #----------------------------------------------------------------------------
  # Changes commands used in a window rather than instantiating a new window.
  #  commands - new array of commands
  #----------------------------------------------------------------------------
  def set_commands(commands)
    # store new commands
    @commands = commands
    @item_max = @commands.size
    # delete old bitmap
    self.contents.dispose if self.contents != nil
    # if there are any commands
    if @item_max > 0
      # create a new display
      self.contents = Bitmap.new(width - 32, @item_max * 32)
      refresh
    else
      # remove the disposed bitmap
      self.contents = nil
    end
  end
  
end

#==============================================================================
# Scene_Title
#------------------------------------------------------------------------------
# Altered to switch to RMX-OS Server selection scene instead.
#==============================================================================

class Scene_Title
  
  #----------------------------------------------------------------------------
  # Overriden to disconnect and change the scene immediately.
  #----------------------------------------------------------------------------
  def main
    $network.disconnect
    $scene = Scene_Servers.new
  end
  
end

#==============================================================================
# Scene_Map
#==============================================================================

class Scene_Map
  
  #----------------------------------------------------------------------------
  # Altered to create a chat window.
  #----------------------------------------------------------------------------
  alias main_rmxos_later main
  def main
    create_chat_window if $game_temp.chat_visible
    $game_temp.chat_active = false
    # call original method
    main_rmxos_later
    dispose_chat_window
    dispose_trade_windows if @trade_command_window != nil
  end
  #----------------------------------------------------------------------------
  # Altered to accept server messages and update all player characters on the
  # map.
  #----------------------------------------------------------------------------
  alias update_rmxos_later update
  def update
    $network.update_server_ping
    $network.update_autosave if !$game_temp.trade_active
    $network.listen
    $network.update_map_players
    # update chat
    update_chat
    # update trade or call original method
    $game_temp.trade_active ? update_trade : update_rmxos_later
  end
  #----------------------------------------------------------------------------
  # Altered to update player data on the server when changing maps.
  #----------------------------------------------------------------------------
  alias transfer_player_rmxos_later transfer_player
  def transfer_player
    # if map has changed
    if $game_temp.player_new_map_id != $game_map.map_id
      # make clear that player is changing the map
      $network.leave_map
      # setup flag for map entering
      $game_temp.entering_map = true
    end
    # call original method
    transfer_player_rmxos_later
    # save game after map change
    $network.save
  end
  #----------------------------------------------------------------------------
  # Creates the chat windows.
  #----------------------------------------------------------------------------
  def create_chat_window
    @chatinput_window = Frame_ChatInput.new
    @chat_window = Frame_Chat.new
  end
  #----------------------------------------------------------------------------
  # Disposes the chat windows.
  #----------------------------------------------------------------------------
  def dispose_chat_window
    if @chatinput_window != nil
      @chatinput_window.dispose
      @chatinput_window = nil
      @chat_window.dispose
      @chat_window = nil
    end
  end
  #----------------------------------------------------------------------------
  # Updates everything related to chat.
  #----------------------------------------------------------------------------
  def update_chat
    if self.special_update?
      # Ff triggers the chat window
      if Input.trigger?(Input::Key['F5'])
        $game_temp.chat_visible = !$game_temp.chat_visible
        $game_temp.chat_active = false if !$game_temp.chat_visible
      # F6 shows the chat window as well if it's not visible
      elsif Input.trigger?(Input::Key['F6'])
        $game_temp.chat_visible = true
        if $game_temp.chat_active
          $game_temp.chat_active = false
        else
          # prepare calling chat
          $game_temp.chat_calling = true
        end
      end
    end
    # if chat window doesn't exist yet
    if @chatinput_window == nil
      # create if display is active
      create_chat_window if $game_temp.chat_visible
    # if display not active
    elsif !$game_temp.chat_visible
      dispose_chat_window
    else
      # apply chat active mode if the mode has changed
      if @chatinput_window.active != $game_temp.chat_active
        @chatinput_window.active = $game_temp.chat_active
        @chat_window.active = @chatinput_window.active
      end
      # update chat windows
      @chatinput_window.update
      @chat_window.update
    end
    # if not moving and calling chat mode
    if !$game_player.moving? && $game_temp.chat_calling
      # activate chat mode
      $game_temp.chat_calling = false
      $game_temp.chat_active = true
    end
  end
  #----------------------------------------------------------------------------
  # Checks if specific code fragments should be updated.
  # Returns: Whether to execute special updates or not.
  #----------------------------------------------------------------------------
  def special_update?
    return !($game_player.moving? || $game_system.map_interpreter.running? ||
        $game_player.move_route_forcing || $game_temp.message_window_showing)
  end
  #----------------------------------------------------------------------------
  # Updates trade execution.
  #----------------------------------------------------------------------------
  def update_trade
    # create all windows if there are none yet
    create_trade_windows if @trade_command_window == nil
    # part of normal map update
    $game_map.update
    $game_system.map_interpreter.update
    $game_system.update
    $game_screen.update
    @spriteset.update
    @message_window.update
    $game_player.update_chat_messages
    # trade abortion
    if $game_temp.trade_abort
      dispose_trade_windows
      return
    end
    # abort if chat is active
    return if $game_temp.chat_active
    # if cancel attempt from a non-host
    if $game_temp.trade_host && $game_temp.trade_canceled
      $network.trade_confirm_cancel
      $game_temp.trade_confirmed = false
      $game_temp.trade_canceled = false
    end
    @trade_partner_window.update
    # update proper submenu
    if @trade_command_window.active
      update_trade_command
    elsif @trade_player_window.active
      update_trade_player
    elsif @trade_partner_window.active
      update_trade_partner
    else
      update_trade_wait
    end
    # cancel confirmation needs to be cleared
    $game_temp.trade_cancel_confirmed = false
  end
  #----------------------------------------------------------------------------
  # Creates all windows needed for trade.
  #----------------------------------------------------------------------------
  def create_trade_windows
    # trade command window
    @trade_command_window = Window_CommandHorizontal.new(152,
        RMXOS::Data::TradeCommands)
    @trade_command_window.active = true
    @trade_command_window.opacity = 160
    @trade_command_window.z = 10000
    # own item selection
    @trade_player_window = Window_TradePlayer.new
    @trade_player_window.z = 10000
    @trade_player_window.opacity = 160
    # other's item selection
    @trade_partner_window = Window_TradePartner.new
    @trade_partner_window.z = 10000
    @trade_partner_window.opacity = 160
    # wait message
    @trade_wait_window = Window_Button.new(0, 256, 640, RMXOS::Data::TradeWait)
    @trade_wait_window.z = 10000
    @trade_wait_window.opacity = 160
    @trade_wait_window.visible = false
  end
  #----------------------------------------------------------------------------
  # Dispose all trade windows.
  #----------------------------------------------------------------------------
  def dispose_trade_windows
    @trade_command_window.dispose
    @trade_command_window = nil
    @trade_partner_window.dispose
    @trade_partner_window = nil
    @trade_player_window.dispose
    @trade_player_window = nil
    @trade_wait_window.dispose
    @trade_wait_window = nil
    $game_temp.trade_reset
  end
  #----------------------------------------------------------------------------
  # Updates trade command window execution.
  #----------------------------------------------------------------------------
  def update_trade_command
    @trade_command_window.update
    # if pressed cancel
    if Input.trigger?(Input::B)
      $game_system.se_play($data_system.cancel_se)
      # abort trade
      $network.trade_abort
      dispose_trade_windows
    # if pressed confirm
    elsif Input.trigger?(Input::C)
      $game_system.se_play($data_system.decision_se)
      case @trade_command_window.index
      when 0
        # activate your window
        @trade_command_window.active = false
        @trade_player_window.active = true
        @trade_player_window.index = 0
      when 1
        # activate other window
        @trade_command_window.active = false
        @trade_partner_window.active = true
        @trade_partner_window.index = 0
      when 2
        # confirm
        @trade_command_window.active = false
        # if player exists
        if $network.players[$game_temp.trade_id] != nil
          # get wait text
          text = RMXOS::Data::TradeWait.gsub('PLAYER') {
            $network.players[$game_temp.trade_id].username
          }
          # show it
          @trade_wait_window.set_command(text)
        else
          # other player is gone
          @trade_wait_window.set_command(RMXOS::Data::TradeNoPlayer)
        end
        @trade_wait_window.visible = true
        # if host
        if $game_temp.trade_host
          # if already confirmed by other
          if $game_temp.trade_confirmed
            # execute the trade
            $network.trade_confirm
            execute_trade
          end
        else
          # wait for other
          $network.trade_confirm
        end
      when 3
        # abort completely
        $network.trade_abort
        dispose_trade_windows
      end
    end
  end
  #----------------------------------------------------------------------------
  # Updates execution of trade window with own items.
  #----------------------------------------------------------------------------
  def update_trade_player
    @trade_player_window.update
    # if pressed cancel
    if Input.trigger?(Input::B)
      $game_system.se_play($data_system.cancel_se)
      @trade_player_window.active = false
      @trade_player_window.index = -1
      @trade_command_window.active = true
    # if pressed confirm
    elsif Input.trigger?(Input::C)
      $game_system.se_play($data_system.decision_se)
      @trade_player_window.active = false
      @trade_player_window.index = -1
      @trade_command_window.active = true
    # if pressed left
    elsif Input.repeat?(Input::LEFT)
      # if quantity has changed
      if @trade_player_window.decreased_quantity
        $game_system.se_play($data_system.cursor_se)
        # send new data to other
        $network.trade_send_items(@trade_player_window.items)
        # cancel other's trade confirmation
        $network.trade_confirm_cancel
      else
        $game_system.se_play($data_system.buzzer_se)
      end
    # if pressed right
    elsif Input.repeat?(Input::RIGHT)
      # if quantity has changed
      if @trade_player_window.increased_quantity
        $game_system.se_play($data_system.cursor_se)
        # send new data to other
        $network.trade_send_items(@trade_player_window.items)
        # cancel other's trade confirmation
        $network.trade_confirm_cancel
      else
        $game_system.se_play($data_system.buzzer_se)
      end
    end
  end
  #----------------------------------------------------------------------------
  # Updates execution of trade window with other's items.
  #----------------------------------------------------------------------------
  def update_trade_partner
    # if pressed cancel
    if Input.trigger?(Input::B)
      $game_system.se_play($data_system.cancel_se)
      # deactivate other window
      @trade_partner_window.active = false
      @trade_partner_window.index = -1
      @trade_command_window.active = true
    # if pressed confirm
    elsif Input.trigger?(Input::C)
      $game_system.se_play($data_system.decision_se)
      # deactivate other window
      @trade_partner_window.active = false
      @trade_partner_window.index = -1
      @trade_command_window.active = true
    end
  end
  #----------------------------------------------------------------------------
  # Updates execution of waiting for trade confirmation.
  #----------------------------------------------------------------------------
  def update_trade_wait
    # if trade is in finalizing stage
    if $game_temp.trade_finalized != nil
      # finish if finalization is done
      dispose_trade_windows if $game_temp.trade_finalized
    # if trade cancel confirmed
    elsif $game_temp.trade_cancel_confirmed
      $game_system.se_play($data_system.cancel_se)
      # cancel confirmed trade
      @trade_command_window.active = true
      @trade_wait_window.visible = false
      $game_temp.trade_canceled = false
      $game_temp.trade_cancel_confirmed = false
    # if not host and trade canceled
    elsif !$game_temp.trade_host && $game_temp.trade_canceled
      # if pressed cancel during cancelation process
      if Input.trigger?(Input::B)
        $game_system.se_play($data_system.cancel_se)
        # other player might got stuck, abort trade completely
        $network.trade_abort
        dispose_trade_windows
      end
    # if confirmed trade
    elsif $game_temp.trade_confirmed
      $game_system.se_play($data_system.decision_se)
      # execute trade
      execute_trade
      # send confirmation if host
      $network.trade_confirm if $game_temp.trade_host
    # if pressed cancel
    elsif Input.trigger?(Input::B)
      # if host
      if $game_temp.trade_host
        # cancel trade
        $game_system.se_play($data_system.cancel_se)
        @trade_command_window.active = true
        @trade_wait_window.visible = false
      else
        # request cancel trade
        $network.trade_cancel
        # waiting for host to confirm the cancelation
        @trade_wait_window.set_command(RMXOS::Data::CancelingTradeAbort)
        $game_temp.trade_canceled = true
      end
    end
  end
  #----------------------------------------------------------------------------
  # Updates execution of waiting for trade confirmation.
  #----------------------------------------------------------------------------
  def execute_trade
    # execute item exchange
    @trade_player_window.items.each {|id, value| $game_party.lose_item(id, value)}
    @trade_partner_window.items.each {|id, value| $game_party.gain_item(id, value)}
    # send data for saving the game
    $network.send_save_data
    # request server to execute the final trade confirmation
    $network.trade_execute
    # waiting for server to finalize the trade
    $game_temp.trade_finalized = false
    # waiting for server to execute trade message
    @trade_wait_window.set_command(RMXOS::Data::ExecutingTrade)
  end
  
end

#==============================================================================
# Game_OnlineCharacter
#------------------------------------------------------------------------------
# Represents other players on the map.
#==============================================================================

class Game_OnlineCharacter < Game_Character
  
  # setting all accessible variables
  attr_reader   :user_id
  attr_reader   :username
  attr_reader   :usergroup
  attr_reader   :guildname
  attr_accessor :map_id
  #----------------------------------------------------------------------------
  # Sets player data.
  #  user_id   - user ID
  #  username  - username
  #  usergroup - usergroup
  #  guildname - guildname
  #----------------------------------------------------------------------------
  def set_user_data(user_id, username, usergroup, guildname)
    @user_id = user_id
    @username = username
    @usergroup = usergroup
    @guildname = guildname
  end
  
end

#==============================================================================
# Frame
#------------------------------------------------------------------------------
# Represents an advanced sprite class. It is lighter than a window and avoids
# usage of window specific additions that cannot be turned off. This class is
# abstract and should not be instantiated as such.
#==============================================================================

class Frame < Sprite
  
  # constants
  BORDER_COLOR = Color.new(255, 255, 255, 160)
  BACK_COLOR = Color.new(0, 0, 0, 160)
  # setting all accessible variables
  attr_accessor :active
  attr_reader   :width
  attr_reader   :height
  #----------------------------------------------------------------------------
  # Initialization.
  #  x             - x coordinate
  #  y             - y coordinate
  #  width         - width of the sprite
  #  height        - height of the sprite
  #----------------------------------------------------------------------------
  def initialize(x, y, width, height)
    # create the actual sprite
    super()
    # set dimensions
    @width = width
    @height = height
    # create background sprite
    create_background_sprite
    # set position
    self.x, self.y, self.z = x, y, 1000
    # store variables
    @active = true
  end
  #----------------------------------------------------------------------------
  # Creates a background sprite.
  #----------------------------------------------------------------------------
  def create_background_sprite
    # create background sprite
    @background = Sprite.new
    create_background_bitmap
  end
  #----------------------------------------------------------------------------
  # Creates the background bitmap.
  #----------------------------------------------------------------------------
  def create_background_bitmap
    @background.bitmap = Bitmap.new(@width, @height)
    @background.bitmap.fill_rect(0, 0, @width, @height, BORDER_COLOR)
    @background.bitmap.fill_rect(1, 1, @width - 2, @height - 2, BACK_COLOR)
  end
  #----------------------------------------------------------------------------
  # Updates the background sprite.
  #----------------------------------------------------------------------------
  def update_background
    @background.x, @background.y, @background.z = self.x, self.y, self.z - 1
  end
  #----------------------------------------------------------------------------
  # Changes the sprite width.
  #  value - new width
  #----------------------------------------------------------------------------
  def width=(value)
    # if width had changed
    if @width != value
      # delete old bitmap
      @background.bitmap.dispose if @background.bitmap != nil
      @width = value
      # create new background bitmap
      create_background_bitmap
    end
  end
  #----------------------------------------------------------------------------
  # Changes the sprite height.
  #  value - new height
  #----------------------------------------------------------------------------
  def height=(value)
    # if width had changed
    if @height != value
      # delete old bitmap
      @background.bitmap.dispose if @background.bitmap != nil
      @height = value
      # create new background bitmap
      create_background_bitmap
    end
  end
  #----------------------------------------------------------------------------
  # Changes sprite x.
  #  value - new x coordinate
  #----------------------------------------------------------------------------
  def x=(value)
    super
    update_background
  end
  #----------------------------------------------------------------------------
  # Changes sprite y.
  #  value - new y coordinate
  #----------------------------------------------------------------------------
  def y=(value)
    super
    update_background
  end
  #----------------------------------------------------------------------------
  # Changes sprite z.
  #  value - new z coordinate
  #----------------------------------------------------------------------------
  def z=(value)
    super
    update_background
  end
  #----------------------------------------------------------------------------
  # Refreshes the display. Abstract method.
  #----------------------------------------------------------------------------
  def refresh
  end
  #----------------------------------------------------------------------------
  # Disposes the additional background sprite.
  #----------------------------------------------------------------------------
  def dispose
    if @background.bitmap != nil
      @background.bitmap.dispose
      @background.bitmap = nil
    end
    @background.dispose
    super
  end
  
end

#==============================================================================
# Frame_Text
#------------------------------------------------------------------------------
# Handles basic user input from the keyboard for text related entries. This
# class is abstract and should not be instantiated as such.
#==============================================================================

class Frame_Text < Frame
  
  # constants
  CURSOR_COLOR = Color.new(255, 255, 255)
  # setting all accessible variables
  attr_reader :text
  attr_reader :password_char
  #----------------------------------------------------------------------------
  # Initialization.
  #  x             - x coordinate
  #  y             - y coordinate
  #  width         - width of the sprite
  #  height        - height of the sprite
  #  caption       - title text displayed
  #  text          - default text entered
  #  password_char - password character used to hide text (no hiding if empty)
  #----------------------------------------------------------------------------
  def initialize(x, y, width, height, text = '', password_char = '')
    # store variables
    @frame = 0
    @text = text
    @password_char = password_char
    # set cursor position at the end
    @cursor_position = text.scan(/./m).size
    # maximum text length
    self.max_length = RMXOS::Options::CHATINPUT_MAX_LENGTH
    # create the actual sprite
    super(x, y, width, height)
    # filter for input, allows all printable characters
    @input_filter = //
  end
  #----------------------------------------------------------------------------
  # Changes sprite x.
  #  value - new x coordinate
  #----------------------------------------------------------------------------
  def x=(value)
    super
    update_cursor
  end
  #----------------------------------------------------------------------------
  # Changes sprite y.
  #  value - new y coordinate
  #----------------------------------------------------------------------------
  def y=(value)
    super
    update_cursor
  end
  #----------------------------------------------------------------------------
  # Changes sprite z.
  #  value - new z coordinate
  #----------------------------------------------------------------------------
  def z=(value)
    super
    update_cursor
  end
  #----------------------------------------------------------------------------
  # Sets displayed text. Refreshes the display immediately.
  #  new_text - new text to be displayed
  #----------------------------------------------------------------------------
  def text=(new_text)
    @text = new_text
    refresh
    update_cursor
  end
  #----------------------------------------------------------------------------
  # Sets password character. Refreshes the display immediately.
  #  new_password_char - new password character to be used
  #----------------------------------------------------------------------------
  def password_char=(new_password_char)
    @password_char = new_password_char
    refresh
    update_cursor
  end
  #----------------------------------------------------------------------------
  # Changes maximum length of allowed text and truncates text if too long.
  #  new_max_length - new_max_length
  #----------------------------------------------------------------------------
  def max_length=(new_max_length)
    @max_length = new_max_length
    chars = @text.scan(/./m)
    @text = chars[0, @max_length].join if chars.size > @max_length
    self.cursor_move_to_end if @cursor_position > chars.size
  end
  #----------------------------------------------------------------------------
  # Gets the text that should be displayed. This method is needed so when using
  # a password character the original text can stay unchanged while it's
  # actually being displayed in password characters.
  # Returns: The text that should be displayed.
  #----------------------------------------------------------------------------
  def get_display_text
    return (@password_char == '' ? @text : @text.gsub(/./m) {@password_char})
  end
  #----------------------------------------------------------------------------
  # Moves the cursor to the left if possible.
  #----------------------------------------------------------------------------
  def cursor_move_left
    @cursor_position -= 1 if self.cursor_can_move_left?
    self.reset_cursor_blinking
  end
  #----------------------------------------------------------------------------
  # Moves the cursor to the right if possible.
  #----------------------------------------------------------------------------
  def cursor_move_right
    @cursor_position += 1 if self.cursor_can_move_right?
    self.reset_cursor_blinking
  end
  #----------------------------------------------------------------------------
  # Moves the cursor to the left end of a word.
  #----------------------------------------------------------------------------
  def cursor_move_left_word
    chars = @text.scan(/./m)
    # skip all whitespaces first
    while @cursor_position > 0 && chars[@cursor_position - 1] == ' '
      @cursor_position -= 1
    end
    # skip all non-whitespaces
    while @cursor_position > 0 && chars[@cursor_position - 1] != ' '
      @cursor_position -= 1
    end
    self.reset_cursor_blinking
  end
  #----------------------------------------------------------------------------
  # Moves the cursor to the right end of a word.
  #----------------------------------------------------------------------------
  def cursor_move_right_word
    chars = @text.scan(/./m)
    # skip all non-whitespaces first
    while @cursor_position < chars.size && chars[@cursor_position] != ' '
      @cursor_position += 1
    end
    # skip all whitespaces
    while @cursor_position < chars.size && chars[@cursor_position] == ' '
      @cursor_position += 1
    end
    self.reset_cursor_blinking
  end
  #----------------------------------------------------------------------------
  # Moves the cursor to the beginning.
  #----------------------------------------------------------------------------
  def cursor_move_to_beginning
    @cursor_position = 0
    self.reset_cursor_blinking
  end
  #----------------------------------------------------------------------------
  # Moves the cursor to the end.
  #----------------------------------------------------------------------------
  def cursor_move_to_end
    @cursor_position = @text.scan(/./m).size
    self.reset_cursor_blinking
  end
  #----------------------------------------------------------------------------
  # Checks if the cursor can move further left.
  # Returns: True of false.
  #----------------------------------------------------------------------------
  def cursor_can_move_left?
    return (@cursor_position > 0)
  end
  #----------------------------------------------------------------------------
  # Checks if the cursor can move further right.
  # Returns: True of false.
  #----------------------------------------------------------------------------
  def cursor_can_move_right?
    return (@cursor_position < @text.scan(/./m).size)
  end
  #----------------------------------------------------------------------------
  # Deletes the character left of the cursor if there is one.
  #  count - how many characters should be deleted
  #----------------------------------------------------------------------------
  def delete_left(count = 1)
    if self.cursor_can_move_left?
      # limiting character count
      count = @cursor_position if count > @cursor_position
      # split text at cursor with one character removed left from the cursor
      chars = @text.scan(/./m)
      left = (@cursor_position > count ? chars[0, @cursor_position - count] : [])
      if @cursor_position < chars.size
        right = chars[@cursor_position, chars.size - @cursor_position]
      else
        right = []
      end
      # set cursor at right position
      @cursor_position -= count
      # put together the split halves
      self.text = (left + right).join
      self.reset_cursor_blinking
    end
  end
  #----------------------------------------------------------------------------
  # Deletes the character right of the cursor if there is one.
  #  count - how many characters should be deleted
  #----------------------------------------------------------------------------
  def delete_right(count = 1)
    if self.cursor_can_move_right?
      # limiting character count
      chars = @text.scan(/./m)
      if count > chars.size - @cursor_position
        count = chars.size - @cursor_position
      end
      # moving cursor to the right
      @cursor_position += count
      # deleting everything left from cursor
      self.delete_left(count)
      self.reset_cursor_blinking
    end
  end
  #----------------------------------------------------------------------------
  # Deletes the word left of the cursor.
  #----------------------------------------------------------------------------
  def delete_left_word
    chars = @text.scan(/./m)
    position = @cursor_position
    # skip all whitespaces first
    while position > 0 && chars[position - 1] == ' '
      position -= 1
    end
    # skip all non-whitespaces
    while position > 0 && chars[position - 1] != ' '
      position -= 1
    end
    delete_left(@cursor_position - position) if @cursor_position > position
    self.reset_cursor_blinking
  end
  #----------------------------------------------------------------------------
  # Deletes the word right of the cursor.
  #----------------------------------------------------------------------------
  def delete_right_word
    chars = @text.scan(/./m)
    position = @cursor_position
    # skip all non-whitespaces first
    while position < chars.size && chars[position] != ' '
      position += 1
    end
    # skip all whitespaces
    while position < chars.size && chars[position] == ' '
      position += 1
    end
    delete_right(position - @cursor_position) if position > @cursor_position
    self.reset_cursor_blinking
  end
  #----------------------------------------------------------------------------
  # Inserts a character into the text right from the current cursor position
  # and moves the cursor positions.
  #  text - text that will be inserted into the current text
  #----------------------------------------------------------------------------
  def insert(text)
    chars = @text.scan(/./m)
    return if chars.size >= @max_length
    # limiting characters
    new_chars = text.scan(/./m)
    if chars.size + new_chars.size > @max_length
      new_chars = new_chars[0, @max_length - chars.size]
    end
    # split text at cursor position
    left = (@cursor_position > 0 ? chars[0, @cursor_position] : [])
    if @cursor_position < chars.size
      right = chars[@cursor_position, chars.size - @cursor_position]
    else
      right = []
    end
    # move cursor
    @cursor_position += new_chars.size
    # put together the split halves with the new text inbetween
    self.text = (left + new_chars + right).join
    self.reset_cursor_blinking
  end
  #----------------------------------------------------------------------------
  # Resets cursor blinking.
  #----------------------------------------------------------------------------
  def reset_cursor_blinking
    @frame = 0
  end
  #----------------------------------------------------------------------------
  # Shows/hides the cursor when activating/deactivating the window.
  #  value - true or false
  #----------------------------------------------------------------------------
  def active=(value)
    super
    self.reset_cursor_blinking
    update_cursor
  end
  #----------------------------------------------------------------------------
  # Updates the window behavior.
  #----------------------------------------------------------------------------
  def update
    super
    # blinking period of 1 second
    @frame = (@frame + 1) % RMXOS::Data::CursorBlinkPeriod
    update_input
    update_cursor
  end
  #----------------------------------------------------------------------------
  # Updates user input (moving cursor, deleting characters).
  # Returns: Whether to stop updating or not.
  #----------------------------------------------------------------------------
  def update_input
    # left key moves the cursor to the left
    if Input.repeat?(Input::LEFT)
      if Input.press?(Input::CTRL)
        self.cursor_move_left_word
      else
        self.cursor_move_left
      end
      return true
    end
    # right key moves the cursor to the left
    if Input.repeat?(Input::RIGHT)
      if Input.press?(Input::CTRL)
        self.cursor_move_right_word
      else
        self.cursor_move_right
      end
      return true
    end
    # home moves to the beginning
    if Input.trigger?(Input::Key['Home'])
      self.cursor_move_to_beginning
      return true
    end
    # end moves to the end
    if Input.trigger?(Input::Key['End'])
      self.cursor_move_to_end
      return true
    end
    # backspace deletes to the left
    if Input.repeat?(Input::Key['Backspace'])
      if Input.press?(Input::CTRL)
        self.delete_left_word
      else
        self.delete_left
      end
      return true
    end
    # backspace deletes to the right
    if Input.repeat?(Input::Key['Delete'])
      if Input.press?(Input::CTRL)
        self.delete_right_word
      else
        self.delete_right
      end
      return true
    end
    # get text
    text = Input.get_input_string
    # put text through input filter
    text.gsub!(@input_filter) {''}
    # if text is not empty
    if text != ''
      # insert it in the text
      self.insert(text)
      return true
    end
    return false
  end
  #----------------------------------------------------------------------------
  # Gets the x offset of the cursor.
  # Returns: X offset for the cursor.
  #----------------------------------------------------------------------------
  def cursor_x
    # x is "0" if cursor position at 0
    return -self.src_rect.x if !self.cursor_can_move_left?
    # find cursor position from text left from it
    display_text = get_display_text.scan(/./m)[0, @cursor_position].join
    return self.bitmap.text_size(display_text).width - self.src_rect.x
  end
  #----------------------------------------------------------------------------
  # Gets the y offset of the cursor.
  # Returns: Y offset for the cursor.
  #----------------------------------------------------------------------------
  def cursor_y
    return 2
  end
  #----------------------------------------------------------------------------
  # Gets the height of the cursor.
  # Returns: Height for the cursor.
  #----------------------------------------------------------------------------
  def cursor_height
    return 28
  end
  #----------------------------------------------------------------------------
  # Updates the cursor display.
  #----------------------------------------------------------------------------
  def update_cursor
    # if not active or blinking timer has exceeded value
    if !self.active || @frame >= RMXOS::Data::CursorBlinkPeriod / 2
      # if cursor exists
      if @cursor != nil
        # delete cursor
        @cursor.dispose
        @cursor = nil
      end
    else
      # if cursor does not exist
      @cursor = Sprite.new if @cursor == nil
      if @cursor.bitmap != nil && @cursor.bitmap.height != cursor_height
        @cursor.bitmap.dispose
        @cursor.bitmap = nil
      end
      if @cursor.bitmap == nil
        # create bitmap
        @cursor.bitmap = Bitmap.new(1, cursor_height)
        @cursor.bitmap.fill_rect(0, 0, 1, cursor_height, CURSOR_COLOR)
      end
      # position the cursor
      @cursor.x, @cursor.y = self.x + cursor_x, self.y + cursor_y
      @cursor.z = self.z + 1
    end
  end
  #----------------------------------------------------------------------------
  # Disposes the additional cursor sprite.
  #----------------------------------------------------------------------------
  def dispose
    if @cursor != nil
      @cursor.bitmap.dispose if @cursor.bitmap != nil
      @cursor.dispose
      @cursor = nil
    end
    super
  end
  
end

#==============================================================================
# Frame_Caption
#------------------------------------------------------------------------------
# Displays a text entry window with a caption. It allows the entry of usernames
# and passwords with a limited characterset of alphanumeric characters
# inluding "-" (minus) and "_" (underscore).
#==============================================================================

class Frame_Caption < Frame_Text
  
  #----------------------------------------------------------------------------
  # Initialization.
  #  x             - x coordinate
  #  y             - y coordinate
  #  width         - width of the window
  #  caption       - title text displayed
  #  text          - default text entered
  #  password_char - password character used to hide text (no hiding if empty)
  #----------------------------------------------------------------------------
  def initialize(x, y, width, caption, text = '', password_char = '')
    # create the actual window
    super(x, y, width, 32, text, password_char)
    # store variables
    @caption = caption
    # change max length
    self.max_length = RMXOS::Options::USERPASS_MAX_LENGTH
    # create display
    self.bitmap = Bitmap.new(@width, @height)
    # filter for input, allows all characters except white-space and apostrophe
    @input_filter = /([^\S])/
    refresh
  end
  #----------------------------------------------------------------------------
  # Refreshes the display.
  #----------------------------------------------------------------------------
  def refresh
    self.bitmap.clear
    # draw caption
    self.bitmap.draw_text(4, 0, 160, 32, @caption, 2)
    # draw text
    self.bitmap.draw_text(172, 0, @width - 8 - 168, 32, get_display_text)
  end
  #----------------------------------------------------------------------------
  # Gets the x offset of the cursor.
  # Returns: X offset for the cursor.
  #----------------------------------------------------------------------------
  def cursor_x
    return (super + 172)
  end
  
end

#==============================================================================
# Frame_ChatInput
#------------------------------------------------------------------------------
# Allows the entry of text for chatting and includes sending history.
#==============================================================================

class Frame_ChatInput < Frame_Text
  
  #----------------------------------------------------------------------------
  # Initialization.
  #----------------------------------------------------------------------------
  def initialize
    # create the actual window
    h = RMXOS::Data::ChatFontHeight
    super(0, RMXOS::Data::SCREEN_HEIGHT - h, RMXOS::Options::CHATINPUT_WIDTH, h)
    self.z = 10000
    @log_index = $game_temp.chat_logs.size
    self.active = false
    # create display
    self.bitmap = Bitmap.new(1, 1)
    refresh
  end
  #----------------------------------------------------------------------------
  # Refreshes the display.
  #----------------------------------------------------------------------------
  def refresh
    width = self.bitmap.text_size(@text).width + 8
    self.bitmap.dispose
    # create new bitmap
    x = self.src_rect.x
    self.bitmap = Bitmap.new(width + 4, @height)
    self.bitmap.font.size = RMXOS::Data::ChatFontHeight
    self.src_rect.x = x
    self.src_rect.width = @width
    # if using Tons of Add-ons that has Simple Shaded Text
    if $tons_version != nil && $tons_version >= 1.6
      # draw text
      self.bitmap.draw_text_shaded_later(2, -1, width - 4,
          RMXOS::Data::ChatFontHeight, @text)
    else
      # draw text
      self.bitmap.draw_text(2, -1, width - 4,
          RMXOS::Data::ChatFontHeight, @text)
    end
  end
  #----------------------------------------------------------------------------
  # Gets the x offset of the cursor.
  # Returns: X offset for the cursor.
  #----------------------------------------------------------------------------
  def cursor_x
    return (super + 2)
  end
  #----------------------------------------------------------------------------
  # Gets the height of the cursor.
  # Returns: Height for the cursor.
  #----------------------------------------------------------------------------
  def cursor_height
    return (RMXOS::Data::ChatFontHeight - 4)
  end
  #----------------------------------------------------------------------------
  # Updates user input (moving cursor, deleting characters).
  # Returns: Whether to stop updating or not.
  #----------------------------------------------------------------------------
  def update_input
    # abort if not active
    return false if !self.active
    # if holding CTRL
    if Input.press?(Input::CTRL)
      # if pressed UP
      if Input.repeat?(Input::UP)
        # if not at beginning of history
        if @log_index > 0
          @log_index -= 1
          # get current entry
          self.text = $game_temp.chat_logs[@log_index].clone
          self.cursor_move_to_end
        end
        return true
      # if pressed DOWN
      elsif Input.repeat?(Input::DOWN)
        # if there are still logs in the history
        if @log_index < $game_temp.chat_logs.size
          @log_index += 1
          # get current entry
          if @log_index < $game_temp.chat_logs.size
            self.text = $game_temp.chat_logs[@log_index].clone
          else
            self.text = ''
          end
          self.cursor_move_to_end
        end
        return true
      end
    end
    # if pressed enter
    if Input.repeat?(Input::Key['Enter'])
      # if any text entered
      if @text.size > 0
        $game_system.se_play($data_system.decision_se)
        # if not a special command
        if !$network.check_chat_commands(@text)
          # send this text per chat
          $network.command_chat(@text)
        end
        # save this message in chat log
        $game_temp.chat_logs.push(@text)
        if $game_temp.chat_logs.size > RMXOS::Data::ChatLogSize
          $game_temp.chat_logs.shift
        end
        # reset
        @log_index = $game_temp.chat_logs.size
        self.text = ''
        self.cursor_move_to_beginning
      end
      return true
    end
    # call superclass method
    return super
  end
  #----------------------------------------------------------------------------
  # Updates the cursor display.
  #----------------------------------------------------------------------------
  def update_cursor
    x = cursor_x
    if x < 2
      self.src_rect.x += x - 2
    elsif x >= @width - 2
      self.src_rect.x += x - (@width - 2) + 1
    end
    super
  end
  
end

#==============================================================================
# Frame_Chat
#------------------------------------------------------------------------------
# Displays a chat log.
#==============================================================================

class Frame_Chat < Frame
  
  #----------------------------------------------------------------------------
  # Initialization.
  #----------------------------------------------------------------------------
  def initialize
    # create the actual window
    height = RMXOS::Options::CHATBOX_LINES * RMXOS::Data::ChatFontHeight
    super(0, RMXOS::Data::SCREEN_HEIGHT - height - RMXOS::Data::ChatFontHeight,
        RMXOS::Options::CHATBOX_WIDTH, height)
    self.z = 10000
    self.active = false
    # create display
    refresh
    if self.bitmap != nil && self.bitmap.height > @height
      self.src_rect.y = self.bitmap.height - @height
    end
  end
  #----------------------------------------------------------------------------
  # Refreshes the display.
  #----------------------------------------------------------------------------
  def refresh
    if self.bitmap != nil
      # remove old bitmap
      self.bitmap.dispose
      self.bitmap = nil
    end
    # abort if no messages
    return if $game_temp.chat_messages.size == 0
    # create new bitmap
    h = $game_temp.chat_messages.size * RMXOS::Data::ChatFontHeight
    self.bitmap = Bitmap.new(@width, h)
    self.bitmap.font.size = RMXOS::Data::ChatFontHeight
    self.src_rect.height = @height
    self.draw_messages
  end
  #----------------------------------------------------------------------------
  # Refreshes part of the display.
  #----------------------------------------------------------------------------
  def refresh_chat
    new_lines = $game_temp.chat_refresh
    $game_temp.chat_refresh = false
    # abort if no messages
    return if $game_temp.chat_messages.size == 0
    # if no messages are being displayed yet
    if self.bitmap == nil
      # just draw them all
      refresh
      return
    end
    # store current display
    bitmap = self.bitmap
    h = $game_temp.chat_messages.size * RMXOS::Data::ChatFontHeight
    # scrolling down if at bottom
    if self.src_rect.y >= bitmap.height - @height && h > @height
      src_y = h - @height
    else
      src_y = self.src_rect.y
    end
    # creating a new bitmap
    self.bitmap = Bitmap.new(@width, h)
    self.bitmap.font.size = RMXOS::Data::ChatFontHeight
    self.src_rect.y = src_y
    self.src_rect.height = @height
    # y offset for drawing
    if bitmap.height == h
      y = new_lines * RMXOS::Data::ChatFontHeight
    else
      y = 0
    end
    self.bitmap.blt(0, 0, bitmap, Rect.new(0, y, @width, bitmap.height - y))
    # delete old bitmap
    bitmap.dispose
    # draw new messages
    self.draw_messages($game_temp.chat_messages.size - new_lines)
  end
  #----------------------------------------------------------------------------
  # Draws specific messages onto the display.
  #  start - starting message index
  #----------------------------------------------------------------------------
  def draw_messages(start = 0)
    h = RMXOS::Data::ChatFontHeight
    # if using Tons of Add-ons that has Simple Shaded Text
    if $tons_version != nil && $tons_version >= 1.6
      # skip shadow drawing
      (start...$game_temp.chat_messages.size).each {|i|
        # draw message
        self.bitmap.font.color = $game_temp.chat_messages[i].color
        self.bitmap.draw_text_shaded_later(2, i * h - 1, @width - 4, h,
            $game_temp.chat_messages[i].text)
      }
    else
      # draw normally
      (start...$game_temp.chat_messages.size).each {|i|
        # draw message
        self.bitmap.font.color = $game_temp.chat_messages[i].color
        self.bitmap.draw_text(2, i * h - 1, @width - 4, h,
            $game_temp.chat_messages[i].text)
      }
    end
  end
  #----------------------------------------------------------------------------
  # Updates the window.
  #----------------------------------------------------------------------------
  def update
    super
    refresh_chat if $game_temp.chat_refresh
    # if active and not holding CTRL
    if self.active && !Input.press?(Input::CTRL)
      # if pressed UP
      if Input.repeat?(Input::UP)
        # scroll up if possible
        self.src_rect.y -= RMXOS::Data::ChatFontHeight if self.src_rect.y > 0
        return true
      # if pressed DOWN
      elsif Input.repeat?(Input::DOWN)
        if self.bitmap != nil && self.src_rect.y < self.bitmap.height - @height
          self.src_rect.y += RMXOS::Data::ChatFontHeight
        end
        # scroll down if possible
        return true
      end
    end
  end
  
end

#==============================================================================
# Window_Button
#------------------------------------------------------------------------------
# Wraps the command window into a button-like appearance.
#==============================================================================

class Window_Button < Window_Selectable
  
  #----------------------------------------------------------------------------
  # Initialization.
  #  x       - x coordinate
  #  y       - y coordinate
  #  width   - window width
  #  command - command to be displayed
  #----------------------------------------------------------------------------
  def initialize(x, y, width, command)
    super(x, y, width, 64)
    self.x, self.y = x, y
    self.index = -1
    @command = command
    self.contents = Bitmap.new(width - 32, 32)
    refresh
  end
  #----------------------------------------------------------------------------
  # Refreshes the display.
  #----------------------------------------------------------------------------
  def refresh
    self.contents.clear
    self.contents.font.color = normal_color
    self.contents.draw_text(0, 0, width - 32, 32, @command, 1)
  end
  #----------------------------------------------------------------------------
  # Changes the command that is displayed.
  #----------------------------------------------------------------------------
  def set_command(command)
    @command = command
    refresh
  end
 
end

#==============================================================================
# Window_ServerCommand
#------------------------------------------------------------------------------
# Allows quick change of displayed commands.
#==============================================================================

class Window_ServerCommand < Window_Command
  
  #----------------------------------------------------------------------------
  # Overrides the drawing of a command once.
  #  i       - item index
  #  command - command to draw
  #  color   - text color
  #----------------------------------------------------------------------------
  def draw_command(i, command, color = normal_color)
    commands = @commands.clone
    @commands[i] = command
    self.draw_item(i, color)
    @commands = commands
  end
  #----------------------------------------------------------------------------
  # Overrides the drawing of a command to use specific colors for certain
  # words.
  #  i       - item index
  #  color   - text color
  #----------------------------------------------------------------------------
  def draw_item(i, color)
    if @commands[i] == RMXOS::Data::ServerOnline
      color = RMXOS::Data::ColorServerOnline
    elsif @commands[i] == RMXOS::Data::ServerOffline
      color = RMXOS::Data::ColorServerOffline
    end
    super
  end
  #----------------------------------------------------------------------------
  # Updats cursor rectangle.
  #----------------------------------------------------------------------------
  def page_row_max
    result = super
    result += 1 if self.active && self.index >= 0 && self.index < @item_max - 1
    return result
  end
  
end

#==============================================================================
# Window_CommandHorizontal
#------------------------------------------------------------------------------
# This window deals with general command choices, but the display is
# horizontal.
#==============================================================================

class Window_CommandHorizontal < Window_Command
  
  #----------------------------------------------------------------------------
  # Initialization.
  #----------------------------------------------------------------------------
  def initialize(width, commands)
    super
    self.width, self.height = commands.size * width + 32, 64
    @column_max = commands.size
    self.contents.dispose
    self.contents = Bitmap.new(self.width - 32, self.height - 32)
    refresh
    update_cursor_rect
  end
  #----------------------------------------------------------------------------
  # Draws one item.
  #  i     - item index
  #  color - text color
  #----------------------------------------------------------------------------
  def draw_item(i, color)
    self.contents.font.color = color
    w = (self.width - 32) / @column_max
    x = i % @column_max * w
    rect = Rect.new(x, 0, self.contents.width / @column_max, 32)
    self.contents.fill_rect(rect, Color.new(0, 0, 0, 0))
    self.contents.draw_text(rect, @commands[i], 1)
  end
  #----------------------------------------------------------------------------
  # Updates the cursor rectangle.
  #----------------------------------------------------------------------------
  def update_cursor_rect
    # if no cursor position
    if @index < 0
      self.cursor_rect.empty
      return
    end
    # match rows
    row = @index / @column_max
    self.top_row = row if row < self.top_row
    if row > self.top_row + (self.page_row_max - 1)
      self.top_row = row - (self.page_row_max - 1)
    end
    # set cursor position
    cursor_width = (self.width - 32) / @column_max
    x = @index % @column_max * cursor_width
    self.cursor_rect.set(x, 0, cursor_width, 32)
  end
  
end

#==============================================================================
# Window_TradeItem
#------------------------------------------------------------------------------
# Displays items for trading.
#==============================================================================

class Window_TradeItem < Window_Item
  
  # setting all accessible variables
  attr_reader :item_max
  attr_reader :items
  #----------------------------------------------------------------------------
  # Initialization
  #----------------------------------------------------------------------------
  def initialize
    super
    # setup dimensions
    self.y, self.z = 64, 11000
    self.width, self.height = 320, 192
    # initialize
    @column_max = 1
    self.active = false
    self.cursor_rect.empty
    # refresh display
    refresh
  end
  #----------------------------------------------------------------------------
  # Draws the data on the window.
  #----------------------------------------------------------------------------
  def refresh
    # if bitmap exists
    if self.contents != nil
      # delete bitmap
      self.contents.dispose
      self.contents = nil
    end
    # set up all items for display
    setup_items
    # if there are any items
    if @item_max > 0
      # create bitmap
      self.contents = Bitmap.new(width - 32, @item_max * 32)
      # if using Dyna Edition scripts
      if $fontface != nil
        # set font name and size
        self.contents.font.name = $fontface
        self.contents.font.size = $fontsize
      # if using PK Edition 2
      elsif $defaultfonttype != nil
        # set font name and size
        self.contents.font.name = $defaultfonttype
        self.contents.font.size = $defaultfontsize
      end
      # draws all items
      draw_items
    end
  end
  #----------------------------------------------------------------------------
  # Sets up all items displayed.
  #----------------------------------------------------------------------------
  def setup_items
    # empty data
    @data = []
    @items = {}
    # iterate through all items without the no-trade items
    ((1...$data_items.size).to_a - RMXOS::Data::NoTradeItems).each {|i|
      # add item
      @data.push($data_items[i])
    }
    # set size
    @item_max = @data.size
  end
  #----------------------------------------------------------------------------
  # Draws all items.
  #----------------------------------------------------------------------------
  def draw_items
    (0...@item_max).each {|i| draw_item(i)}
  end  
  #----------------------------------------------------------------------------
  # Draws one item completely.
  #  i - item index
  #----------------------------------------------------------------------------
  def draw_item(i)
    y = i * 32
    # clear the display for the item
    self.contents.fill_rect(Rect.new(4, y, 288, 32), Color.new(0, 0, 0, 0))
    # draw icon bitmap
    bitmap = RPG::Cache.icon(@data[i].icon_name)
    opacity = self.contents.font.color == normal_color ? 255 : 128
    self.contents.blt(4, y + 4, bitmap, Rect.new(0, 0, 24, 24), opacity)
    self.contents.font.color = normal_color
    # draw item name
    self.contents.draw_text(32, y, 212, 32, @data[i].name)
    self.draw_item_remaining(i)
  end
  #----------------------------------------------------------------------------
  # Draws the remaining number of an item.
  #  i - item index
  #----------------------------------------------------------------------------
  def draw_item_remaining(i)
    y = i * 32
    # draw number of items left
    self.contents.draw_text(244, y, 16, 32, ':', 1)
    number = $game_party.item_number(@data[i].id)
    self.contents.draw_text(260, y, 24, 32, number.to_s, 2)
  end
  
end

#==============================================================================
# Window_TradePlayer
#------------------------------------------------------------------------------
# Displays items selected for trading.
#==============================================================================

class Window_TradePlayer < Window_TradeItem
  
  #----------------------------------------------------------------------------
  # Adds a selection counter for items.
  #----------------------------------------------------------------------------
  def setup_items
    super
    # for each item
    @data.each_index {|i|
      # if in possession
      if $game_party.item_number(@data[i].id) > 0
        # initialize number of that item
        @items[@data[i].id] = 0
      else
        # delete item
        @data[i] = nil
      end
    }
    # remove all nil values
    @data.compact!
    # set size and autocorrect index
    @item_max = @data.size
    @index = @item_max - 1 if @index >= @item_max
  end
  #----------------------------------------------------------------------------
  # Increases the quantity of an item to trade.
  # Returns: Whether the quantity was changed or not.
  #----------------------------------------------------------------------------
  def increased_quantity
    if @items[@data[@index].id] < $game_party.item_number(@data[@index].id)
      @items[@data[@index].id] += 1
      self.draw_item(@index)
      return true
    end
    return false
  end
  #----------------------------------------------------------------------------
  # Decreases the quantity of an item to trade.
  # Returns: Whether the quantity was changed or not.
  #----------------------------------------------------------------------------
  def decreased_quantity
    if @items[@data[@index].id] > 0
      @items[@data[@index].id] -= 1
      self.draw_item(@index)
      return true
    end
    return false
  end
  #----------------------------------------------------------------------------
  # Draws the remaining number of an item.
  #  i - item index
  #----------------------------------------------------------------------------
  def draw_item_remaining(i)
    y = i * 32
    # draw number of items left
    self.contents.draw_text(220, y, 24, 32, @items[@data[i].id].to_s, 2)
    self.contents.draw_text(244, y, 16, 32, '/', 1)
    number = $game_party.item_number(@data[i].id)
    self.contents.draw_text(260, y, 24, 32, number.to_s, 2)
  end
  
end

#==============================================================================
# Window_TradePartner
#------------------------------------------------------------------------------
# Displays items from the other player selected for trading.
#==============================================================================

class Window_TradePartner < Window_TradeItem
  
  #----------------------------------------------------------------------------
  # Initialization
  #----------------------------------------------------------------------------
  def initialize
    super
    self.x = 320
  end
  #----------------------------------------------------------------------------
  # Refreshes the display upon item change.
  #----------------------------------------------------------------------------
  def update
    super if self.active
    if @items != $game_temp.trade_items
      # remove 0 count items
      $game_temp.trade_items.keys.each {|i|
        $game_temp.trade_items.delete(i) if $game_temp.trade_items[i] == 0
      }
      # refresh the display
      setup_items
      refresh
    end
  end
  #----------------------------------------------------------------------------
  # Adds a selection counter for items.
  #----------------------------------------------------------------------------
  def setup_items
    super
    # for each item
    @data.each_index {|i|
      # that is not in the list
      if $game_temp.trade_items[@data[i].id] == nil
        # delete it
        @data[i] = nil
      end
    }
    # remove all nil values
    @data.compact!
    # set number of that item
    @items = $game_temp.trade_items
    # set size and autocorrect index
    @item_max = @data.size
    @index = @item_max - 1 if @index >= @item_max
  end
  #----------------------------------------------------------------------------
  # Draws the remaining number of an item.
  #  i - item index
  #----------------------------------------------------------------------------
  def draw_item_remaining(i)
    y = i * 32
    # draw number of items for trade
    self.contents.draw_text(244, y, 16, 32, ':', 1)
    self.contents.draw_text(260, y, 24, 32, @items[@data[i].id].to_s, 2)
  end
  
end

#==============================================================================
# Scene_BaseRMXOS
#------------------------------------------------------------------------------
# Serves as superclass for special scenes used in RMX-OS. This class is used
# for consistency, a stable framework and reusability to minimize the amount
# of coding that needs to be done. It is an abstract class and should not be
# instantiated as such.
#==============================================================================

class Scene_BaseRMXOS

  #----------------------------------------------------------------------------
  # Main loop for RMX-OS scenes.
  #----------------------------------------------------------------------------
  def main
    setup_scene
    create_scene
    start_scene
    loop do
      Graphics.update
      Input.update
      update
      break if $scene != self
    end
    finish_scene
    finalize_scene
    dispose_scene
  end
  #----------------------------------------------------------------------------
  # Sets up different parameters used in the scene. Abstract method.
  #----------------------------------------------------------------------------
  def setup_scene
  end
  #----------------------------------------------------------------------------
  # Sets up visual elements of a scene. Abstract method.
  #----------------------------------------------------------------------------
  def create_scene
  end
  #----------------------------------------------------------------------------
  # Starts the scene.
  #----------------------------------------------------------------------------
  def start_scene
    Graphics.transition
  end
  #----------------------------------------------------------------------------
  # Finishes the scene.
  #----------------------------------------------------------------------------
  def finish_scene
    Graphics.freeze
  end
  #----------------------------------------------------------------------------
  # Finalizes all non-visual data in the scene. Abstract method.
  #----------------------------------------------------------------------------
  def finalize_scene
  end
  #----------------------------------------------------------------------------
  # Disposes all visual elements of the scene. Abstract method.
  #----------------------------------------------------------------------------
  def dispose_scene
  end
  #----------------------------------------------------------------------------
  # Updates the scene's behavior.
  #----------------------------------------------------------------------------
  def update
    $scene = nil if Input.trigger?(Input::B)
  end
  
end

#==============================================================================
# Scene_Network
#------------------------------------------------------------------------------
# Serves as superclass for all network based scenes during the connection to
# the server.
#==============================================================================

class Scene_Network < Scene_BaseRMXOS
  
  #----------------------------------------------------------------------------
  # Initialization.
  #  helptext - the text displayed initially in the help window.
  #----------------------------------------------------------------------------
  def initialize(helptext)
    @helptext = helptext
  end
  #----------------------------------------------------------------------------
  # Adds a wait count.
  #----------------------------------------------------------------------------
  def setup_scene
    super
    @wait_count = 0
  end
  #----------------------------------------------------------------------------
  # Creates a title screen background, a version display and a help window.
  #----------------------------------------------------------------------------
  def create_scene
    # play the title music
    $game_system.bgm_play($data_system.title_bgm)
    # stop playing ME and BGS
    Audio.me_stop
    Audio.bgs_stop
    # load the title screen
    @background = Sprite.new
    @background.bitmap = RPG::Cache.title($data_system.title_name)
    # create a sprite displaying the version of RMX-OS
    @version = Sprite.new
    @version.x, @version.y = 4, RMXOS::Data::SCREEN_HEIGHT - 32
    @version.bitmap = Bitmap.new(160, 32)
    # if using Dyna Edition scripts
    if $fontface != nil
      # set font name and size
      @version.bitmap.font.name = $fontface
    # if using PK Edition 2
    elsif $defaultfonttype != nil
      # set font name and size
      @version.bitmap.font.name = $defaultfonttype
    end
    @version.bitmap.font.name = 'Arial'
    @version.bitmap.font.size = 24
    @version.bitmap.draw_text(4, 0, 152, 32,
        "#{RMXOS::Data::Version}: #{RMXOS::Options::GAME_VERSION}")
    # create help window
    @help_window = Window_Help.new
    @help_window.set_text(@helptext)
  end
  #----------------------------------------------------------------------------
  # Disposes title screen background and a version display.
  #----------------------------------------------------------------------------
  def dispose_scene
    super
    @background.dispose
    @version.dispose
    @help_window.dispose
  end
  #----------------------------------------------------------------------------
  # Wait for the server to respond to a request. Abstract method.
  # Returns: True or false.
  #----------------------------------------------------------------------------
  def waiting_for_server
    return false
  end
  #----------------------------------------------------------------------------
  # Wait for the server to respond to a request. Abstract method.
  # Returns: True or false.
  #----------------------------------------------------------------------------
  def waiting?
    # if waiting timer active
    if @wait_count > 0
      @wait_count -= 1
      # if timer expired
      if @wait_count == 0
        # server did not respond
        p RMXOS::Data::NoResponse
        return true
      end
      # skip update if waiting for server
      return true if waiting_for_server
      @wait_count = 0
    end
    return false
  end
  
end

#==============================================================================
# Scene_Servers
#------------------------------------------------------------------------------
# Displays a connection dialog to connect to an existing server.
#==============================================================================

class Scene_Servers < Scene_Network
  
  #----------------------------------------------------------------------------
  # Initialization.
  #----------------------------------------------------------------------------
  def initialize
    super(RMXOS::Data::SelectServer)
  end
  #----------------------------------------------------------------------------
  # Adds several variables used in this scene.
  #----------------------------------------------------------------------------
  def setup_scene
    super
    @refresh_count = 1
    @server_states = []
    # for each server add a server state and test state text
    RMXOS::Options::SERVERS.size.times {@server_states.push(false)}
    # create game data
    create_game_data
  end
  #----------------------------------------------------------------------------
  # Creates initial instances of the game classes.
  #----------------------------------------------------------------------------
  def create_game_data
    $game_temp          = Game_Temp.new
    $game_system        = Game_System.new
    $game_switches      = Game_Switches.new
    $game_variables     = Game_Variables.new
    $game_self_switches = Game_SelfSwitches.new
    $game_screen        = Game_Screen.new
    $game_actors        = Game_Actors.new
    $game_party         = Game_Party.new
    $game_troop         = Game_Troop.new
    $game_map           = Game_Map.new
    $game_player        = Game_Player.new
  end
  #----------------------------------------------------------------------------
  # Creates a display for available servers and whether they are online or not.
  #----------------------------------------------------------------------------
  def create_scene
    super
    # get all server names
    server_names = []
    RMXOS::Options::SERVERS.each {|server| server_names.push(server.name)}
    server_names.push(RMXOS::Data::Exit)
    # create server selection window
    @server_window = Window_ServerCommand.new(224, server_names)
    @server_window.x = 32
    @server_window.y = (RMXOS::Data::SCREEN_HEIGHT - @server_window.height) / 2
    @server_window.y = 96 if @server_window.y < 96
    if @server_window.height > RMXOS::Data::SCREEN_HEIGHT - 128
      @server_window.height = RMXOS::Data::SCREEN_HEIGHT - 128
    end
    @server_window.active = true
    @server_window.index = 0
    # create server states window
    states = []
    @server_states.size.times {states.push(RMXOS::Data::ServerOffline)}
    @online_window = Window_ServerCommand.new(
        RMXOS::Data::SCREEN_WIDTH - 320, states)
    @online_window.x, @online_window.y = 288, @server_window.y
    if @online_window.height > RMXOS::Data::SCREEN_HEIGHT - 160
      @online_window.height = RMXOS::Data::SCREEN_HEIGHT - 160
    end
    @online_window.active = false
    @online_window.index = -1
  end
  #----------------------------------------------------------------------------
  # Refreshes the online status of the servers.
  #----------------------------------------------------------------------------
  def refresh_server_states
    states = self.make_server_states
    @online_window.set_commands(states)
    Graphics.update
  end
  #----------------------------------------------------------------------------
  # Refreshes the online status of the servers.
  #----------------------------------------------------------------------------
  def make_server_states
    states = []
    RMXOS::Options::SERVERS.each_index {|i|
      # add online/offline text
      states.push(@server_states[i] ? RMXOS::Data::ServerOnline :
          RMXOS::Data::ServerOffline)
    }
    # for each server
    RMXOS::Options::SERVERS.each_index {|i|
      # this server is being tested now
      states[i] = RMXOS::Data::ServerTesting
      # refresh server display
      @online_window.set_commands(states)
      Graphics.update
      # if server is actually available
      if @server_states[i] != nil
        # get connection data
        server = RMXOS::Options::SERVERS[i]
        # test connection to server and store the result
        @server_states[i] = $network.test_connection(server.host, server.port, i)
        # add online/offline text
        if @server_states[i]
          states[i] = RMXOS::Data::ServerOnline
        else
          states[i] = RMXOS::Data::ServerOffline
        end
      else
        states[i] = RMXOS::Data::ServerOffline
      end
    }
    return states
  end
  #----------------------------------------------------------------------------
  # Disposes the windows.
  #----------------------------------------------------------------------------
  def dispose_scene
    super
    @server_window.dispose
    @online_window.dispose
  end
  #----------------------------------------------------------------------------
  # Updates the scene's behavior.
  #----------------------------------------------------------------------------
  def update
    return if waiting?
    # check for server connections
    check_server_states
    @server_window.update
    @online_window.oy = @server_window.oy
    # if pressed cancel
    if Input.trigger?(Input::B)
      # exit
      $game_system.se_play($data_system.cancel_se)
      $scene = nil
    # if pressed confirm
    elsif Input.trigger?(Input::C)
      # if last command
      if @server_window.index == RMXOS::Options::SERVERS.size
        # exit
        $game_system.se_play($data_system.decision_se)
        $scene = nil
      # if selected server is tested to be online
      elsif @server_states[@server_window.index]
        $game_system.se_play($data_system.decision_se)
        @online_window.draw_command(@server_window.index, RMXOS::Data::Connecting)
        Graphics.update
        # get data
        server = RMXOS::Options::SERVERS[@server_window.index]
        $network.start_connection(server.host, server.port)
        $network.request_connection
        # set waiting timer for server answer
        @wait_count = RMXOS::Options::SERVER_TIMEOUT
        @refresh_count = RMXOS::Options::SERVER_REFRESH
      else
        $game_system.se_play($data_system.buzzer_se)
      end
    end
  end
  #----------------------------------------------------------------------------
  # Checks for server connections when necessary.
  #----------------------------------------------------------------------------
  def check_server_states
    # decrease timer
    @refresh_count -= 1
    # if timer expired
    if @refresh_count <= 0 || Input.trigger?(Input::F5)
      refresh_server_states
      # renew timer
      @refresh_count = RMXOS::Options::SERVER_REFRESH
    end
  end
  #----------------------------------------------------------------------------
  # Wait for server to answer to the requested data.
  # Returns: Whether to skip the rest of the update or not.
  #----------------------------------------------------------------------------
  def waiting_for_server
    $network.listen
    # check each message
    $network.messages.each {|message|
      case message
      when RMXOS::CONNECTION_SUCCESS # connection granted
        # proceed to login
        $scene = Scene_Login.new
        return false
      when RMXOS::CONNECTION_DENIED # server is full
        # disconnect from server
        $network.disconnect
        # show error
        @online_window.draw_command(@server_window.index,
            RMXOS::Error::ServerFull, RMXOS::Data::ColorServerError)
        return false
      when RMXOS::CONNECTION_CLIENT_VERSION # client version does not match
        # disconnect from server
        $network.disconnect
        # show error
        @online_window.draw_command(@server_window.index,
            RMXOS::Error.get_client_version_error, RMXOS::Data::ColorServerError)
        return false
      when RMXOS::CONNECTION_GAME_VERSION # game version does not match
        # disconnect from server
        $network.disconnect
        # show error
        @online_window.draw_command(@server_window.index,
            RMXOS::Error.get_game_version_error, RMXOS::Data::ColorServerError)
        return false
      end
    }
    return true
  end
  
end

#==============================================================================
# Scene_UserPass
#------------------------------------------------------------------------------
# Handles scenes where the player is prompted for a username and password.
# This class is abstract and should not be instantiated as such.
#==============================================================================

class Scene_UserPass < Scene_Network
  
  #----------------------------------------------------------------------------
  # Creates all necessary visuals.
  #----------------------------------------------------------------------------
  def create_scene
    super
    create_windows
    create_buttons
  end
  #----------------------------------------------------------------------------
  # Creates all windows.
  #----------------------------------------------------------------------------
  def create_windows
    @input_frames = []
    y, h1, h2 = self._get_window_ys
    # create username and password windows
    @username_window = Frame_Caption.new(32, y,
        RMXOS::Data::SCREEN_WIDTH - 64, RMXOS::Data::Username)
    @password_window = Frame_Caption.new(32, y + 32 + h1,
        RMXOS::Data::SCREEN_WIDTH - 64, RMXOS::Data::Password)
    @password_window.password_char = RMXOS::Data::PassChar
    @password_window.active = false
    @input_frames.push(@username_window)
    @input_frames.push(@password_window)
  end
  #----------------------------------------------------------------------------
  # Prepares button array.
  #----------------------------------------------------------------------------
  def create_buttons
    @buttons = []
  end
  #----------------------------------------------------------------------------
  # Removes all visuals.
  #----------------------------------------------------------------------------
  def dispose_scene
    super
    @input_frames.each {|window| window.dispose}
    @buttons.each {|button| button.dispose}
  end
  #----------------------------------------------------------------------------
  # Calculates the GUI element positions depending on screen height
  # Returns: Y coordinate of first window, offset height between frames and
  #          additional offset height for buttons.
  #----------------------------------------------------------------------------
  def _get_window_ys
    y, h1, h2 = 128, 32, 32
    if RMXOS::Data::SCREEN_HEIGHT < 480
      y -= (480 - RMXOS::Data::SCREEN_HEIGHT) / 2
      y = 96 if y < 96
      h2 = 0
      if RMXOS::Data::SCREEN_HEIGHT < 384
        h1 = (RMXOS::Data::SCREEN_HEIGHT - 288) / 3
      end
    end
    return [y, h1, h2]
  end
  #----------------------------------------------------------------------------
  # Updates the scene's behavior.
  #----------------------------------------------------------------------------
  def update
    $network.listen
    return if waiting?
    # update username window and password window if they are active
    @input_frames.each {|window| window.update if window.active}
    @buttons.each {|button| button.update}
    # if pressed cancel
    if Input.trigger?(Input::B)
      $game_system.se_play($data_system.cancel_se)
      command_cancel
    # if pressed confirm
    elsif Input.trigger?(Input::C)
      command_confirm
    # if pressed down
    elsif Input.repeat?(Input::DOWN)
      command_down
    # if pressed up
    elsif Input.repeat?(Input::UP)
      command_up
    # if pressed left
    elsif Input.repeat?(Input::LEFT)
      command_left
    # if pressed right
    elsif Input.repeat?(Input::RIGHT)
      command_right
    end
  end
  #----------------------------------------------------------------------------
  # Executed upon choosing the "cancel" choice. Abstract method.
  #----------------------------------------------------------------------------
  def command_cancel
  end
  #----------------------------------------------------------------------------
  # Executed upon choosing the "confirm" choice.
  #----------------------------------------------------------------------------
  def command_confirm
    # if confirm button active
    if @buttons[0].index == 0
      $game_system.se_play($data_system.decision_se)
      submit_to_server
    # if cancel button active
    elsif @buttons[@buttons.size - 1].index == 0
      $game_system.se_play($data_system.decision_se)
      command_cancel
    # if bottom input frame is active
    elsif @input_frames[@input_frames.size - 1].active
      $game_system.se_play($data_system.decision_se)
      submit_to_server
    # if username window active
    else
      # switch to next input frame if possible
      window = @input_frames.find {|w| w.active}
      if window != nil
        $game_system.se_play($data_system.decision_se)
        window.active = false
        @input_frames[@input_frames.index(window) + 1].active = true
      end
    end
  end
  #----------------------------------------------------------------------------
  # Submits data to the server.
  #----------------------------------------------------------------------------
  def submit_to_server
    @wait_count = RMXOS::Options::SERVER_TIMEOUT
  end
  #----------------------------------------------------------------------------
  # Saves current username and password.
  #----------------------------------------------------------------------------
  def save_user_pass
    # if login remember option is on
    if RMXOS::Options::REMEMBER_LOGIN
      # create data stream
      stream = "#{@username_window.text}\t#{@password_window.text}"
      # zip stream
      rawdata = Zlib::Deflate.deflate(stream, 9)
      # save stream into file
      file = File.open('account.dat', 'wb')
      file.write(rawdata)
      file.close
    end
  end
  #----------------------------------------------------------------------------
  # Executed upon pressing "down".
  #----------------------------------------------------------------------------
  def command_down
    $game_system.se_play($data_system.cursor_se)
    # if last frame active
    if @input_frames[@input_frames.size - 1].active
      @input_frames[@input_frames.size - 1].active = false
      @buttons[0].index = 0
    else
      # switch to next input frame if possible
      window = @input_frames.find {|w| w.active}
      if window != nil
        window.active = false
        @input_frames[@input_frames.index(window) + 1].active = true
      else
        # switch to username window
        @buttons.each {|button| button.index = -1}
        @input_frames[0].active = true
      end
    end
  end
  #----------------------------------------------------------------------------
  # Executed upon pressing "up".
  #----------------------------------------------------------------------------
  def command_up
    $game_system.se_play($data_system.cursor_se)
    # if last frame active
    if @input_frames[0].active
      @input_frames[0].active = false
      @buttons[0].index = 0
    else
      # switch to next input frame if possible
      window = @input_frames.find {|w| w.active}
      if window != nil
        window.active = false
        @input_frames[@input_frames.index(window) - 1].active = true
      else
        # switch to username window
        @buttons.each {|button| button.index = -1}
        @input_frames[@input_frames.size - 1].active = true
      end
    end
  end
  #----------------------------------------------------------------------------
  # Executed upon pressing "left".
  #----------------------------------------------------------------------------
  def command_left
    # check each button
    @buttons.each_index {|i|
      # if active
      if @buttons[i].index == 0
        $game_system.se_play($data_system.cursor_se)
        # circularry switch to the left button
        @buttons[i].index = -1
        @buttons[(i + @buttons.size - 1) % @buttons.size].index = 0
        return
      end
    }
  end
  #----------------------------------------------------------------------------
  # Executed upon pressing "right".
  #----------------------------------------------------------------------------
  def command_right
    # check each button
    @buttons.each_index {|i|
      # if active
      if @buttons[i].index == 0
        $game_system.se_play($data_system.cursor_se)
        # circularry switch to the right button
        @buttons[i].index = -1
        @buttons[(i + 1) % @buttons.size].index = 0
        return
      end
    }
  end
  
end

#==============================================================================
# Scene_Login
#------------------------------------------------------------------------------
# Handles logging in of a player.
#==============================================================================

class Scene_Login < Scene_UserPass
  
  #----------------------------------------------------------------------------
  # Initialization.
  #----------------------------------------------------------------------------
  def initialize
    super(RMXOS::Data::EnterUserPass)
  end
  #----------------------------------------------------------------------------
  # Makes the password characters disappear and loads account.dat.
  #----------------------------------------------------------------------------
  def create_windows
    super
    # stop if not active or file doesn't exist
    return if !RMXOS::Options::REMEMBER_LOGIN || !FileTest.exist?('account.dat')
    # read data from file
    file = File.open('account.dat', 'rb')
    rawdata = file.read
    file.close
    # stop if file was empty
    return if rawdata.size == 0
    begin
      # unzip data from file
      lines = Zlib::Inflate.inflate(rawdata).split("\t")
      # if file data is valid
      if lines.size == 2
        # set read username and password
        @username_window.text, @password_window.text = lines
        @username_window.cursor_move_to_end
        @username_window.update_cursor
        @password_window.cursor_move_to_end
      end
    rescue
    end
  end
  #----------------------------------------------------------------------------
  # Creates all buttons.
  #----------------------------------------------------------------------------
  def create_buttons
    super
    y, h1, h2 = self._get_window_ys
    y += 96 + h1 * 3 + h2
    w = (RMXOS::Data::SCREEN_WIDTH - 64) / 3
    # create Login button
    @buttons.push(Window_Button.new(32, y, w, RMXOS::Data::Login))
    # create Register button
    @buttons.push(Window_Button.new(32 + w, y, w, RMXOS::Data::Register))
    # create Cancel button
    @buttons.push(Window_Button.new(32 + w * 2, y, w, RMXOS::Data::Cancel))
  end
  #----------------------------------------------------------------------------
  # Executed upon choosing the "cancel" choice.
  #----------------------------------------------------------------------------
  def command_cancel
    # disconnect
    $network.disconnect
    # return to server selection
    $scene = Scene_Servers.new
  end
  #----------------------------------------------------------------------------
  # Executed upon choosing the "confirm" choice.
  #----------------------------------------------------------------------------
  def command_confirm
    # if register button is active
    if @buttons[1].index == 0
      # proceed to registering
      $game_system.se_play($data_system.decision_se)
      $scene = Scene_Register.new
    else
      super
    end
  end
  #----------------------------------------------------------------------------
  # Submits the player login request to the server.
  #----------------------------------------------------------------------------
  def submit_to_server
    # try to login
    $network.try_login(@username_window.text, @password_window.text)
    # show waiting message
    @help_window.set_text(RMXOS::Data::LoggingIn)
    super
  end
  #----------------------------------------------------------------------------
  # Wait for server to answer to the requested data.
  # Returns: Whether to skip the rest of the update or not.
  #----------------------------------------------------------------------------
  def waiting_for_server
    # check each message
    $network.messages.each {|message|
      case message
      when RMXOS::LOGIN_SUCCESS # login was a success
        # display messsage
        @help_window.set_text(RMXOS::Data::LoggedIn)
        # save username and password
        save_user_pass
        # proceed to game
        $scene = Scene_Loading.new
        return false
      when RMXOS::LOGIN_NOUSER # username does not exist
        # display messsage
        @help_window.set_text(RMXOS::Data::NoUsername)
        return false
      when RMXOS::LOGIN_NOPASS # wrong password
        # display messsage
        @help_window.set_text(RMXOS::Data::WrongPassword)
        return false
      when RMXOS::LOGIN_BANNED # banned
        # display messsage
        @help_window.set_text(RMXOS::Data::Banned)
        return false
      end
    }
    return true
  end
  
end

#==============================================================================
# Scene_Register
#------------------------------------------------------------------------------
# Handles registering of a player.
#==============================================================================

class Scene_Register < Scene_UserPass
  
  #----------------------------------------------------------------------------
  # Initialization.
  #----------------------------------------------------------------------------
  def initialize
    super(RMXOS::Data::RegisterUserPass)
  end
  #----------------------------------------------------------------------------
  # Creates all windows.
  #----------------------------------------------------------------------------
  def create_windows
    super
    @confirm_window = Frame_Caption.new(
        @password_window.x, @password_window.y * 2 - @username_window.y,
        @password_window.width, RMXOS::Data::Repeat)
    @confirm_window.password_char = RMXOS::Data::PassChar
    @confirm_window.active = false
    @input_frames.push(@confirm_window)
  end
  #----------------------------------------------------------------------------
  # Creates all buttons.
  #----------------------------------------------------------------------------
  def create_buttons
    super
    y, h1, h2 = self._get_window_ys
    y += 96 + h1 * 3 + h2
    w = (RMXOS::Data::SCREEN_WIDTH - 64) / 2
    # create Submit button
    @buttons.push(Window_Button.new(32, y, w, RMXOS::Data::Submit))
    # create Cancel button
    @buttons.push(Window_Button.new(32 + w, y, w, RMXOS::Data::Cancel))
  end
  #----------------------------------------------------------------------------
  # Executed upon choosing the "cancel" choice.
  #----------------------------------------------------------------------------
  def command_cancel
    $scene = Scene_Login.new
  end
  #----------------------------------------------------------------------------
  # Submits the player register request to the server.
  #----------------------------------------------------------------------------
  def submit_to_server
    # if username too short
    if @username_window.text.size < RMXOS::Options::USERPASS_MIN_LENGTH
      @help_window.set_text(RMXOS::Data::UserTooShort)
    # if username is reserved
    elsif RMXOS.reserved_username?(@username_window.text)
      @help_window.set_text(RMXOS::Data::UserReserved)
    # if password too short
    elsif @password_window.text.size < RMXOS::Options::USERPASS_MIN_LENGTH
      @help_window.set_text(RMXOS::Data::PassTooShort)
    # if password not repeated properly
    elsif @password_window.text != @confirm_window.text
      @help_window.set_text(RMXOS::Data::PassNotRepeated)
    else
      # try to register
      $network.try_register(@username_window.text, @password_window.text)
      # show waiting message
      @help_window.set_text(RMXOS::Data::Registering)
      super
    end
  end
  #----------------------------------------------------------------------------
  # Wait for server to answer to the requested data.
  # Returns: Whether to skip the rest of the update or not.
  #----------------------------------------------------------------------------
  def waiting_for_server
    # check each message
    $network.messages.each {|message|
      case message
      when RMXOS::REGISTER_SUCCESS # register was a success
        # display messsage
        @help_window.set_text(RMXOS::Data::UserRegistered)
        # save username and password
        save_user_pass
        # proceed to game
        $scene = Scene_Loading.new
        return false
      when RMXOS::REGISTER_BANNED # banned
        # display messsage
        @help_window.set_text(RMXOS::Data::Banned)
        return false
      when RMXOS::REGISTER_EXIST # username already exists
        # display messsage
        @help_window.set_text(RMXOS::Data::UserRegisteredAlready)
        return false
      end
    }
    return true
  end
  
end

#==============================================================================
# Scene_Loading
#------------------------------------------------------------------------------
# Waits for the server to send all saved game data.
#==============================================================================

class Scene_Loading < Scene_Network
  
  #----------------------------------------------------------------------------
  # Initialization.
  #----------------------------------------------------------------------------
  def initialize
    # send a loading request to the server pre-emptively
    $network.send_load_request
    super(RMXOS::Data::ReceivingMessage.sub('NOW', '0').sub('MAX', '???'))
  end
  #----------------------------------------------------------------------------
  # Waits for server to send all loading data to be able to load the game.
  #----------------------------------------------------------------------------
  def update
    $network.listen
    loading_end = false
    # check each message
    $network.messages.each {|message|
      case message
      when RMXOS::LOADING_UPDATE
        size = $network.load_sizes.shift
        text = RMXOS::Data::ReceivingMessage.sub(
            'NOW', size.to_s).sub('MAX', $network.load_size.to_s)
        @help_window.set_text(text)
        5.times {Graphics.update} if size == $network.load_size
      when RMXOS::LOADING_END # game has been loaded
        @help_window.set_text(RMXOS::Data::LoadingMessage)
        5.times {Graphics.update}
        loading_end = true
      end
    }
    if loading_end
      # load game and proceed to map
      self.load_game
      $scene = Scene_Map.new
    end
  end
  #----------------------------------------------------------------------------
  # Sets up the map data for a loaded game. In case the game of a newly
  # registered user, a new game will be started.
  #----------------------------------------------------------------------------
  def load_game
    # if game was loaded
    if $game_map.map_id != 0
      # setup map and player
      $game_map.setup($game_map.map_id)
      $game_player.center($game_player.x, $game_player.y)
    else
      # start a new game
      $game_party.setup_starting_members
      $game_map.setup($data_system.start_map_id)
      $game_player.moveto($data_system.start_x, $data_system.start_y)
    end
    # prepare everything for starting the game
    $game_party.refresh
    $game_player.refresh
    $game_map.autoplay
    $game_temp.entering_map = true
    $game_map.update
  end
  
end