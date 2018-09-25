// #include <stdio.h>
#include <iostream>
#include <gtkmm.h>
#include "components/main_window.hpp"
#include "resources.c"

int main(int argc, char *argv[])
{

    auto app = Gtk::Application::create(argc, argv, "net.olback.rdg");
    // auto builder = Gtk::Builder::create();
    // builder->add_from_resource("/net/olback/rdg/src/layout/rdg.glade");

    auto builder = Gtk::Builder::create_from_file("resource:///net/olback/rdg/src/layout/rdg.glade");

    RdgAppWindow *window = nullptr;

    builder->get_widget_derived("main", window);

    auto r = app->run(*window);

    delete window;

    return r;

    // return 0;
}
