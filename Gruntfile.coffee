module.exports = (grunt) ->
    grunt.initConfig
        pkg: grunt.file.readJSON('package.json')

        clean: ['lib/']

        coffee:
            webapp:
                expand: true
                options:
                    bare: true
                    join: true
                    sourceMap: true
                files:
                    'build/SimpleTimer.js': ['src/**/*.coffee']

            build:
                expand: true
                options:
                    bare: true
                    sourceMap: true
                cwd: 'src'
                src: '**/*.coffee'
                dest: 'build/'
                ext: '.js'

        uglify:
            app:
                src: 'build/**/*.js'
                dest: 'js/SimpleTimer.min.js'

        watch:
            app:
                files: 'src/**/*.coffee'
                tasks: ['coffee:webapp','uglify']

    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-uglify'
    grunt.loadNpmTasks 'grunt-contrib-watch'

    grunt.registerTask 'default', ['coffee:webapp']
    grunt.registerTask 'webapp', ['coffee:webapp']
    grunt.registerTask 'webapp-full', ['coffee:build', 'uglify']
