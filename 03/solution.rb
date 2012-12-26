class Expr
  def self.build(tree)
    tree.size == 3 ? Binary.build(tree) : Unary.build(tree)
  end

  def initialize()
    @env = {}
  end

  def evaluate(*env)
    @env = env
  end

  protected

  def tree
    @tree
  end
end

class Binary < Expr
  def self.build(tree)
    @left = tree[1]
    @right = tree[2]

    case tree.first
      when :* then Multiplication.build tree
      when :+ then Addition.build tree
    end
  end

  def ==(other)
    @left == other.left and @right == other.right
  end
end

class Unary < Expr
  def self.build(tree)
    @arg = tree[1]

    case tree.first
      when :number   then Number.build tree
      when :variable then Variable.build tree
      when :-        then Negation.build tree
      when :sin      then Sin.build tree
      when :cos      then Cos.build tree
    end
  end

  def ==(other)
    @arg == other.arg
  end
end  
