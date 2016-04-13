package cn.gc.lab.controller.messagge;

import org.springframework.http.HttpStatus;

/**
 * Created by tristan on 16/4/13.
 */
public class Message {

    private Integer code;
    private String message;

    public Message(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public static Message error() {
        return new Message(HttpStatus.BAD_REQUEST.value(), "unknow");
    }

    public static Message success() {
        return new Message(HttpStatus.OK.value(), "success");

    }
}
