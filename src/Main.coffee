$(document).ready( ->
    console.log('ready!')

    timerEditContainer = $('#timer-edit-container')
    timerViewContainer = $('#timer-view-container')

    nextBtn = $('#right-button')
    prevBtn = $('#left-button')
    okButton = $('#footer-button')

    timerViewContainer.hide()

    okButton.click( =>
        timers = []
        minutes = $('#mins').val()
        seconds = $('#secs').val()
        duration = (minutes * 60 * 1000)
        duration += seconds * 1000
        timer = new CountDownTimer(duration)
        timer.onTick( ->
            $('#timer').html(@toString())
        )
        timers.push(timer)
        ###
        seconds = $('#secs', timerRow).val()
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
        ###
        timerEditContainer.hide()
        timerViewContainer.show()
        timers[0].run()
    )
)

