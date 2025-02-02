defmodule LoggerBinary.Formatter do
  @moduledoc false

  @default_format Logger.Formatter.compile(
                    Application.compile_env(:logger, [__MODULE__, :format], "[$level] $message\n")
                  )

  def format(level, message, timestamp, metadata) when is_binary(message) do
    message =
      if String.printable?(message) do
        message
      else
        formatted_message =
          message
          |> Base.encode16(case: :upper)
          |> String.graphemes()
          |> Enum.chunk_every(2)
          |> Enum.map_join(" ", &Enum.join(&1))

        case Keyword.get(metadata, :direction) do
          :in -> "< " <> formatted_message
          :out -> "> " <> formatted_message
          _ -> formatted_message
        end
      end

    Logger.Formatter.format(@default_format, level, message, timestamp, metadata)
  end

  def format(level, message, timestamp, metadata) do
    Logger.Formatter.format(@default_format, level, message, timestamp, metadata)
  end
end
