/*
   This file is part of Whaler.

   Whaler is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License
   as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
   Whaler is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty
   of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

   You should have received a copy of the GNU General Public License along with Whaler. If not, see <https://www.gnu.org/licenses/>.
 */

using Utils;
using Widgets.Screens.Main;

namespace Widgets.Screens.Container {
    class TopBarActions : Gtk.Box {
        private DockerContainer container;

        public TopBarActions (DockerContainer container) {
            this.container = container;
            this.sensitive = container.state != DockerContainerState.UNKNOWN;
            this.orientation = Gtk.Orientation.HORIZONTAL;
            this.spacing = 0;
            this.margin_start = 15;
            this.prepend (this.build_button_main_action ());
            //this.append (this.build_button_menu_action ());
        }

        private Gtk.Widget build_button_main_action () {
            var icon_name = "media-playback-start-symbolic";
            string css_class = "suggested-action";

            if (this.container.state == DockerContainerState.RUNNING) {
                icon_name = "media-playback-stop-symbolic";
                css_class = "destructive-action";
            }

            var button = new Gtk.Button.from_icon_name (icon_name);
            button.valign = Gtk.Align.CENTER;
            button.clicked.connect (() => {
                this.sensitive = false;

                ContainerCardActions.button_main_action_handler.begin (this.container, (_, res) => {
                    ContainerCardActions.button_main_action_handler.end (res);
                    this.sensitive = true;
                });

            });
            
            button.add_css_class (css_class);
            return button;
    }

        //  private Gtk.Widget build_button_menu_action () { // TODO - Reimplement this (as an object, preferably)
        //      var button = new Gtk.Button ();
        //      var menu = ContainerCardActions.build_menu (this.container, this);

        //      button.get_style_context ().add_class ("button-menu");
        //      button.valign = Gtk.Align.FILL;
        //      button.clicked.connect ((widget) => {
        //          menu.popup_at_widget (
        //              widget,
        //              Gdk.Gravity.NORTH_WEST,
        //              Gdk.Gravity.NORTH_WEST,
        //              null
        //          );
        //      });

        //      var icon = new Gtk.Image.from_icon_name ("pan-down-symbolic", Gtk.IconSize.BUTTON);
        //      button.add (icon);

        //      return button;
        //  }
    }
}
