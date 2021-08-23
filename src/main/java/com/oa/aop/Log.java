package com.oa.aop;

import java.lang.annotation.*;

@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Log {
    /* 方法模块 */
    String title() default "";
    /* 功能 */
    String action() default "";
}
