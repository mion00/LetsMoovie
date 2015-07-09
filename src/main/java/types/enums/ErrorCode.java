package types.enums;

/**
 * Created by marco on 07/07/15.
 */
public enum ErrorCode {
    BAD_REQUEST(0),
    EMPTY_REQ(1),
    EMPTY_WRONG_FIELD(2),
    DUPLICATE_FIELD(3),
    USER_NOT_FOUND(6),
    ALREADY_LOGGED(7),
    NOT_AUTHORIZED(8),
    INVALID_MAIL(9),
    NOT_LOGGED_IN(10),
    WRONG_CONFIRMATION_CODE(11);

    private int value;

    ErrorCode(int value) {
        this.value = value;
    }

    public int getValue() {
        return this.value;
    }
}
