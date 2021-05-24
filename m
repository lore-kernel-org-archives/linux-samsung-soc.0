Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AFD0C47085
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 24 May 2021 12:08:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6AC89613B0
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 24 May 2021 12:08:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232665AbhEXMKF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 24 May 2021 08:10:05 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5681 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232516AbhEXMKF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 May 2021 08:10:05 -0400
Received: from dggems705-chm.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FpbWs4H1Rz1BPTj;
        Mon, 24 May 2021 20:05:45 +0800 (CST)
Received: from dggeme759-chm.china.huawei.com (10.3.19.105) by
 dggems705-chm.china.huawei.com (10.3.19.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 24 May 2021 20:08:35 +0800
Received: from [127.0.0.1] (10.40.188.144) by dggeme759-chm.china.huawei.com
 (10.3.19.105) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 24
 May 2021 20:08:35 +0800
Subject: Re: [PATCH v2] drm/exynos: Use pm_runtime_resume_and_get() to replace
 open coding
To:     Inki Dae <inki.dae@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
        Tian Tao <tiantao6@hisilicon.com>
CC:     <airlied@linux.ie>, <krzysztof.kozlowski@canonical.com>,
        <dri-devel@lists.freedesktop.org>,
        <linux-samsung-soc@vger.kernel.org>
References: <1621587966-62687-1-git-send-email-tiantao6@hisilicon.com>
 <CGME20210521153142epcas1p3d80ee0b402cdbf767007e8bf05b33e2d@epcas1p3.samsung.com>
 <YKfSVdw16TPLlEKX@phenom.ffwll.local>
 <6570cce1-c36c-a91c-1590-542e4d2712af@samsung.com>
From:   "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <c01eaf24-58c9-98cb-355e-33284172ac0b@huawei.com>
Date:   Mon, 24 May 2021 20:08:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6570cce1-c36c-a91c-1590-542e4d2712af@samsung.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.40.188.144]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggeme759-chm.china.huawei.com (10.3.19.105)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


在 2021/5/24 20:05, Inki Dae 写道:
>
> 21. 5. 22. 오전 12:31에 Daniel Vetter 이(가) 쓴 글:
>> On Fri, May 21, 2021 at 05:06:06PM +0800, Tian Tao wrote:
>>> use pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
>>> pm_runtime_put_noidle.
>> It would be good to explain why: Apparently get_sync increments the
>> refcount even if it fails, which ususally leads to leaks.
> Tian Tao, could you update the description?
done:-)
>
> Thanks,
> Inki Dae
>
>> With that or similar added to the commit message:
>>
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>
>>> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
>>> ---
>>>
>>> v2: drop unnecessary change about if condition.
>>> ---
>>>   drivers/gpu/drm/exynos/exynos_drm_mic.c | 6 ++----
>>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
>>> index 3821ea7..32672bf 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
>>> @@ -268,11 +268,9 @@ static void mic_pre_enable(struct drm_bridge *bridge)
>>>   	if (mic->enabled)
>>>   		goto unlock;
>>>   
>>> -	ret = pm_runtime_get_sync(mic->dev);
>>> -	if (ret < 0) {
>>> -		pm_runtime_put_noidle(mic->dev);
>>> +	ret = pm_runtime_resume_and_get(mic->dev);
>>> +	if (ret < 0)
>>>   		goto unlock;
>>> -	}
>>>   
>>>   	mic_set_path(mic, 1);
>>>   
>>> -- 
>>> 2.7.4
>>>
> .
>

