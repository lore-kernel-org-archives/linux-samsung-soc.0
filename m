Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DAB137923
	for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Mar 2026 07:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773472897; cv=none; b=TfiFpVSsZuwF3iOZ4hrw0u8AUKdhgbMpZL7NF88YGMGkwBhJoB+xyi6GuXH75AKY/tvdeg+JcP3J8ZFCPrDxTEbLt/CaGN8QUXJ3xW3FpV61I1jxZdkAn32dFDxbeDXdFyWhDT1EHVFMc+LIDsR22mxw7v81LB7LRO5aiRZJPPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773472897; c=relaxed/simple;
	bh=n3gQPsBYj95+UFJRlTWdyN6szSVhNHeFCq3ECtPYD44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=so31EfOn8GbMtbGx7Nw3v9NXb6DldAitjW7yfqtz/EwJbThPtY9BuGh1aOP/gP9FVkK4qtlU653DuHMS95Gc4I2nJj5J0ZwrA4CFVW4YHRxbn78uBneZhj03aYtqFL3BchSR5x1DKamFgXAB1HZzhAVaWSLkJgOQu8NrltV90yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pjQdafnH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JC+C+w3I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pjQdafnH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JC+C+w3I"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62E5Tjvv3539792
	for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Mar 2026 07:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QU2LBcgAvCPPWBcn4VVnnvgq9slBddM7xfCczZ90R/I=; b=pjQdafnHGkZ+aKVc
	NdCKU6UoGRmo30NPqRauAzKQypsIDLgBGDrHWssiH8b1R80YvABqEinbEMBBWawZ
	jgAgkvb08v1XTTFuxikbLKktTL4frjF9Oi1T8J6VMi45tWN1Qlwv/4ZMLhhnI4sW
	hiUm5XfFAFqcnQX644xm8YJUkEZlGHsTL1EnhCdv/VJcpzhMJBHwXELJaGFXRgmS
	NM1X/wRj7GV35pfkp7Z7h6Zm0UxN9pJIzWil79wK9sPh+2XUM3JqG1/bf5Q0bcmP
	Bpn70+1aSiCG2JlNTR2u44goUcEBhsqvekqI2iwkW8bB9BGACdBvZLSkPvPVDzB9
	99DW8g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0278a5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Mar 2026 07:21:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2adc527eaf5so21984405ad.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Mar 2026 00:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773472894; x=1774077694; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QU2LBcgAvCPPWBcn4VVnnvgq9slBddM7xfCczZ90R/I=;
        b=JC+C+w3Il99qRcwWLupaiwONE7dmAOroQAqCmZyCAsBDpn6Og8nAkf0quVvqSim6g0
         GPkVkZAcXbDnM5hInNz1p4dw+ddKXTmc6lKZm8rruGyx1EJDH19Ferne4FCZHcqhJ7xR
         SzHCozyZ0WQBdXgcOud+jOY6LIgSASHQlZonWc5OIGlhdTn6LDrvqbe9scFIBVJYcH5/
         Es2Yu2/RHnmLpvtC1Ys5V2Jqs0RPG+o9yYdypEybyqUT4STMdvm7O/I43CvsCEW+KvWT
         tj6WMkoLo//Ved3sKE/xUecDR7sShDUz7xNRq+KIwdtMnK4yAiHewSsNfK1pPTwGo2Wx
         G4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773472894; x=1774077694;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QU2LBcgAvCPPWBcn4VVnnvgq9slBddM7xfCczZ90R/I=;
        b=m8BJkpNU0Xe6Wd6E5ze2NJEXnsdTIGVKK1odU7GxikF3GrEv6Bu20hcqtYJ341QPdx
         skRlXGpAf9AzPJ6wbk7QOTKSHvXHAcebaCXKYdPkXKysK5321VP1KADG3wSA0AWY0j1j
         TFrI7RUTAMzKxTInTHWR1+oSl46XIIwX7w/hXCfYI9a5nCN2ULyb8HFNKyNUzjqlFqtd
         hp/0+OctsoPSHTYFbP8VHfPRnaEbR+CpiUQJMoiPP48oUWqncbowAjpRIkl896djB8X6
         pdtR9DdspBxFKqvVw1UPyzeYuXy0nQH8IkeCKPv6V4Vav6yswZdGyxMYeyX0gN4fg5Yc
         h+eA==
