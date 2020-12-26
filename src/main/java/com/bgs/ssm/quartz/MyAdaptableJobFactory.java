package com.bgs.ssm.quartz;

import org.quartz.spi.TriggerFiredBundle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.scheduling.quartz.AdaptableJobFactory;
import org.springframework.stereotype.Component;


//该类可以将一个对象添加到SpringIOC容器中，并且完成该对象注入
@Component
public class MyAdaptableJobFactory extends AdaptableJobFactory {

    @Autowired
    private AutowireCapableBeanFactory autowireCapableBeanFactory;


    /*
        该方法需要将实例化的任务对象手动添加到SpringIOC容器中并且完成对象的注入
     */
    @Override
    protected Object createJobInstance(TriggerFiredBundle bundle) throws Exception {
        Object object = super.createJobInstance(bundle);

        this.autowireCapableBeanFactory.autowireBean(object);
        return object;
    }
}
