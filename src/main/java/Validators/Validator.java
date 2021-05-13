package Validators;

public interface Validator<TModel> {
    
    public boolean isValid(TModel model);
    
}
