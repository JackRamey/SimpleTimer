class Timer

    constructor: (duration, id) ->
        @timer = 0
        @increment = 1
        @tickFns = []
        @endFns = []
        @duration = duration
        @id = id

    onTick: (fn) ->
        @tickFns.push(fn)

    onComplete: (fn) ->
        @endFns.push(fn)

    run: () ->
        self = this
        @interval = setInterval( () =>
            self.timer += self.increment
            for fn in self.tickFns
                fn.call(this, self)
            if self.timer == self.duration
                self.stop()
                for fn in self.endFns
                    fn.call(this, self)
        , 10)

    stop: () ->
        clearInterval(@interval)

class CountDownTimer extends Timer

    constructor: (duration, id) ->
        super(duration, id)

    toString: () ->
        time = @duration - @timer
        mins = ((time / 100) / 60) | 0
        mins = pad(mins, 2)
        secs = ((time / 100) % 60) | 0
        secs = pad(secs, 2)
        mSecs = (time % 100) | 0
        mSecs = pad(mSecs, 2)
        return mins + ":" + secs + "." + mSecs

class CountUpTimer extends Timer

    constructor: (duration, id) ->
        super(duration, id)

    toString: () ->
        time = @timer
        mins = ((time / 100) / 60) | 0
        mins = pad(mins, 2)
        secs = ((time / 100) % 60) | 0
        secs = pad(secs, 2)
        mSecs = (time % 100) | 0
        mSecs = pad(mSecs, 2)
        return mins + ":" + secs + "." + mSecs

pad = (val, length, padChar = '0') ->
    val += ''
    numPads = length - val.length
    if (numPads > 0) then new Array(numPads + 1).join(padChar) + val else val

