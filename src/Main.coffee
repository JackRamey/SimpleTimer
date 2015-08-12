$(document).ready( ->
    console.log('ready!')
    x = new CountDownTimer(300)
    x.run()
    x.onTick( =>
        $('#timerX').html(x.toString())
    )
    y = new CountUpTimer(300)
    y.run()
    y.onTick( =>
        $('#timerY').html(y.toString())
    )
    y.onComplete( =>
        $('#timerY').html("IT'S OVER!")
    )

    a = new CountDownTimer(300, 'a')
    b = new CountUpTimer(400, 'b')
    c = new CountDownTimer(500, 'c')
    d = new CountUpTimer(600, 'd')

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

