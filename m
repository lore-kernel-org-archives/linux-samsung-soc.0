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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C81C43460
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 21 May 2021 08:27:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 257A061057
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 21 May 2021 08:27:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231653AbhEUI25 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 21 May 2021 04:28:57 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:17138 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231686AbhEUI2y (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 May 2021 04:28:54 -0400
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20210521082727epoutp037fa25e98fe34b8e4bc0dc69bf6b5f6dc~BB44euGpb2711827118epoutp03K
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 May 2021 08:27:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20210521082727epoutp037fa25e98fe34b8e4bc0dc69bf6b5f6dc~BB44euGpb2711827118epoutp03K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1621585647;
        bh=dSDP2cg5nlvlMUqKPQMpwyhPJ1f9HE/1TYl7jAchFy0=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=g/ZEEm9SAfrZ3/w+ZJyEiK6BGZfPzUjULWQusQ5RcYNIZley1nk4gjQBMGjSbrLag
         K9FnWzBU6t0pl/nI+VUy1L14eqHRAiKmTghdLi6Cd6ycbGM+RUG2W3zCEdCsKwMzkI
         Fw92laIbh4KoDnDYwqiB70WtNYBuMTV4gjRTIfeI=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210521082727epcas1p2e0553c9775ff62675c8bd830adaa215f~BB435LYjn0855108551epcas1p2G;
        Fri, 21 May 2021 08:27:27 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.157]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4FmfqH40b0z4x9Q2; Fri, 21 May
        2021 08:27:23 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
        epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        77.3E.10258.BEE67A06; Fri, 21 May 2021 17:27:23 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210521082723epcas1p281a7e4ac6bd16316facaa90a10d9ceab~BB40LRS9u2885128851epcas1p2K;
        Fri, 21 May 2021 08:27:23 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210521082723epsmtrp2c7e97dced7e3b3353c45931179dd6e02~BB40KiXG50302003020epsmtrp2z;
        Fri, 21 May 2021 08:27:23 +0000 (GMT)
X-AuditID: b6c32a38-42fff70000002812-4a-60a76eeb6d11
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        2D.1D.08163.BEE67A06; Fri, 21 May 2021 17:27:23 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210521082722epsmtip27dcca55f7aeced2bd9caefaaaa5b2fd9~BB4z73dJ_2729227292epsmtip2S;
        Fri, 21 May 2021 08:27:22 +0000 (GMT)
Subject: Re: [PATCH] drm/exynos: Use pm_runtime_resume_and_get() to replace
 open coding
To:     Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie,
        daniel@ffwll.ch, krzysztof.kozlowski@canonical.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
From:   Inki Dae <inki.dae@samsung.com>
Message-ID: <43b89645-808b-e148-7b8e-ddb1856bd48e@samsung.com>
Date:   Fri, 21 May 2021 17:36:57 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
        Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <722b1b97-b229-2c72-6fc8-42cf294fbd7b@huawei.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGJsWRmVeSWpSXmKPExsWy7bCmge7rvOUJBj1X5Cx6z51ksvi/bSKz
        xca3P5gsNj2+xmox4/w+JovVr/exO7B5zGroZfPY+20Bi8fjuRvZPbZ/e8DqsXlJvcfnTXIB
        bFHZNhmpiSmpRQqpecn5KZl56bZK3sHxzvGmZgaGuoaWFuZKCnmJuam2Si4+AbpumTlAVygp
        lCXmlAKFAhKLi5X07WyK8ktLUhUy8otLbJVSC1JyCiwL9IoTc4tL89L1kvNzrQwNDIxMgQoT
        sjOmbLjDWjBJuGL+xaVMDYwv+LsYOTkkBEwkfqxYy9jFyMUhJLCDUeLz55VsEM4nRolvn36x
        QjifGSV+/GtmgWl59O4BVNUuRolTzx4xgiSEBN4zSvz/Xg5iCwtESuz4dBksLiKQK3Fr8n0w
        m1nAW6L7+Dowm01AVWLiivtAgzg4eAXsJO78EgQxWYDC246kglSICkRIvPk8AWwtr4CgxMmZ
        T8BsTqDq9Zc2Qk0Ul7j1ZD4ThC0v0bx1NjPIaRICnRwSpzpnsELc7CJxbF0n1P3CEq+Ob2GH
        sKUkPr/bywbR0MwoMXHGaSYIp4NR4u7j61AdxhL7l05mArmOWUBTYv0ufYiwosTO33OhruCT
        ePe1hxWkREKAV6KjTQiiREni2MUbjBC2hMSFJRPZIGwPiZlTV7BOYFScheS3WUj+mYXkn1kI
        ixcwsqxiFEstKM5NTy02LDBBjuxNjOAEqmWxg3Hu2w96hxiZOBgPMUpwMCuJ8HI7Lk8Q4k1J
        rKxKLcqPLyrNSS0+xGgKDOyJzFKiyfnAFJ5XEm9oamRsbGxhYmhmamioJM6b7lydICSQnliS
        mp2aWpBaBNPHxMEp1cCU5rKt44XwLs0stxd28uHn4ms1v9+8m+R0xUxTL65kr1/7/HMnvIr5
        +jJPSd6/3nasUF+9e13TzzfGFyLv2ZSbld011Hx85WtYm/aU9+Lnsopuhf3k2e5oHnO43OxN
        D69seZW4Y+VCMV7OQ1Yvs2P/7Js2wW7yzdI3XY9Nwl+V2NT9vO+9ckZ93aTswFzhyJRib+vY
        1LZb5/hdpLV7RI89m16cZJ4vkOco+fqxsJ08l5KjfO/X/azhr/OqA/m3/v2bqBCZeEg9PvDH
        np2r9QSfHZaeGiVXMLdvyT+elewRKwwbX67mP71he4lEVoPwqQkPtxyP3q3o1FszW+Pg0lmX
        mlr+8l84dzeIn+1wnBJLcUaioRZzUXEiADRENscpBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrELMWRmVeSWpSXmKPExsWy7bCSvO7rvOUJBt8WsVr0njvJZPF/20Rm
        i41vfzBZbHp8jdVixvl9TBarX+9jd2DzmNXQy+ax99sCFo/Hczeye2z/9oDVY/OSeo/Pm+QC
        2KK4bFJSczLLUov07RK4MqZsuMNaMEm4Yv7FpUwNjC/4uxg5OSQETCQevXvA1sXIxSEksINR
        YvfbCSxdjBxACQmJLVs5IExhicOHiyFK3jJKdOzrYgfpFRaIlNjx6TIjiC0ikCvx98dWVhCb
        WcBbovv4OkaIhmYmiW23lzCBJNgEVCUmrrjPBjKUV8BO4s4vQRCTBSi87UgqiCkqECFxbxpY
        Ma+AoMTJmU9YQGxOoOL1lzYyQkxXl/gz7xIzhC0ucevJfCYIW16ieets5gmMQrOQtM9C0jIL
        ScssJC0LGFlWMUqmFhTnpucWGxYY5aWW6xUn5haX5qXrJefnbmIER4uW1g7GPas+6B1iZOJg
        PMQowcGsJMLL7bg8QYg3JbGyKrUoP76oNCe1+BCjNAeLkjjvha6T8UIC6YklqdmpqQWpRTBZ
        Jg5OqQYm5fd2s0+XbNEP3iNcHHD8LFu3Tt+Bu1xfZkw4VLTs6ffS+uZo23vFdmnFf+pFI/eX
        Fu1cunClQoeNjPmR1pz2uml/lLJM9NsjV7cYP1o/LeFMxb0Feg/+Hp0l8HnaQqn751a6vcgM
        stbckCuqrWd7OHTewxzHuddybRf83y9eXaKZtTjw/uE9nl9WxpdHZjZPvhIZcWz20cLX66z7
        F6Xd33Usl2ezVJPrdLfJq9ROXbf5sXwv9/QNR+ZfStvOyahZLDv1hHD8uhtdSX73Ir+l209L
        6tFqrd+euSaDreiygpcARx3ffibZoz++CIhMsuQN9nTXPnL7npnLhA1Pjp64sH52lAgrd27O
        xld3lrHXK7EUZyQaajEXFScCAGja8E4FAwAA