X-Forwarded-Encrypted: i=1; AJvYcCUMF4R3EO8JLY1ymxnVWNksGr/szJt2N0TBYRqvsMrHPE9/LlLdSsoMGacnxFpEeyPsq0CZQTaAdeqpVtGZT4ivdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSZnOmDIugo/S3y19EuEb6LqpcjaKUeBnWNa9NYhUmsxDR0OOI
	N9SdEZrqO7rwRWZfgtc45Tzrhje5Nnam4kBCmyLH2Tg9FK92o3teGzM4If/DM7b3UvO803GXDN7
	KAn1LJvK5toMiu3Ck1vylLoCxTCZhS4tQz0MoFsLFWghwhWEvcJu11vk1nDGcgyp5p3cU+eyc4g
	==
X-Gm-Gg: ATEYQzw11kGZHaV+HdOIU+K+7RMGamu/sZrJrQRHQj1xitFslip2hezKzYHz7YM70gG
	erYse79wUjyu8nyY37tmonKlK5AlkLMJOYduTDLRa+jDb+faypBEMhzJRKjVfWoz0dj+4ssIRQb
	+2QCkCUYE9Kz3UNhco86drCZtUM0/kjCNPY9skD/8iRYPf3dIJ7qiYOXhIXXAPZpJtr7x5uPGNO
	9FNf+jJB1iSQPEJiFASCL69m61f5/89zOF70zreWyuhI794swYIxGWeND2O68cPiE3y+RJiBpDo
	JaxwIRlpw5oHTt7jNr0JRDpjuMq0dTJ/8Ey7csoYzZXl72UUHusxETDMziZVpe4nlyubYUcuqYm
	uufieuiA8QgSgzRi7XgL3N6eGfWFcxYenyY8IAoFETpTv0joN8DyT5lStJbYxTfMsnDYWQECoay
	u3fySIkQ081g==
X-Received: by 2002:a17:903:2b03:b0:2ae:557e:1f75 with SMTP id d9443c01a7336-2aecab07540mr57767845ad.29.1773472894141;
        Sat, 14 Mar 2026 00:21:34 -0700 (PDT)
X-Received: by 2002:a17:903:2b03:b0:2ae:557e:1f75 with SMTP id d9443c01a7336-2aecab07540mr57767635ad.29.1773472893643;
        Sat, 14 Mar 2026 00:21:33 -0700 (PDT)
Received: from [10.133.33.24] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece8453cdsm41005825ad.84.2026.03.14.00.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 00:21:33 -0700 (PDT)
Message-ID: <7b40df1f-1c53-47e9-99bb-13d6d030eeaf@oss.qualcomm.com>
Date: Sat, 14 Mar 2026 15:21:23 +0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] scsi: ufs: core: Introduce a new ufshcd vops
 negotiate_pwr_mode()
To: Bart Van Assche <bvanassche@acm.org>, avri.altman@wdc.com,
        beanhuo@micron.com, martin.petersen@oracle.com, mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
        Ajay Neeli <ajay.neeli@amd.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Wang <peter.wang@mediatek.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Stanley Jhu <chu.stanley@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        "Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Archana Patni <archana.patni@intel.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-samsung-soc@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
        "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>
References: <20260308151409.3779137-1-can.guo@oss.qualcomm.com>
 <20260308151409.3779137-2-can.guo@oss.qualcomm.com>
 <fff6bc07-169b-48aa-a6c2-0d243bad0d82@acm.org>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <fff6bc07-169b-48aa-a6c2-0d243bad0d82@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6xo8RTvUZuwu9ycHpl4trN03gwN3d2Fz
X-Proofpoint-ORIG-GUID: 6xo8RTvUZuwu9ycHpl4trN03gwN3d2Fz
X-Authority-Analysis: v=2.4 cv=AqXjHe9P c=1 sm=1 tr=0 ts=69b50c7f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=CqDDh8lFt03Jwv5G6gcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDA1NSBTYWx0ZWRfXx6c6k3A29SAE
 U8hEAkCKcGLuZ2SLrAPPN0hG3amc+OrIS3lg/xpensuzoRTh0q+EhyFCq4q54JVhqnXiPJiyCDa
 Bo6zSC0RMXv177kpj6wIhg5NJJcwJttAsGxRYYT1n83P2/M8lKPUiiZa6LmZH8WaiKv+EFogJdB
 zXX53Bx+004Fc6zUDw5ywR3r2MEkbiykm6dsKsv2HkJl0SBN9/XEkfXnGy88W/YvpYy4eJsm0uT
 +VA2Wng8Oc7BfTzpfX+Gc+/6SiWh404Z8e0YuHt/gvE9sBufa6iEyyDhOxLuRrIho4cUBXo/4eg
 nfOnTtk4DSor83x6tDSl0V2F50IEv9mUa2PDFuo6FqZ7cH9JuVNtuYXwNEkQxXPqeWIAkDY+XyG
 6apkHC3O2dPyFvArOgDQIHEgoDTq3Arz16zS4oBYSQpg40Fhn/Pj4HBVWuzMHcjt/9YTTbd2vSV
 9VMO+Ib+GcurDJFsf2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-14_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603140055

