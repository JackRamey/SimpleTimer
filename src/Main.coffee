$(document).ready( ->
    console.log('ready!')
    x = new CountDownTimer(3000)
    x.run()
    x.onTick( =>
        $('#timerX').html(x.toString())
    )
    y = new CountUpTimer(3000)
    y.run()
    y.onTick( =>
        $('#timerY').html(y.toString())
    )
    y.onEachSecond( ->
        console.log('tick')
    )
    y.onComplete( =>
        $('#timerY').html("IT'S OVER!")
    )

    a = new CountDownTimer(3000, 'a')
    b = new CountUpTimer(4000, 'b')
    c = new CountDownTimer(5000, 'c')
    d = new CountUpTimer(6000, 'd')

    a.onTick( =>
        $('#timerZ').html(a.toString())
    )
    a.onComplete( =>
        b.run()
    )

    b.onTick( =>
        $('#timerZ').html(b.toString())
    )
    b.onComplete( =>
        c.run()
    )

    c.onTick( =>
        $('#timerZ').html(c.toString())
    )
    c.onComplete( =>
        d.run()
    )

    d.onTick( =>
        $('#timerZ').html(d.toString())
    )
    d.onComplete( =>
        $('#timerZ').html("WOOHOO!")
    )

    a.run()
)

