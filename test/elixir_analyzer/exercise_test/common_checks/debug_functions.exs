# credo:disable-for-this-file Credo.Check.Warning.IoInspect
defmodule ElixirAnalyzer.Support.AnalyzerVerification.DebugFunctions do
  use ElixirAnalyzer.ExerciseTest
end

defmodule ElixirAnalyzer.ExerciseTest.CommonChecks.DebugFunctionsTest do
  use ElixirAnalyzer.ExerciseTestCase,
    exercise_test_module: ElixirAnalyzer.Support.AnalyzerVerification.DebugFunctions

  alias ElixirAnalyzer.Constants

  test_exercise_analysis "solutions which do not use debug functions", comments: [] do
    [
      defmodule MyModule do
        def debug_functions() do
          IO.puts("This is MyModule")
        end
      end
    ]
  end

  test_exercise_analysis "solutions which use debug functions",
    comments: [Constants.solution_debug_functions()] do
    [
      defmodule MyModule do
        def debug_function_io_inspect() do
          IO.inspect("This is MyModule")
        end
      end,
      defmodule MyModule do
        def debug_function_kernel_dbg() do
          Kernel.dbg()
        end
      end,
      defmodule MyModule do
        def debug_function_dbg() do
          dbg()
        end
      end
    ]
  end
end
