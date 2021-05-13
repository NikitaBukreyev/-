package Validators;

import Models.Sport;

public class SportValidator implements Validator<Sport> {


    public boolean isValid(Sport model) {
        model.setName(model.getName().trim());
        if (model.getName().length() < 3) {
            return false;
        }
        return true;
    }
    
}
