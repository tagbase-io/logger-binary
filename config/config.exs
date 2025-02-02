import Config

config :logger, LoggerBinary.Formatter, format: "[$level] $message\n"

config :logger, :console,
  format: {LoggerBinary.Formatter, :format},
  metadata: [:direction]
