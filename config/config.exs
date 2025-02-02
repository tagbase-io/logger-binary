import Config

config :logger, :console,
  format: {LoggerBinary.Formatter, :format},
  metadata: [:direction]

config :logger, LoggerBinary.Formatter, format: "[$level] $message\n"
