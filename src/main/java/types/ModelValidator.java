package types;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

/**
 * Created by marco on 06/07/15.
 */
public class ModelValidator {
    public static List<String> validate(Object object) throws InvocationTargetException, IllegalAccessException {
        List<String> invalidParameters = new ArrayList<String>();
        for(Method m : object.getClass().getMethods())
        {

            toSanitize a = m.getAnnotation(toSanitize.class);
            if(a!=null)
            {
                String value = (String) m.invoke(object);
                if(value==null)
                {
                    invalidParameters.add(a.name());
                }
                else {
                    Pattern pattern = Pattern.compile("^\\d{5}(-\\d{4})?$"); //TODO rejex
                    if (!pattern.matcher(value).matches()) {
                        invalidParameters.add(a.name());
                    }
                }
            }
        }
        return invalidParameters;
    }
}