Hi Bart,

On 3/14/2026 6:09 AM, Bart Van Assche wrote:
> On 3/8/26 8:13 AM, Can Guo wrote:
>> +static int exynos_ufs_negotiate_pwr_mode(struct ufs_hba *hba,
>> +                     const struct ufs_pa_layer_attr *dev_max_params,
>> +                     struct ufs_pa_layer_attr *dev_req_params)
>> +{
>> +    struct ufs_host_params host_params;
>> +    int ret;
>> +
>> +    if (!dev_req_params) {
>> +        pr_err("%s: incoming dev_req_params is NULL\n", __func__);
>> +        return -EINVAL;
>> +    }
>> +
>> +    ufshcd_init_host_params(&host_params);
>> +
>> +    /* This driver only support symmetric gear setting e.g. 
>> hs_tx_gear == hs_rx_gear */
>> +    host_params.hs_tx_gear = exynos_ufs_get_hs_gear(hba);
>> +    host_params.hs_rx_gear = exynos_ufs_get_hs_gear(hba);
>> +
>> +    ret = ufshcd_negotiate_pwr_params(&host_params, dev_max_params, 
>> dev_req_params);
>> +    if (ret)
>> +        pr_err("%s: failed to determine capabilities\n", __func__);
>> +
>> +    return ret;
>> +}
>
> The dev_req_params test is not necessary since the UFS core never 
> passes a NULL pointer as third argument, isn't it? I propose to remove 
> the
> dev_req_params test.
I considered the same when I made the change but I didn't do so because 
I wanted to keep
the original codes as same as possible in vendor specific implementations...

I will remove the check in next version and see if their maintainers are 
OK with that or not.
>
>> +static int ufs_hisi_negotiate_pwr_mode(struct ufs_hba *hba,
>> +                       const struct ufs_pa_layer_attr *dev_max_params,
>> +                       struct ufs_pa_layer_attr *dev_req_params)
>> +{
>> +    struct ufs_host_params host_params;
>> +    int ret;
>> +
>> +    if (!dev_req_params) {
>> +        dev_err(hba->dev, "%s: incoming dev_req_params is NULL\n", 
>> __func__);
>> +        return -EINVAL;
>> +    }
>> +
>> +    ufs_hisi_set_dev_cap(&host_params);
>> +    ret = ufshcd_negotiate_pwr_params(&host_params, dev_max_params, 
>> dev_req_params);
>> +    if (ret)
>> +        dev_err(hba->dev, "%s: failed to determine capabilities\n", 
>> __func__);
>> +
>> +    return ret;
>> +}
>
> Same comment here - please remove the dev_req_params test.
Will do.
>
>> +static int ufs_qcom_negotiate_pwr_mode(struct ufs_hba *hba,
>> +                       const struct ufs_pa_layer_attr *dev_max_params,
>> +                       struct ufs_pa_layer_attr *dev_req_params)
>>   {
>>       struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>>       struct ufs_host_params *host_params = &host->host_params;
>> +    int ret;
>> +
>> +    if (!dev_req_params) {
>> +        pr_err("%s: incoming dev_req_params is NULL\n", __func__);
>> +        return -EINVAL;
>> +    }
>> +
>> +    ret = ufshcd_negotiate_pwr_params(host_params, dev_max_params, 
>> dev_req_params);
>> +    if (ret)
>> +        dev_err(hba->dev, "%s: failed to determine capabilities\n", 
>> __func__);
>> +
>> +    return ret;
>> +}
>
> Also here, please remove the dev_req_params test.
Sure.
>
> Additionally, I see that identical "if (ret) dev_err(...)" code occurs
> in the three callbacks shown above. Shouldn't that code be moved into
> the only caller of these functions in the UFS core?
Point taken.

Thanks,
Can Guo.
>
> Thanks,
>
> Bart.

