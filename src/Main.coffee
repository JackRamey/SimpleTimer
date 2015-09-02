class TimerNode

    constructor: (duration) ->
        @timer = new CountDownTimer(duration)
        @prev = null

$(document).ready( ->
    console.log('ready!')

    $timerEdit = $("#timer-edit")

    $minutesEdit = $("<input>", {type:"text", class:"minutes", placeholder:"00"})
    $secondsEdit = $("<input>", {type:"text", class:"seconds", placeholder:"00"})
    $timerEditRowTemplate = $("<div>", {class: "timer-edit-row"})
    $timerEditRowTemplate.append($minutesEdit).append($secondsEdit)
    console.log($timerEditRowTemplate)

    $timerEditContainer = $('#timer-edit-container')
    $timerViewContainer = $('#timer-view-container')

    $nextBtn = $('#right-button')
    $prevBtn = $('#left-button')
    $okButton = $('#footer-button')

    $timerViewContainer.hide()

    $nextBtn.click( =>
        $timerEditRow = $timerEditRowTemplate.clone()
        $timerEdit.append($timerEditRow)
        console.log($timerEditRow)
    )

    $okButton.click( =>
        timerSequence = new TimerSequence(1000)
        $timerEditRows = $('.timer-edit-row')
        for $timerEditRow in $timerEditRows
            minutes = $('.minutes', $timerEditRow).val()
            seconds = $('.seconds', $timerEditRow).val()
            duration = (minutes * 60 * 1000)
            duration += seconds * 1000
            timer = new CountDownTimer(duration)
            timer.onTick( ->
                $('#timer').html(@toString())
            )
            timerSequence.add(timer)
        $timerEditContainer.hide()
        $timerViewContainer.show()
        timerSequence.run()
    )
)

