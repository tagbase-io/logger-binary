import Config

config :logger, :console,
  format: {LoggerBinary.Formatter, :format},
  metadata: [:direction]
