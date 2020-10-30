package com.bgs.ssm.util;


import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;

public class AliYunMessageUtil {

    //初始化ascClient需要的几个参数
    static final String product = "Dysmsapi";//短信API产品名称（短信产品名固定，无需修改）
    static final String domain = "dysmsapi.aliyuncs.com";//短信API产品域名（接口地址固定，无需修改）

    static final String accessKeyId = "LTAI4GBK2Xw7yCkRo9NLRF52";//你的accessKeyId
    static final String accessKeySecret = "P3X9nodgYMdSBs49N5Jz2EVF1e3Tx4";//你的accessKeySecret


    public static SendSmsResponse sendSms(String telephone, String code) throws ClientException {
        // 可自助调整超时时间
        System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
        System.setProperty("sun.net.client.defaultReadTimeout", "10000");

        // 初始化acsClient,暂不支持region化
        IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId, accessKeySecret);
        DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
        IAcsClient acsClient = new DefaultAcsClient(profile);

        // 组装请求对象-具体描述见控制台-文档部分内容
        SendSmsRequest request = new SendSmsRequest();
        // 必填:待发送手机号
        request.setPhoneNumbers(telephone);
        // 必填:短信签名-可在短信控制台中找到
        request.setSignName("山山快修");
        request.setTemplateCode("SMS_205122582");
        // 必填:短信模板-可在短信控制台中找到
        request.setTemplateParam("{\"code\":\"" + code + "\"}");
        request.setOutId("yourOutId");


        // hint 此处可能会抛出异常，注意catch
        SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);
        /*System.out.println("你到底是什么？？？----"+sendSmsResponse.getCode());*/
        if(sendSmsResponse.getCode()!= null && sendSmsResponse.getCode().equals("OK")){
            System.out.println("短信发送成功！");
        }else {
            System.out.println("短信发送失败！");
        }
        return sendSmsResponse;
    }

    //以下为测试代码，随机生成验证码
    private static int newcode;
    public static int getNewcode() {
        return newcode;
    }
    public static void setNewcode(){
        newcode = (int)(Math.random()*9999)+100;  //每次调用生成一次四位数的随机数
    }
    public static void main(String[] args) throws Exception {
        setNewcode();
        String code = Integer.toString(getNewcode());
        SendSmsResponse sendSms =sendSms("18301398746",code);//填写你需要测试的手机号码
    }




}
