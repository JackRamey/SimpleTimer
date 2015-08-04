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

    grunt.loadNpmTasks 'grunt-contrib-coffee'

    grunt.registerTask 'default', ['coffee']
