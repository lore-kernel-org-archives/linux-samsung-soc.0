Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79DF7C433B4
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 21 May 2021 04:38:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 51E1A61261
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 21 May 2021 04:38:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239146AbhEUEj6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 21 May 2021 00:39:58 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:42144 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232873AbhEUEj6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 May 2021 00:39:58 -0400
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20210521043834epoutp048bd60740db6bff23e62be179cbe7789b~A_xB-wOQy0915809158epoutp04A
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 May 2021 04:38:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20210521043834epoutp048bd60740db6bff23e62be179cbe7789b~A_xB-wOQy0915809158epoutp04A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1621571914;
        bh=lmStXqj6vbtGULB7hLY1Frr2QQJ9tJK6dnWy5bIHnFQ=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=hyZmdmf8aOYTphBTIAagaaWNz7vyZJ3Nre+JpqVBAIXj8I6Q+dZVWYUykVDNk2YCe
         Zaxms2dKP6Oosako9BJF0feR+AR/nGtJMkkevh/dJl99qlOMfTUZ5l/tShR7bmz+ni
         GjKIHHV6XnOj/V3xw/vZxtSrhe4RCzlXmQl0eVOM=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210521043833epcas1p2da02606f89a3126824b088e88bbc58ef~A_xBiJrAD2592325923epcas1p2h;
        Fri, 21 May 2021 04:38:33 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.156]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4FmYlB5qwfz4x9Py; Fri, 21 May
        2021 04:38:30 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
        epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        63.4E.09701.64937A06; Fri, 21 May 2021 13:38:30 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210521043829epcas1p25e2dafd21b0400f0cce5db94af0ab794~A_w94XgH12826728267epcas1p2C;
        Fri, 21 May 2021 04:38:29 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210521043829epsmtrp24651031074960355aceee048e770c6dc~A_w93oqYC2007220072epsmtrp2K;
        Fri, 21 May 2021 04:38:29 +0000 (GMT)
X-AuditID: b6c32a36-631ff700000025e5-53-60a73946e075
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        6B.41.08637.54937A06; Fri, 21 May 2021 13:38:29 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210521043829epsmtip205ea0bb2e71545ffc307bfdf54159991~A_w9utxaL0585405854epsmtip27;
        Fri, 21 May 2021 04:38:29 +0000 (GMT)
Subject: Re: [PATCH] drm/exynos: Use pm_runtime_resume_and_get() to replace
 open coding
To:     Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie,
        daniel@ffwll.ch, krzysztof.kozlowski@canonical.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
