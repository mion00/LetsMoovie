package json.showRoom;

import com.google.gson.annotations.Expose;
import json.OperationResult;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by etrunon on 14/07/15.
 */
public class SeatList implements OperationResult {

    @Expose
    int row;
    @Expose
    int column;
    @Expose
    List<ParentSeat> showSeatList;

    public SeatList(int row, int column, List<ParentSeat> showSeatList) {
        this.row = row;
        this.column = column;
        this.showSeatList = showSeatList;
    }

    public SeatList(int row, int column) {
        this.row = row;
        this.column = column;
        showSeatList = new ArrayList<>();
    }

    public void addSeat(ParentSeat s) {
        showSeatList.add(s);
    }
}
