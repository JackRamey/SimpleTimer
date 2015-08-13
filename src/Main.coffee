$(document).ready( ->
    console.log('ready!')
    $('#timer').hide()

    addRowButton = $('#add-row')
    okButton = $('#ok-button')
    row = $('.timer-row').clone()

    addRowButton.click( =>
        row.clone().insertBefore( addRowButton )
    )
    okButton.click( =>
        timers = []
        timerRows = $('.timer-row')
        for timerRow in timerRows
            minutes = $('#mins', timerRow).val()
            seconds = $('#secs', timerRow).val()
            duration = (minutes * 60 * 1000)
            duration += seconds * 1000
            timers.push(new CountDownTimer(duration))
        prev = null
        for timer in timers
                if prev?
                    prev.onComplete( =>
                        timer.run()
                    )
                timer.onTick( ->
                    $('#timer').html(@toString())
                )
                prev = timer
        console.log(timers)
        $('#creation').hide()
        $('#timer').show()
        timers[0].run()
    )
)

