module.exports = (grunt) ->
    grunt.initConfig
        pkg: grunt.file.readJSON('package.json')

        clean:
            webapp: ['build/', 'js/']
            examples: ['examples/1/build/','examples/1/js/']

        coffee:
            webapp:
                expand: true
                options:
                    bare: true
                    join: true
                    sourceMap: true
                files:
                    'build/SimpleTimer.js': ['src/**/*.coffee']

            examples:
                expand: true
                options:
                    bare: true
                    join: true
                    sourceMap: true
                files:
                    'examples/1/build/example1.js': ['src/**/*.coffee', 'examples/1/src/**/*.coffee']
        sass:
            webapp:
                options:
                    style: 'expanded'
                files:
                    'static/css/main.css': 'sass/main.scss'
            build:
                options:
                    style: 'compressed'
                files:
                    'static/css/main.min.css': 'sass/main.scss'

        uglify:
            webapp:
                src: 'build/**/*.js'
                dest: 'js/SimpleTimer.min.js'

            examples:
                src: 'examples/1/build/example1.js'
                dest: 'examples/1/js/example1.min.js'

        watch:
            webapp:
                files: ['src/**/*.coffee', 'sass/**/*.scss']
                tasks: ['coffee:webapp','sass:webapp']

            examples:
                files: 'eamples/1/src/**/*.coffee'
                tasks: ['coffee:examples', 'uglify:examples']

    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-sass'
    grunt.loadNpmTasks 'grunt-contrib-uglify'
    grunt.loadNpmTasks 'grunt-contrib-watch'

    grunt.registerTask 'default', ['coffee:webapp']
    grunt.registerTask 'webapp', ['coffee:webapp', 'sass:webapp']
    grunt.registerTask 'build', ['coffee:webapp', 'uglify:webapp', 'sass:build']
