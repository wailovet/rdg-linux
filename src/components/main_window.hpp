#ifndef GTKMM_RDGAPPWINDOW_H
#define GTKMM_RDGAPPWINDOW_H

#include <gtkmm.h>

class RdgAppWindow : public Gtk::ApplicationWindow
{
    public:
        // RdgAppWindow(BaseObjectType* obj, Glib::RefPtr<Gtk::Builder> const& builder)
        //     : Gtk::ApplicationWindow(obj)
        //     , builder{builder}
        // {
        // }

        RdgAppWindow();

        virtual ~RdgAppWindow() = default;

    private:
        Glib::RefPtr<Gtk::Builder> builder;
};

#endif /* GTKMM_RDGAPPWINDOW_H */
