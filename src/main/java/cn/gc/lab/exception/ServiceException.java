package cn.gc.lab.exception;

/**
 * 服务层抛出的异常
 * Created by tristan on 16/4/10.
 */
public class ServiceException extends Exception {
    public ServiceException(String message){
        super(message);

    }
}
