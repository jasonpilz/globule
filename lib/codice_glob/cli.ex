defmodule CodiceGlob.CLI do
  def main(_args \\ []) do
    process()
  end

  defp process do
    combine_sources()
    |> sanitize_output
    |> write_to_file
  end

  defp combine_sources do
    {:ok, pid} = StringIO.open("")

    for dir <- sources(), extension <- extensions() do
      Path.wildcard(Path.join([dir, "/**/*"]) <> extension)
      |> Enum.each(fn (path) ->
        {:ok, code} = File.read(path)

        IO.write(pid, code)
      end)
    end

    pid
  end

  defp sanitize_output(pid) do
    pid
    |> StringIO.flush
    |> String.trim
    |> String.replace(~r/\s*\n+\s*/, " ")
    |> String.replace(~r/\s+/, " ")
  end

  defp write_to_file(data) do
    {:ok, device} = File.open("./code", [:write, :utf8])

    IO.write(device, data)

    File.close(device)
  end

  defp sources do
    [
      "app",
      "lib",
      "test",
      "spec"
    ]
  end

  defp extensions do
    [
      ".ex",
      ".exs",
      ".rb",
      ".js"
    ]
  end
end
