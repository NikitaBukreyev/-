package Validators;

import Models.Team;

public class TeamValidator implements Validator<Team> {

    public boolean isValid(Team model) {
        model.setName(model.getName().trim());
        if (model.getName().length() < 3) {
            return false;
        }
        return true;
    }
    
}
