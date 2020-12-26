package com.bgs.ssm.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.FutureTask;

public class Test extends Thread {

    @Override
    public void run() {
        synchronized (this) {
            for (int i = 1; i <= 20; i++) {
                System.out.println(Thread.currentThread().getName() + ":" + i);
            }
        }

    }

    private static class Past implements Runnable {
        @Override
        public void run() {
            synchronized (this) {
                for (int i = 0; i < 20; i++) {
                    System.out.println(Thread.currentThread().getName() + ":" + i);
                }
            }

        }
    }

    private static class Yest implements Callable<Integer> {

        @Override
        public Integer call() throws Exception {
            int value = 0;
            for (int i = 0; i < 20; i++) {
                value++;
                System.out.println(Thread.currentThread().getName() + ":" + i);
            }
            return value;
        }
    }

    /*匿名内部类*/
    static Callable<Integer> callable = new Callable<Integer>() {
        @Override
        public Integer call() throws Exception {
            int value = 0;
            for (int i = 0; i < 20; i++) {
                value++;
                System.out.println(Thread.currentThread().getName() + ":" + i);
            }
            return value;
        }
    };


    public static void main(String[] args) throws Exception {
        /*          第一
        Thread thread = new Thread(new Test());
        Thread thread2 = new Thread(new Test());
        thread.start();
        thread.join();
        thread2.start();*/

     /*             第二
      Thread thread = new Thread(new Past());
        Thread thread2 = new Thread(new Past());
        thread.start();
        thread.join();
        thread2.start();*/

    /*          第三
    FutureTask<Integer> futureTask =  new FutureTask<Integer>(new Yest());
        Thread thread = new Thread(futureTask);

        FutureTask<Integer> futureTask2 =  new FutureTask<Integer>(new Yest());
        Thread thread2 = new Thread(futureTask2);
        thread.start();
        Integer integer = futureTask.get(); //start后再获取返回值
        System.out.println(integer);
        thread.join();
        thread2.start();*/

    /*    FutureTask<Integer> futureTask = new FutureTask<Integer>(callable);
         Thread thread =  new Thread(futureTask);
     thread.start();

      new Thread(futureTask).start();*/


    }
}