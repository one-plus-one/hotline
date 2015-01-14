module.exports = function(grunt){

    // 项目配置
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        uglify: {
            options: {
                banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
            },
            //build: {
            //    //src: 'src/<%=pkg.name %>.js',
            //    src: './app/js/home/main.js',
            //    //dest: 'build/<%= pkg.name %>.min.js'
            //    dest: './app/assets/javascripts/home.min.js'
            //},
            //build: {
            //    src: './bower_components/boostrap/dist/js/bootstrap.min.js',
            //    dest: './app/assets/javascripts/home.min.js'
            //}
            static_mappings:{
                files:[
                    {
                        src: './app/js/home/main.js',
                        dest: './app/assets/javascripts/home.min.js'
                    },
                    {
                        src: './bower_components/bootstrap/dist/js/bootstrap.min.js',
                        dest: './app/assets/javascripts/bootstrap.min.js'
                    }
                ]
            }

        },
        concat_css: {
            all: {
                src: ["./bower_components/bootstrap/dist/css/bootstrap.min.css"],
                dest: "./app/assets/stylesheets/styles.css"
            }
        }
    });

    // 加载提供"uglify"任务的插件
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-concat-css');

    // 默认任务
    grunt.registerTask('default', ['uglify', 'concat_css']);
}