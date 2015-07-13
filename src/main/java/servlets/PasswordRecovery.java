package servlets;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.google.gson.JsonSyntaxException;
import database.DatabaseConnection;
import database.mappers.UserMapper;
import json.OperationResult;
import json.password_recovery.request.PasswordRecoveryRequest;
import json.password_recovery.response.SuccessfullPasswordRecovery;
import org.apache.ibatis.session.SqlSession;
import types.enums.ErrorCode;
import types.exceptions.BadRequestException;
import types.exceptions.BadRequestExceptionWithParameters;
import utilities.InputValidator.ModelValidator;
import utilities.mail.MailCleanerThread;
import utilities.mail.MailCleanerThreadFactory;
import utilities.mail.PasswordRecoveryMailSender;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

/**
 * @api {post} /api/passwordRecovery
 * @apiName PasswordRecovery
 * @apiGroup PasswordRecovery
 *
 * @apiParam {String} email l'email a cui inviare il recupero password
 *
 * @apiSuccess {String} email l'indirizzo email a cui è stata inviata la mail
 *
 * @apiError (0) {int} errorCode lanciato quando succedono errori gravi all'interno della servlet
 *
 * @apiError (2) {int} errorCode Viene lanciato quando uno o più campi sono vuoti oppure errati (non validabili)
 * @apiError (2) {String[]} parameters parametri di input che non passano la validazione
 *
 * @apiError (7) {int} errorCode è già presente una sessione valida
 *
 * @apiError (9) {int} errorCode la mail in input non è valida e non può ricevere la mail di registrazione
 * @apiError (9) {String[]} parameters la mail non valida
 *
 */
@WebServlet(name = "PasswordRecovery",  urlPatterns = "/api/passwordRecovery")
public class PasswordRecovery extends HttpServlet {
    Gson gsonWriter;
    Gson gsonReader;
    UserMapper userMapper;
    PasswordRecoveryMailSender passwordRecoveryMailSender;
    private final String url = "/api/passwordRecovery";


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OperationResult recoveryStatus;
        response.setContentType("application/json");
        try
        {
            PasswordRecoveryRequest passwordRecoveryRequest = gsonReader.fromJson(request.getReader(),PasswordRecoveryRequest.class);
            List<String> invalidParameters = ModelValidator.validate(passwordRecoveryRequest);
            if(!invalidParameters.isEmpty())
            {
                throw new BadRequestExceptionWithParameters(ErrorCode.EMPTY_WRONG_FIELD,"email");
            }

            String username = userMapper.getUsernameByEmail(passwordRecoveryRequest.getEmail());

            if(username==null)
            {
                throw new BadRequestExceptionWithParameters(ErrorCode.EMPTY_WRONG_FIELD,"email");
            }
            String recoveryMailUrl = request.getRequestURL().toString().replace(url,"");
            recoveryMailUrl+="/passwordRecovery?verificationCode=";
            if(!passwordRecoveryMailSender.sendEmail(passwordRecoveryRequest.getEmail(),username,recoveryMailUrl))
            {
                throw new BadRequestExceptionWithParameters(ErrorCode.INVALID_MAIL,"email");
            }
            recoveryStatus = new SuccessfullPasswordRecovery(passwordRecoveryRequest.getEmail());

        }catch (BadRequestExceptionWithParameters e) {
            recoveryStatus = e;
            response.setStatus(400);

        } catch (IllegalAccessException | InvocationTargetException | JsonIOException | JsonSyntaxException | NullPointerException e) {
            recoveryStatus = new BadRequestException();
            e.printStackTrace();
            response.setStatus(400);
        }
        ServletOutputStream outputStream = response.getOutputStream();
        outputStream.print(gsonWriter.toJson(recoveryStatus));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public void init() throws ServletException {
        SqlSession session = DatabaseConnection.getFactory().openSession(true);
        userMapper = session.getMapper(UserMapper.class);

        MailCleanerThread mailCleanerThread = MailCleanerThreadFactory.getMailCleanerThread();
        passwordRecoveryMailSender = new PasswordRecoveryMailSender(mailCleanerThread);
        GsonBuilder gsonBuilder = new GsonBuilder();
        gsonBuilder.excludeFieldsWithoutExposeAnnotation();
        gsonWriter = gsonBuilder.create();
        gsonReader = new Gson();
    }
}
