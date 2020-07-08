<?php
/**
 *  Created by .
 *  User: 七年
 *  Date: 2020-05-27
 *  Time: 11:56
 *  Motto: 无私奉献不是天方夜谭，有时候，我们也可以做到。
 */

namespace Api\Controller;
include_once './Public/aliyunsdk/aliyun-php-sdk-core/Config.php';
use vod\Request\V20170321 as vod;

class UploadController extends CommonApiController
{
    public function index()
    {
        $this->display();
    }

    public function record(){
        $this->display();
    }

    public function getvideo(){

        $regionId = 'cn-shanghai';
        $profile = \DefaultProfile::getProfile($regionId, "LTAI4G8iytjvt28HPyNzuM7j", "Q3JBBrMZd6rwtz6VaFfiMkU3t17qHa");
        $client = new \DefaultAcsClient($profile);
        $request = new vod\CreateUploadVideoRequest();
        $request->setTitle($_POST['title']);
        $request->setFileName($_POST['name']);
        $request->setFileSize(0);
        $request->setDescription($_POST['desc']);
        $request->setCoverURL("");
        $request->setIP("127.0.0.1");
        $request->setTags("");
        $request->setCateId(0);
        $response = $client->getAcsResponse($request);

        $data['UploadAuth']=$response->UploadAuth;
        $data['UploadAddress']=$response->UploadAddress;
        $data['VideoId']=$response->VideoId;
        $data['RequestId']=$response->RequestId;

        $res = $this->getVideodata($response->VideoId);

        $addinfo = [
            'user_id'=> GetUserId(I('openid')),
            'city'=>I('city'),
            'lng' =>I('longitude'),
            'lat' =>I('latitude'),
            'create_time'=>time(),
            'aliyun_video_id'=>$res['VideoBase']['VideoId'],
            'video_url'=>$res['PlayInfoList']['PlayInfo'][0]['PlayURL'],
            'video_title'=>I('title'),
            'video_describe'=>I('desc')
        ];
        if($this->AddVideo($addinfo)){
            $this->ajaxReturn($data);
        }
    }

    public function AddVideo($datas){
       return M('video')->add($datas);
    }

    public function getVideodata($VideoId) {
        date_default_timezone_set("UTC");
        $apiParams['Format'] = 'JSON';
        $apiParams['VideoId'] = $VideoId;
        $apiParams['Version'] = '2017-03-21';
        $apiParams['SignatureMethod'] = 'Hmac-SHA1';
        $apiParams['SignatureNonce'] = substr(md5(rand(1, 99999999)), rand(1, 9), 14);
        $apiParams['SignatureVersion'] = '1.0';
        $apiParams['Action'] = 'GetPlayInfo';
        $apiParams['AccessKeyId'] = 'LTAI4G8iytjvt28HPyNzuM7j';
        $apiParams['Timestamp'] = date("Y-m-d\TH:i:s\Z");

        $accessSecret = 'Q3JBBrMZd6rwtz6VaFfiMkU3t17qHa';
        $apiParams['Signature'] = $this->computeSignature($credential = "GET",$apiParams, $accessSecret);
        $uri = http_build_query($apiParams);
        $url = 'http://vod.cn-shanghai.aliyuncs.com/?' . $uri;
        return json_decode($this->curl($url),true);

    }
    /**
     * CURL
     */
    private function curl($url) {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $result = curl_exec($ch);
        return $result;
    }

    /**
     * 阿里云签名机制（生成签名）
     */
    private function computeSignature($credential, $parameters, $accessKeySecret) {
        ksort($parameters);
        $stringToSign = strtoupper($credential) . '&' . $this->percentEncode('/') . '&';
        $tmp = "";
        foreach ($parameters as $key => $val) {
            $tmp .= '&' . $this->percentEncode($key) . '=' . $this->percentEncode($val);
        }
        $tmp = trim($tmp, '&');
        $stringToSign = $stringToSign . $this->percentEncode($tmp);
        $key = $accessKeySecret . '&';
        $hmac = hash_hmac("sha1", $stringToSign, $key, true);
        return base64_encode($hmac);

    }
    /**
     * url编码
     * @param $str
     * @return mixed|string
     */
    protected function percentEncode($value = NULL) {
        $en = urlencode($value);
        $en = str_replace("+", "%20", $en);
        $en = str_replace("*", "%2A", $en);
        $en = str_replace("%7E", "~", $en);
        return $en;
    }
}