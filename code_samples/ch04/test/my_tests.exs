Code.load_file("#{__DIR__}/../../test_helper.exs")

defmodule Test do
  use ExUnit.Case, async: false
  import TestHelper

  @test_file "#{__DIR__}/test_file"

  test_script "my_todo_list" do
    list = TodoList.CsvImporter.import("#{__DIR__}/../todos.csv")

    assert [%{date: ~D[2018-12-20], id: 2, title: "Shopping"}] ==
             TodoList.entries(list, ~D[2018-12-20])
  end
end
