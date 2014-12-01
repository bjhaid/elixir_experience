defmodule ElixirProblems.ProblemList do
  @agent_name __MODULE__

  def start_link do
    Agent.start_link(&ElixirProblems.Problem.load_all/0, name: @agent_name)
  end

  def get_problem(number) do
    Agent.get(@agent_name, fn list ->
      Enum.at(list, number - 1)
    end)
  end

  def number_of_problems do
    Agent.get(@agent_name, fn list -> Enum.count(list) end)
  end
end