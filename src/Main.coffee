require('Timer.coffee')

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
