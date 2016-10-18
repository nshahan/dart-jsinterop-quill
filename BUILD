# Automatically generated and left blank by Bazelify
load("@io_bazel_rules_dart//dart/build_rules:core.bzl", "dart_library")
load("@io_bazel_rules_dart//dart/build_rules:ddc.bzl", "dart_ddc_bundle")
load("@io_bazel_rules_dart//dart/build_rules:web.bzl", "dart_web_application")
load("@io_bazel_rules_dart//dart/build_rules:dev_server.bzl", "dev_server")
load(":packages.bzl", "PUB_PACKAGE_NAME")

package(default_visibility = ["//visibility:public"])

licenses(["notice"])  # BSD

dart_library(
    name = "captains_log_lib",
    srcs = glob(["lib/**"]),
    pub_pkg_name = PUB_PACKAGE_NAME,
    deps = [
      "@func//:func",
      "@js//:js",
      "@browser//:browser",
    ],
)

dart_library(
    name = "captains_log",
    srcs = glob(["web/**"], exclude=["web/packages/**"]),
    pub_pkg_name = PUB_PACKAGE_NAME,
    deps = [":captains_log_lib"],
)

dart_ddc_bundle(
    name = "ddc_bundle",
    entry_library = "web/main.dart",
    entry_module = ":captains_log",
    input_html = "web/index.html",
    output_dir = "web",
)

# To run, do the following:
#
#   - open up a terminal
#   - run `bazel build examples/web_app:ddc_dev_server`
#   - run `bazel-bin/examples/web_app/ddc_dev_server` to start the server
#   - load http://localhost:8080/io_bazel_rules_dart/examples/web_app/web/ddc_bundle.html
#     in chrome
#
# Rerun `bazel build examples/web_app:ddc_dev_server` in a different terminal
# whenever you make a change to see the updates!
dev_server(
    name = "ddc_dev_server",
    # TODO: propagate css/html from web_app target.
    data = [":ddc_bundle"],
)

dart_web_application(
    name = "js_debug",
    srcs = [],
    script_file = "web/main.dart",
    checked = True,
    minify = False,
    dump_info = True,
    deps = [":captains_log"],
)

dart_web_application(
    name = "js_release",
    srcs = [],
    script_file = "web/main.dart",
    deps = [
        ":captains_log",
    ],
)
