class Foo < ActiveRecord::Base
  
  include ForkBreak::Breakpoints
  
  def repro
    breakpoints << :transaction
  end

  def self.demo
    process1 = ForkBreak::Process.new {
      Foo.new.repro
    }
    process1.run_until(:transaction).wait
  end
    
end
