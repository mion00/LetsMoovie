package servlets;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.google.gson.JsonSyntaxException;
import database.DatabaseConnection;
import database.datatypes.seat.RoomData;
import database.datatypes.seat.Seat;
import database.mappers.SeatMapper;
import json.OperationResult;
import json.showRoom.RoomSeat;
import json.showRoom.SeatList;
import org.apache.ibatis.session.SqlSession;
import types.exceptions.BadRequestException;
import utilities.RestUrlMatcher;
import utilities.reservation.TemporaryReservationManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Servlet che mostra la lista di posti con il relativo stato di una specifica proiezione
 * Created by etrunon on 14/07/15.
 */

/**
 * @api {get} /api/viewShowRoom/*
 * @apiName ViewShowRoom
 * @apiGroup ViewShowRoom
 * @apiParam {int} show id_code.
 * @apiError (0) {int} errorCode BAD_REQUEST: lanciato quando succedono errori gravi all'interno della servlet
 * @apiError (2) {String[]} errorCode EMPTY_WRONG_FIELD: parameters parametri di input che non passano la validazione
 * @apiError (10) {int} errorCode NOT_LOGGED_IN: L'utente è già loggato e fino all'implementazione del cambio password non può fare niente
 */
@WebServlet(name = "ViewRoom", urlPatterns = "/api/viewRoom/*")
public class ViewRoom extends HttpServlet {

    private Gson gsonWriter;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        OperationResult viewResult;
        //Inizializzo la connessione al db con il mapper
        SqlSession sessionSql;
        sessionSql = DatabaseConnection.getFactory().openSession();
        SeatMapper seatMapper = sessionSql.getMapper(SeatMapper.class);

        try {
            //Check se l'utente NON è loggato (da sloggato non vedi dati di nessuno
            //BadReqExeceptionThrower.checkUserLogged(request);

            //String matcher che preleva lo roomId da cercare dall'url e lancia Err.2 in caso sia nullo o mal formattato
            RestUrlMatcher rs = new RestUrlMatcher(request.getPathInfo());
            int roomId = Integer.valueOf(rs.getParameter());

            RoomData roomData = seatMapper.getShowRoomData(roomId);
            SeatList showSeats = new SeatList(roomData.getLength(), roomData.getWidth());

            List<Seat> showBrokenSeats = seatMapper.getRoomSeats(roomId);
            for (Seat s : showBrokenSeats) {

                RoomSeat roomSeat = new RoomSeat(s.getRow(), s.getColumn(), s.getStatus());
                showSeats.addSeat(roomSeat);
            }

            viewResult = showSeats;

        } catch (BadRequestException e) {
            viewResult = e;
            response.setStatus(400);

        } catch (JsonIOException | JsonSyntaxException | NullPointerException e) {
            viewResult = new BadRequestException();
            response.setStatus(400);
        }

        PrintWriter outputStream = response.getWriter();
        outputStream.print(gsonWriter.toJson(viewResult));
        sessionSql.close();
    }

    @Override
    public void init() throws ServletException {

        GsonBuilder gsonBuilder = new GsonBuilder();
        gsonBuilder.excludeFieldsWithoutExposeAnnotation();
        gsonWriter = gsonBuilder.disableHtmlEscaping().create();

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
