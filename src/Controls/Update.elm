module Controls.Update exposing (..)

import Controls.Msg as Controls
import Controls.Model as Controls


update : Controls.Msg -> Controls.Model -> Controls.Model
update msg model =
    case msg of
        Controls.ToggleSettings ->
            { model
                | editing =
                    if model.editing then
                        False
                    else
                        True
            }
