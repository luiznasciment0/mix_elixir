defmodule Foto do
  alias Foto.Imagem
  defmodule Imagem do
    defstruct hex: nil, cor: nil
  end

  def main(input) do
    input
    |> hash_input
    |> definir_cor
  end

  defp hash_input(input) do
    hex =
      :crypto.hash(:md5, input)
      |> :binary.bin_to_list

    %Foto.Imagem{hex: hex}
  end

  defp definir_cor(%Imagem{hex: [r, g, b | _resto]} = imagem), do: %Imagem{imagem | cor: [r, g, b]}
end
