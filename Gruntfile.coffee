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

            examples:
                expand: true
                options:
                    bare: true
                    join: true
                    sourceMap: true
                files:
                    'examples/1/build/example1.js': ['src/**/*.coffee', 'examples/1/src/**/*.coffee']

        uglify:
            webapp:
                src: 'build/**/*.js'
                dest: 'js/SimpleTimer.min.js'

            examples:
                src: 'examples/1/build/example1.js'
                dest: 'examples/1/js/example1.min.js'

        watch:
            webapp:
                files: 'src/**/*.coffee'
                tasks: ['coffee:webapp','uglify']

    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-uglify'
    grunt.loadNpmTasks 'grunt-contrib-watch'

    grunt.registerTask 'default', ['coffee:webapp']
    grunt.registerTask 'webapp', ['coffee:webapp']
    grunt.registerTask 'webapp-full', ['coffee', 'uglify']
