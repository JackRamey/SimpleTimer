pad = (val, length, padChar = '0') ->
    val += ''
    numPads = length - val.length
    if (numPads > 0) then new Array(numPads + 1).join(padChar) + val else val

class Timer

    constructor: (duration) ->
        @timer = 0
        @increment = 1
        @tickFns = []
        @duration = duration

    onTick: (fn) ->
        @tickFns.push(fn)

    run: () ->
        self = this
        setInterval( () =>
            self.timer += self.increment
            for fn in @tickFns
              fn.call(this, self)
        , 10)

class CountDownTimer extends Timer

    constructor: (duration) ->
        super(duration)

    format: () ->
        time = @duration - @timer
        mins = ((time / 100) / 60) | 0
        mins = pad(mins, 2)
        secs = ((time / 100) % 60) | 0
        secs = pad(secs, 2)
        mSecs = (time % 100) | 0
        mSecs = pad(mSecs, 2)
        return mins + ":" + secs + "." + mSecs

class CountUpTimer extends Timer

    constructor: (duration) ->
        super(duration)

    format: () ->
        time = @timer
        mins = ((time / 100) / 60) | 0
        mins = pad(mins, 2)
        secs = ((time / 100) % 60) | 0
        secs = pad(secs, 2)
        mSecs = (time % 100) | 0
        mSecs = pad(mSecs, 2)
        return mins + ":" + secs + "." + mSecs

$(document).ready( ->
    console.log('ready!')
    x = new CountDownTimer(10000)
    x.run()
    x.onTick( =>
        $('#timerX').html(x.format())
    )
    y = new CountUpTimer(10000)
    y.run()
    y.onTick( =>
        $('#timerY').html(y.format())
    )
)

