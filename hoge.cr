class EscapeSequence
    def move(x,y)
        print "\e[#{y};#{x}H"
    end

    def erase()
        print "\e[2J"
    end
end

print "\e[2J" # reset display
print "\e[1;1H" # move to 1,1(left top)
es = EscapeSequence.new
(1..10).each do |a|
    (1..10).each do |b|
        es.erase
        es.move(b,a)
        print "a"
        es.move(15,1)
        print "#{a}:#{b}"
        sleep(0.05)
    end
    print "\n"
end