From:   Inki Dae <inki.dae@samsung.com>
Message-ID: <0d5b2910-079e-ecd7-0985-e2b0c8c74b24@samsung.com>
Date:   Fri, 21 May 2021 13:47:58 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
        Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1621517811-64765-1-git-send-email-tiantao6@hisilicon.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBJsWRmVeSWpSXmKPExsWy7bCmnq6b5fIEg1tLhCx6z51ksvi/bSKz
        xca3P5gsNj2+xmox4/w+JovVr/exO7B5zGroZfPY+20Bi8fjuRvZPbZ/e8DqsXlJvcfnTXIB
        bFHZNhmpiSmpRQqpecn5KZl56bZK3sHxzvGmZgaGuoaWFuZKCnmJuam2Si4+AbpumTlAVygp
        lCXmlAKFAhKLi5X07WyK8ktLUhUy8otLbJVSC1JyCiwL9IoTc4tL89L1kvNzrQwNDIxMgQoT
        sjO2fH7OWtDHXdG9Zx97A2MnZxcjJ4eEgInExEs/GLsYuTiEBHYwSjSu2cIOkhAS+MQosaLP
        EyLxjVFiWe92VpiOxft+sUIk9jJKXL34lxnCec8o8X/aZRaQKmGBSIkdny4zgtgiArkStybf
        B7OZBbwluo+vA7PZBFQlJq64zwZi8wrYSbR2f2UGsVmA4j+e3QLbJioQIfHm8wQWiBpBiZMz
        n4DZnALuErfb3zFDzBSXuPVkPhOELS/RvHU22EESAp0cEgvuN7FDnO0icbvvHxOELSzx6vgW
        qLiUxOd3e9kgGpoZJSbOOM0E4XQwStx9fJ0FospYYv/SyUAJDqAVmhLrd+lDhBUldv6eC/UZ
        n8S7rz2sICUSArwSHW1CECVKEscu3mCEsCUkLiyZyAZhe0jMnLqCdQKj4iwkv81C8s8sJP/M
        Qli8gJFlFaNYakFxbnpqsWGBEXJ0b2IEJ1Etsx2Mk95+0DvEyMTBeIhRgoNZSYR3u/fiBCHe
        lMTKqtSi/Pii0pzU4kOMpsDQnsgsJZqcD0zjeSXxhqZGxsbGFiaGZqaGhkrivOnO1QlCAumJ
        JanZqakFqUUwfUwcnFINTJpv5EQv5+zfdUrjyof954o/zSh5zLquLWHq+c+m3xi6D3/52C72
        hS1k+m5js8V63M/Oa96qtxX12/Wyy2fXxVUVm4zt04odJ4bNUXcKuRX4/Mj5ST7KYu2bHywO
        DVukx6ST7ZtSljNV9tjdg4f2RfK+fbjmz/1yP65nRTNsbbIXz1d1etrzIvb6pjPcMy/mbJ9T
        WLz0rO8C3y8JZrL8bOsW9Kq989UMqlV9dGjb3MB+KS+p/eskNOJnrL1WXXBZPp3906wcPZaf
        xzz21Imzd1yX8tv+/lNdj6v39X3vmFep8H4qnKf3uH7pT4f9q8+slVykxc/1cVFjC19mR895
        qV3qOx6cXZv14vaqnv+VeXlKLMUZiYZazEXFiQBQJis0KwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMLMWRmVeSWpSXmKPExsWy7bCSvK6r5fIEgwd9Gha9504yWfzfNpHZ
        YuPbH0wWmx5fY7WYcX4fk8Xq1/vYHdg8ZjX0snns/baAxePx3I3sHtu/PWD12Lyk3uPzJrkA
        tigum5TUnMyy1CJ9uwSujC2fn7MW9HFXdO/Zx97A2MnZxcjJISFgIrF43y/WLkYuDiGB3YwS
        Ty4eZOxi5ABKSEhs2coBYQpLHD5cDFHyllGia9Z9RpBeYYFIiR2fLoPZIgK5En9/bGUFsZkF
        vCW6j68DiwsJzGKU6H7JBGKzCahKTFxxnw3E5hWwk2jt/soMYrMAxX88u8UKsktUIELi3jQm
        iBJBiZMzn7CA2JwC7hK3298xQ4xXl/gz7xKULS5x68l8JghbXqJ562zmCYxCs5C0z0LSMgtJ
        yywkLQsYWVYxSqYWFOem5xYbFhjmpZbrFSfmFpfmpesl5+duYgTHi5bmDsbtqz7oHWJk4mA8
        xCjBwawkwrvde3GCEG9KYmVValF+fFFpTmrxIUZpDhYlcd4LXSfjhQTSE0tSs1NTC1KLYLJM
        HJxSDUySfdx3fH9m8c+P8J8c8Orb3JWfJm1VlFI2l4m+GNC3Nn/7omdXPt2fyjDJKyYnae0m
        jZSo6aJJwkqzFT07f4vHfPz2bbqy1HLexV1hf0SM9Hq9uFqOpPzf5fIvuvbZMfPsb52dHQsj
        J0TN3dUrnjf3x4ktob/Pvpu017z07KmGrHj2830yFT8vKiyWePRXlvuI23OnD2sffWH0rzuZ
        fbzw9QO1Y7HeNatztf8t0Ohdcd91vt+S7xEXRJuNLVXtJ8/+Fztd/EKO07IVFXN9Jvrt235H
        vjH6SPw3lhivl2bNccqzD956fM7t2YSp6/6xBR6LsP7jdSZJNGcLxwalnFyVMme7SI59oumt
        cdFarLlKLMUZiYZazEXFiQDO0PJyBgMAAA==
X-CMS-MailID: 20210521043829epcas1p25e2dafd21b0400f0cce5db94af0ab794
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210520133703epcas1p138cb4b2bc0f0bc0ef45886a16852fa60
References: <CGME20210520133703epcas1p138cb4b2bc0f0bc0ef45886a16852fa60@epcas1p1.samsung.com>
        <1621517811-64765-1-git-send-email-tiantao6@hisilicon.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

21. 5. 20. 오후 10:36에 Tian Tao 이(가) 쓴 글:
> use pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
> pm_runtime_put_noidle. it also avoids the problem of positive return
> values so we can change if (ret < 0) to if (ret).

Could you tell me why did you change the condition? pm_runtime_resume_and_get() can return only 0 or negative value.
So I think you don't have to change the condition. Could you drop this description?

> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_mic.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
> index 3821ea7..6d94eae 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
> @@ -268,11 +268,9 @@ static void mic_pre_enable(struct drm_bridge *bridge)
>  	if (mic->enabled)
>  		goto unlock;
>  
> -	ret = pm_runtime_get_sync(mic->dev);
> -	if (ret < 0) {
> -		pm_runtime_put_noidle(mic->dev);
> +	ret = pm_runtime_resume_and_get(mic->dev);

Right, we can use pm_runtime_resume_and_get function because pm_runtime_resume_and_get function does exactly same thing as existing code does.

> +	if (ret)

Seems unnecessary change.

Thanks,
Inki Dae

>  		goto unlock;
> -	}
>  
>  	mic_set_path(mic, 1);
>  
> 
