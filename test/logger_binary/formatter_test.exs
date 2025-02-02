defmodule LoggerBinary.FormatterTest do
  use ExUnit.Case, async: true

  import ExUnit.CaptureLog

  require Logger

  test "formats binary data" do
    assert capture_log(fn ->
             Logger.debug(<<0x01, 0x02, 0x03>>)
           end) =~ "[debug] 01 02 03"
  end

  test "formats binary input" do
    assert capture_log(fn ->
             Logger.debug(<<0x01, 0x02, 0x03>>, direction: :in)
           end) =~ "[debug] < 01 02 03"
  end

  test "formats binary output" do
    assert capture_log(fn ->
             Logger.debug(<<0x01, 0x02, 0x03>>, direction: :out)
           end) =~ "[debug] > 01 02 03"
  end

  test "ignores any other binary message" do
    assert capture_log(fn ->
             Logger.debug("message")
           end) =~ "[debug] message"
  end

  test "ignores charlist messages" do
    assert capture_log(fn ->
             Logger.debug(~c"message")
           end) =~ "[debug] message"
  end
end
