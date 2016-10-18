PUB_PACKAGE_NAME = "captains_log"

def bazelify():
    native.new_local_repository(
        name = "browser",
        path = "/usr/local/google/home/nshahan/.pub-cache/hosted/pub.dartlang.org/browser-0.10.0+2",
        build_file = ".bazelify/browser.BUILD",
    )
    
    native.new_local_repository(
        name = "func",
        path = "/usr/local/google/home/nshahan/.pub-cache/hosted/pub.dartlang.org/func-0.1.0",
        build_file = ".bazelify/func.BUILD",
    )
    
    native.new_local_repository(
        name = "js",
        path = "/usr/local/google/home/nshahan/.pub-cache/hosted/pub.dartlang.org/js-0.6.1",
        build_file = ".bazelify/js.BUILD",
    )
    
    native.new_local_repository(
        name = "captains_log",
        path = "/usr/local/google/home/nshahan/code/captains_log",
        build_file = ".bazelify/captains_log.BUILD",
    )
    
