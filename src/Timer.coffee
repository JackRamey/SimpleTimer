class Timer

    constructor: (duration, id) ->
        @timer = 0
        @increment = 10
        @tickFns = []
        @secondFns = []
        @minuteFns = []
        @endFns = []
        @duration = duration
        @id = id

    #Static Methods
    @getMilliSeconds: (time) ->
        return ((time % 1000) / 10) | 0

    @getMinutes: (time) ->
        return ((time / 1000) / 60) | 0

    @getSeconds: (time) ->
        return ((time / 1000) % 60) | 0

    #Member Methods
    doCompleteFns: () ->
        if @timer == @duration
            @stop()
            for fn in @endFns
                fn.call(this)

    doMinuteFns: () ->
        if @isMinute()
            for fn in @minuteFns
                fn.call(this)

    doSecondFns: () ->
        if @isSecond()
            for fn in @secondFns
                fn.call(this)

    doTickFns: () ->
        for fn in @tickFns
            fn.call(this, self)

    getTimerMilliSeconds: () ->
        return Timer.getMilliSeconds(@timer)

    getTimerMinutes: () ->
        return Timer.getMinutes(@timer)

    getTimerSeconds: () ->
        return Timer.getSeconds(@timer)

    getRemainingTime: () =>
        return @duration

    isMinute: () ->
        return @getTimerSeconds() == 0

    isSecond: () ->
        return @getTimerMilliSeconds() == 0

    onComplete: (fn) ->
        @endFns.push(fn)

    onEachMinute: (fn) ->
        @minuteFns.push(fn)

    onEachSecond: (fn) ->
        @secondFns.push(fn)

    onTick: (fn) ->
        @tickFns.push(fn)

    run: () ->
        self = this
        @interval = setInterval( () =>
            self.tick()
            self.doTickFns()
            self.doSecondFns()
            self.doMinuteFns()
            self.doCompleteFns()
        , 10)

    stop: () ->
        clearInterval(@interval)

    tick: () ->
        @timer += @increment

    toString: () ->
        time = @getRemainingTime()
        mins = pad(Timer.getMinutes(time), 2)
        secs = pad(Timer.getSeconds(time), 2)
        mSecs = pad(Timer.getMilliSeconds(time), 2)
        return mins + ":" + secs + "." + mSecs

class CountDownTimer extends Timer

    constructor: (duration, id) ->
        super(duration, id)

    getRemainingTime: () ->
        return @duration - @timer

class CountUpTimer extends Timer

    constructor: (duration, id) ->
        super(duration, id)

    getRemainingTime: () ->
        return @timer

pad = (val, length, padChar = '0') ->
    val += ''
    numPads = length - val.length
    if (numPads > 0) then new Array(numPads + 1).join(padChar) + val else val

