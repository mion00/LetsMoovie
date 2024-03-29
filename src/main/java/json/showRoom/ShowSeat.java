package json.showRoom;

import com.google.gson.annotations.Expose;
import types.enums.SeatStatus;

/**
 * Created by etrunon on 14/07/15.
 */
public class ShowSeat extends ParentSeat {

    @Expose
    private SeatStatus status;

    public ShowSeat(int row, int column, SeatStatus status) {
        super(row, column);
        this.status = status;
    }
}