X-CMS-MailID: 20210521082723epcas1p281a7e4ac6bd16316facaa90a10d9ceab
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210520133703epcas1p138cb4b2bc0f0bc0ef45886a16852fa60
References: <CGME20210520133703epcas1p138cb4b2bc0f0bc0ef45886a16852fa60@epcas1p1.samsung.com>
        <1621517811-64765-1-git-send-email-tiantao6@hisilicon.com>
        <0d5b2910-079e-ecd7-0985-e2b0c8c74b24@samsung.com>
        <722b1b97-b229-2c72-6fc8-42cf294fbd7b@huawei.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



21. 5. 21. 오후 3:08에 tiantao (H) 이(가) 쓴 글:
> 
> 在 2021/5/21 12:47, Inki Dae 写道:
>> Hi,
>>
>> 21. 5. 20. 오후 10:36에 Tian Tao 이(가) 쓴 글:
>>> use pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
>>> pm_runtime_put_noidle. it also avoids the problem of positive return
>>> values so we can change if (ret < 0) to if (ret).
>> Could you tell me why did you change the condition? pm_runtime_resume_and_get() can return only 0 or negative value.
>> So I think you don't have to change the condition. Could you drop this description?
>>
>>> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
>>> ---
>>>   drivers/gpu/drm/exynos/exynos_drm_mic.c | 6 ++----
>>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
>>> index 3821ea7..6d94eae 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
>>> @@ -268,11 +268,9 @@ static void mic_pre_enable(struct drm_bridge *bridge)
>>>       if (mic->enabled)
>>>           goto unlock;
>>>   -    ret = pm_runtime_get_sync(mic->dev);
>>> -    if (ret < 0) {
>>> -        pm_runtime_put_noidle(mic->dev);
>>> +    ret = pm_runtime_resume_and_get(mic->dev);
>> Right, we can use pm_runtime_resume_and_get function because pm_runtime_resume_and_get function does exactly same thing as existing code does.
>>
>>> +    if (ret)
>> Seems unnecessary change.
> 
> as you can see，If pm_runtime_resume_and_get returns 0, it means that the function was executed successfully and should not be executed in an if condition.
> 
> There is no error in continuing to use if (ret < 0), but it is not as concise as using if (ret) directly
> 

I don't see why positive value should be considered because pm_runtime_resume_and_get function never return positive value as you can see.
Is there something I'm missing?

> static inline int pm_runtime_resume_and_get(struct device *dev)
> {
>     int ret;
> 
>     ret = __pm_runtime_resume(dev, RPM_GET_PUT);
>     if (ret < 0) {
>         pm_runtime_put_noidle(dev);
>         return ret;
>     }
> 
>     return 0;
> }
>>
>> Thanks,
>> Inki Dae
>>
>>>           goto unlock;
>>> -    }
>>>         mic_set_path(mic, 1);
>>>  
>> .
>>
> 
> 
