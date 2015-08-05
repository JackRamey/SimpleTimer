module.exports = (grunt) ->
    grunt.initConfig
        pkg: grunt.file.readJSON('package.json')

        coffee:
            app:
                expand: true
                options:
                    bare: true
                cwd: 'src'
                src: '**/*.coffee'
                dest: 'lib/'
                ext: '.js'

        uglify:
            app:
                src: 'lib/**/*.js'
                dest: 'js/SimpleTimer.min.js'

        watch:
            app:
                files: 'src/**/*.coffee'
                tasks: ['coffee','uglify']

    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-uglify'
    grunt.loadNpmTasks 'grunt-contrib-watch'

    grunt.registerTask 'default', ['coffee']
