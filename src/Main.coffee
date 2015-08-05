$(document).ready( ->
    console.log('ready!')
    x = new CountDownTimer(1000)
    x.run()
    x.onTick( =>
        $('#timerX').html(x.toString())
    )
    y = new CountUpTimer(1000)
    y.run()
    y.onTick( =>
        $('#timerY').html(y.toString())
    )
    y.onComplete( =>
        $('#timerY').html("IT'S OVER!")
    )
)

