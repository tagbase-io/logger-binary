defmodule LoggerBinary do
  @moduledoc """
  A custom `Logger` formatter for handling binary data.

  This formatter is designed to correctly format binary messages. It converts
  non-printable binary data into a hexadecimal string representation and can
  optionally add a directional indicator (`"< "` or `"> "`) when needed.

  ## Features

    * Formats binary messages as uppercase hexadecimal strings.
    * Prepends formatted binary messages with a directional indicator if the `:direction`
      metadata is present. Supported values for the `:direction` metadata are `:in` and `:out`.
    * Uses the default Logger format for all other types of messages (e.g., printable strings and charlists).

  ## Direction Indicator

  You can add the `:direction` metadata to your log messages to indicate if the
  binary data is an incoming or outgoing message:

      Logger.debug(<<0x01, 0x02, 0x03>>, direction: :in)
      # Logs: "[debug] < 01 02 03"

      Logger.debug(<<0x01, 0x02, 0x03>>, direction: :out)
      # Logs: "[debug] > 01 02 03"

  Without directional metadata, it simply logs the formatted binary:

      Logger.debug(<<0x01, 0x02, 0x03>>)
      # Logs: "[debug] 01 02 03"
  """
end
