module Gol
  class World
    def initialize(attrs = {})
      attrs.each do |k, v|
        send("#{k}=", v)
      end

      @dying = []
      @birthing = []
    end

    def self.empty
      new(cells: [])
    end

    def empty?
      living_cells.count.zero?
    end

    def living_cells
      cells.select(&:alive?)
    end

    def tick
      mark_cells_for_next_generation
      kill_dying_cells
      create_birthing_cells
    end

    def add_living(location)
      @cells << LivingCell.new(location)
    end

    def add_dead(location)
      @cells << DeadCell.new(location)
    end

    private
    attr_accessor :cells, :dying, :birthing

    def mark_for_dead(cell)
      @dying << cell
    end

    def come_to_life(cell)
      @birthing << cell
    end

    def mark_cells_for_next_generation
      cells.each do |cell|
        mark_for_dead(cell) unless cell.alive? && cell.stays_alive?
        come_to_life(cell) if !cell.alive? && cell.coming_to_life?
      end
    end

    def kill_dying_cells
      dying.each do |cell|
        cells.delete(cell)
        add_dead(cell.location)
      end
    end

    def create_birthing_cells
      birthing.each do |cell|
        cells.delete(cell)
        add_living(cell.location)
      end
    end
  end
end
