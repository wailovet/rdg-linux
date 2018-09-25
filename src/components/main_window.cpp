#include <iostream>
#include "main_window.hpp"

RdgAppWindow::RdgAppWindow(BaseObjectType* cobject, const Glib::RefPtr<Gtk::Builder>& refBuilder)
    : Gtk::ApplicationWindow(cobject)
    , m_refBuilder(refBuilder)
{
    set_title("RDG App");
}
