/*
   This file is part of Whaler.

   Whaler is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License
   as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
   Whaler is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty
   of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

   You should have received a copy of the GNU General Public License along with Whaler. If not, see <https://www.gnu.org/licenses/>.
 */

using Utils;

class Widgets.ScreenDockerContainer : Adw.Bin {
    public static string CODE = "docker-container";
    private Adw.OverlaySplitView view;

    construct {
        view = new Adw.OverlaySplitView ();
        var state = State.Root.get_instance ();
        view.set_sidebar_position (Gtk.PackType.START);
        // TODO - add log output / view.set_content (build_log_output ());
        view.set_show_sidebar (state.screen_docker_container.is_sidebar_enabled);
        print("bool " + state.screen_docker_container.is_sidebar_enabled.to_string ());
        view.set_collapsed (false);

        Gtk.Label content_label = new Gtk.Label ("log view");

        view.set_content (content_label);
        view.set_sidebar (new Widgets.Screens.Container.SideBar (this));

        child = view;
    }

    public ScreenDockerContainer () {
        Object ();
    }

    private Gtk.Widget build_log_output () {
        var box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);

        //box.prepend (new Screens.Container.TopBar ());
        //box.append (new Screens.Container.Log ());

        return box;
    }

    public void set_show_sidebar(bool is_showed){
        view.set_show_sidebar (is_showed);
    }
}
