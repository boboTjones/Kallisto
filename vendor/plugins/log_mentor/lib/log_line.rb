# Autogenerated from a Treetop grammar. Edits may be lost.


module LogLine
  include Treetop::Runtime

  def root
    @root ||= :line
  end

  module Line0
    def timestamp
      elements[0]
    end

    def space1
      elements[1]
    end

    def hostname
      elements[2]
    end

    def space2
      elements[3]
    end

    def process_name
      elements[4]
    end

    def space3
      elements[5]
    end

    def message
      elements[6]
    end
  end

  def _nt_line
    start_index = index
    if node_cache[:line].has_key?(index)
      cached = node_cache[:line][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_timestamp
    s0 << r1
    if r1
      r2 = _nt_space
      s0 << r2
      if r2
        r3 = _nt_hostname
        s0 << r3
        if r3
          r4 = _nt_space
          s0 << r4
          if r4
            r5 = _nt_process_name
            s0 << r5
            if r5
              r6 = _nt_space
              s0 << r6
              if r6
                r7 = _nt_message
                s0 << r7
              end
            end
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Line0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:line][start_index] = r0

    r0
  end

  module Timestamp0
    def month
      elements[2]
    end

    def space1
      elements[3]
    end

    def number
      elements[4]
    end

    def space2
      elements[5]
    end

    def time
      elements[6]
    end
  end

  def _nt_timestamp
    start_index = index
    if node_cache[:timestamp].has_key?(index)
      cached = node_cache[:timestamp][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      i1, s1 = index, []
      r3 = _nt_day
      if r3
        r2 = r3
      else
        r2 = instantiate_node(SyntaxNode,input, index...index)
      end
      s1 << r2
      if r2
        r5 = _nt_space
        if r5
          r4 = r5
        else
          r4 = instantiate_node(SyntaxNode,input, index...index)
        end
        s1 << r4
        if r4
          r6 = _nt_month
          s1 << r6
          if r6
            r7 = _nt_space
            s1 << r7
            if r7
              r8 = _nt_number
              s1 << r8
              if r8
                r9 = _nt_space
                s1 << r9
                if r9
                  r10 = _nt_time
                  s1 << r10
                end
              end
            end
          end
        end
      end
      if s1.last
        r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
        r1.extend(Timestamp0)
      else
        @index = i1
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    r0 = instantiate_node(TimeStamp,input, i0...index, s0)

    node_cache[:timestamp][start_index] = r0

    r0
  end

  def _nt_month
    start_index = index
    if node_cache[:month].has_key?(index)
      cached = node_cache[:month][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    if has_terminal?("Jan", false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 3))
      @index += 3
    else
      terminal_parse_failure("Jan")
      r1 = nil
    end
    if r1
      r0 = r1
    else
      if has_terminal?("Feb", false, index)
        r2 = instantiate_node(SyntaxNode,input, index...(index + 3))
        @index += 3
      else
        terminal_parse_failure("Feb")
        r2 = nil
      end
      if r2
        r0 = r2
      else
        if has_terminal?("Mar", false, index)
          r3 = instantiate_node(SyntaxNode,input, index...(index + 3))
          @index += 3
        else
          terminal_parse_failure("Mar")
          r3 = nil
        end
        if r3
          r0 = r3
        else
          if has_terminal?("Apr", false, index)
            r4 = instantiate_node(SyntaxNode,input, index...(index + 3))
            @index += 3
          else
            terminal_parse_failure("Apr")
            r4 = nil
          end
          if r4
            r0 = r4
          else
            if has_terminal?("May", false, index)
              r5 = instantiate_node(SyntaxNode,input, index...(index + 3))
              @index += 3
            else
              terminal_parse_failure("May")
              r5 = nil
            end
            if r5
              r0 = r5
            else
              if has_terminal?("Jun", false, index)
                r6 = instantiate_node(SyntaxNode,input, index...(index + 3))
                @index += 3
              else
                terminal_parse_failure("Jun")
                r6 = nil
              end
              if r6
                r0 = r6
              else
                if has_terminal?("Jul", false, index)
                  r7 = instantiate_node(SyntaxNode,input, index...(index + 3))
                  @index += 3
                else
                  terminal_parse_failure("Jul")
                  r7 = nil
                end
                if r7
                  r0 = r7
                else
                  if has_terminal?("Aug", false, index)
                    r8 = instantiate_node(SyntaxNode,input, index...(index + 3))
                    @index += 3
                  else
                    terminal_parse_failure("Aug")
                    r8 = nil
                  end
                  if r8
                    r0 = r8
                  else
                    if has_terminal?("Sep", false, index)
                      r9 = instantiate_node(SyntaxNode,input, index...(index + 3))
                      @index += 3
                    else
                      terminal_parse_failure("Sep")
                      r9 = nil
                    end
                    if r9
                      r0 = r9
                    else
                      if has_terminal?("Oct", false, index)
                        r10 = instantiate_node(SyntaxNode,input, index...(index + 3))
                        @index += 3
                      else
                        terminal_parse_failure("Oct")
                        r10 = nil
                      end
                      if r10
                        r0 = r10
                      else
                        if has_terminal?("Nov", false, index)
                          r11 = instantiate_node(SyntaxNode,input, index...(index + 3))
                          @index += 3
                        else
                          terminal_parse_failure("Nov")
                          r11 = nil
                        end
                        if r11
                          r0 = r11
                        else
                          if has_terminal?("Dec", false, index)
                            r12 = instantiate_node(SyntaxNode,input, index...(index + 3))
                            @index += 3
                          else
                            terminal_parse_failure("Dec")
                            r12 = nil
                          end
                          if r12
                            r0 = r12
                          else
                            @index = i0
                            r0 = nil
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end

    node_cache[:month][start_index] = r0

    r0
  end

  def _nt_day
    start_index = index
    if node_cache[:day].has_key?(index)
      cached = node_cache[:day][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    if has_terminal?("Sun", false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 3))
      @index += 3
    else
      terminal_parse_failure("Sun")
      r1 = nil
    end
    if r1
      r0 = r1
    else
      if has_terminal?("Mon", false, index)
        r2 = instantiate_node(SyntaxNode,input, index...(index + 3))
        @index += 3
      else
        terminal_parse_failure("Mon")
        r2 = nil
      end
      if r2
        r0 = r2
      else
        if has_terminal?("Tue", false, index)
          r3 = instantiate_node(SyntaxNode,input, index...(index + 3))
          @index += 3
        else
          terminal_parse_failure("Tue")
          r3 = nil
        end
        if r3
          r0 = r3
        else
          if has_terminal?("Wed", false, index)
            r4 = instantiate_node(SyntaxNode,input, index...(index + 3))
            @index += 3
          else
            terminal_parse_failure("Wed")
            r4 = nil
          end
          if r4
            r0 = r4
          else
            if has_terminal?("Thu", false, index)
              r5 = instantiate_node(SyntaxNode,input, index...(index + 3))
              @index += 3
            else
              terminal_parse_failure("Thu")
              r5 = nil
            end
            if r5
              r0 = r5
            else
              if has_terminal?("Fri", false, index)
                r6 = instantiate_node(SyntaxNode,input, index...(index + 3))
                @index += 3
              else
                terminal_parse_failure("Fri")
                r6 = nil
              end
              if r6
                r0 = r6
              else
                if has_terminal?("Sat", false, index)
                  r7 = instantiate_node(SyntaxNode,input, index...(index + 3))
                  @index += 3
                else
                  terminal_parse_failure("Sat")
                  r7 = nil
                end
                if r7
                  r0 = r7
                else
                  @index = i0
                  r0 = nil
                end
              end
            end
          end
        end
      end
    end

    node_cache[:day][start_index] = r0

    r0
  end

  module Time0
  end

  def _nt_time
    start_index = index
    if node_cache[:time].has_key?(index)
      cached = node_cache[:time][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    s1, i1 = [], index
    loop do
      if has_terminal?('\G[0-9]', true, index)
        r2 = true
        @index += 1
      else
        r2 = nil
      end
      if r2
        s1 << r2
      else
        break
      end
    end
    if s1.empty?
      @index = i1
      r1 = nil
    else
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
    end
    s0 << r1
    if r1
      if has_terminal?(':', false, index)
        r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure(':')
        r3 = nil
      end
      s0 << r3
      if r3
        s4, i4 = [], index
        loop do
          if has_terminal?('\G[0-9]', true, index)
            r5 = true
            @index += 1
          else
            r5 = nil
          end
          if r5
            s4 << r5
          else
            break
          end
        end
        if s4.empty?
          @index = i4
          r4 = nil
        else
          r4 = instantiate_node(SyntaxNode,input, i4...index, s4)
        end
        s0 << r4
        if r4
          if has_terminal?(':', false, index)
            r6 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure(':')
            r6 = nil
          end
          s0 << r6
          if r6
            s7, i7 = [], index
            loop do
              if has_terminal?('\G[0-9]', true, index)
                r8 = true
                @index += 1
              else
                r8 = nil
              end
              if r8
                s7 << r8
              else
                break
              end
            end
            if s7.empty?
              @index = i7
              r7 = nil
            else
              r7 = instantiate_node(SyntaxNode,input, i7...index, s7)
            end
            s0 << r7
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Time0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:time][start_index] = r0

    r0
  end

  def _nt_number
    start_index = index
    if node_cache[:number].has_key?(index)
      cached = node_cache[:number][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      if has_terminal?('\G[0-9]', true, index)
        r1 = true
        @index += 1
      else
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
    end

    node_cache[:number][start_index] = r0

    r0
  end

  def _nt_hostname
    start_index = index
    if node_cache[:hostname].has_key?(index)
      cached = node_cache[:hostname][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      if has_terminal?('\G[a-zA-Z]', true, index)
        r1 = true
        @index += 1
      else
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    r0 = instantiate_node(Hostname,input, i0...index, s0)

    node_cache[:hostname][start_index] = r0

    r0
  end

  module ProcessName0
    def pid
      elements[2]
    end
  end

  def _nt_process_name
    start_index = index
    if node_cache[:process_name].has_key?(index)
      cached = node_cache[:process_name][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      i1, s1 = index, []
      r3 = _nt_daemon
      if r3
        r2 = r3
      else
        r2 = instantiate_node(SyntaxNode,input, index...index)
      end
      s1 << r2
      if r2
        r5 = _nt_application_identifier
        if r5
          r4 = r5
        else
          r4 = instantiate_node(SyntaxNode,input, index...index)
        end
        s1 << r4
        if r4
          r6 = _nt_pid
          s1 << r6
        end
      end
      if s1.last
        r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
        r1.extend(ProcessName0)
      else
        @index = i1
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    r0 = instantiate_node(Process,input, i0...index, s0)

    node_cache[:process_name][start_index] = r0

    r0
  end

  module ApplicationIdentifier0
    def dot1
      elements[2]
    end

    def dot2
      elements[4]
    end

  end

  def _nt_application_identifier
    start_index = index
    if node_cache[:application_identifier].has_key?(index)
      cached = node_cache[:application_identifier][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r2 = _nt_mystery_info
    if r2
      r1 = r2
    else
      r1 = instantiate_node(SyntaxNode,input, index...index)
    end
    s0 << r1
    if r1
      s3, i3 = [], index
      loop do
        if has_terminal?('\G[a-zA-Z]', true, index)
          r4 = true
          @index += 1
        else
          r4 = nil
        end
        if r4
          s3 << r4
        else
          break
        end
      end
      if s3.empty?
        @index = i3
        r3 = nil
      else
        r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
      end
      s0 << r3
      if r3
        r5 = _nt_dot
        s0 << r5
        if r5
          s6, i6 = [], index
          loop do
            if has_terminal?('\G[a-zA-Z]', true, index)
              r7 = true
              @index += 1
            else
              r7 = nil
            end
            if r7
              s6 << r7
            else
              break
            end
          end
          if s6.empty?
            @index = i6
            r6 = nil
          else
            r6 = instantiate_node(SyntaxNode,input, i6...index, s6)
          end
          s0 << r6
          if r6
            r8 = _nt_dot
            s0 << r8
            if r8
              s9, i9 = [], index
              loop do
                if has_terminal?('\G[a-zA-Z]', true, index)
                  r10 = true
                  @index += 1
                else
                  r10 = nil
                end
                if r10
                  s9 << r10
                else
                  break
                end
              end
              if s9.empty?
                @index = i9
                r9 = nil
              else
                r9 = instantiate_node(SyntaxNode,input, i9...index, s9)
              end
              s0 << r9
            end
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(ApplicationIdentifier0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:application_identifier][start_index] = r0

    r0
  end

  module MysteryInfo0
  end

  def _nt_mystery_info
    start_index = index
    if node_cache[:mystery_info].has_key?(index)
      cached = node_cache[:mystery_info][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?('[0x0-0x', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 7))
      @index += 7
    else
      terminal_parse_failure('[0x0-0x')
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        if has_terminal?('\G[a-f0-9]', true, index)
          r3 = true
          @index += 1
        else
          r3 = nil
        end
        if r3
          s2 << r3
        else
          break
        end
      end
      if s2.empty?
        @index = i2
        r2 = nil
      else
        r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      end
      s0 << r2
      if r2
        if has_terminal?('].', false, index)
          r4 = instantiate_node(SyntaxNode,input, index...(index + 2))
          @index += 2
        else
          terminal_parse_failure('].')
          r4 = nil
        end
        s0 << r4
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(MysteryInfo0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:mystery_info][start_index] = r0

    r0
  end

  def _nt_daemon
    start_index = index
    if node_cache[:daemon].has_key?(index)
      cached = node_cache[:daemon][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      if has_terminal?('\G[a-zA-Z]', true, index)
        r1 = true
        @index += 1
      else
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
    end

    node_cache[:daemon][start_index] = r0

    r0
  end

  module Pid0
  end

  def _nt_pid
    start_index = index
    if node_cache[:pid].has_key?(index)
      cached = node_cache[:pid][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?('[', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('[')
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        if has_terminal?('\G[0-9]', true, index)
          r3 = true
          @index += 1
        else
          r3 = nil
        end
        if r3
          s2 << r3
        else
          break
        end
      end
      if s2.empty?
        @index = i2
        r2 = nil
      else
        r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      end
      s0 << r2
      if r2
        if has_terminal?(']', false, index)
          r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure(']')
          r4 = nil
        end
        s0 << r4
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Pid0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:pid][start_index] = r0

    r0
  end

  def _nt_message
    start_index = index
    if node_cache[:message].has_key?(index)
      cached = node_cache[:message][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      if index < input_length
        r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure("any character")
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    r0 = instantiate_node(Message,input, i0...index, s0)

    node_cache[:message][start_index] = r0

    r0
  end

  def _nt_dot
    start_index = index
    if node_cache[:dot].has_key?(index)
      cached = node_cache[:dot][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      if has_terminal?('\G[\\.]', true, index)
        r1 = true
        @index += 1
      else
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
    end

    node_cache[:dot][start_index] = r0

    r0
  end

  def _nt_space
    start_index = index
    if node_cache[:space].has_key?(index)
      cached = node_cache[:space][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      if has_terminal?('\G[\\s]', true, index)
        r1 = true
        @index += 1
      else
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
    end

    node_cache[:space][start_index] = r0

    r0
  end

end

class LogLineParser < Treetop::Runtime::CompiledParser
  include LogLine
end
