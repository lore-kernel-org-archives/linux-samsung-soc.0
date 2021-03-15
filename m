Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4EEBC433DB
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Mar 2021 06:44:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74CB861481
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Mar 2021 06:44:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbhCOGoG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 15 Mar 2021 02:44:06 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:14336 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbhCOGng (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 15 Mar 2021 02:43:36 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DzRfH4Pg9z8xlQ;
        Mon, 15 Mar 2021 14:41:43 +0800 (CST)
Received: from [127.0.0.1] (10.40.188.144) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.498.0; Mon, 15 Mar 2021
 14:43:27 +0800
Subject: Re: [PATCH] drm/exynos/decon5433: Clean up GPIO includes
To:     Inki Dae <inki.dae@samsung.com>, Tian Tao <tiantao6@hisilicon.com>,
        <airlied@linux.ie>, <daniel@ffwll.ch>, <krzk@kernel.org>
CC:     <dri-devel@lists.freedesktop.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>
References: <CGME20210303014433epcas1p4fefd6787c74d86d6f11f93318c3833fd@epcas1p4.samsung.com>
 <1614654193-40203-1-git-send-email-tiantao6@hisilicon.com>
 <3fb21326-8e4a-51bf-4f7c-7a3215f08803@samsung.com>
From:   "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <bb8f7bae-6621-b149-b41e-363b34bd2428@huawei.com>
Date:   Mon, 15 Mar 2021 14:43:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3fb21326-8e4a-51bf-4f7c-7a3215f08803@samsung.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.40.188.144]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


在 2021/3/15 14:35, Inki Dae 写道:
> Hi Tian Tao,
>
> 21. 3. 2. 오후 12:03에 Tian Tao 이(가) 쓴 글:
>> remove the legacy GPIO headers <linux/of_gpio.h> but what it really
>> uses is <linux/gpio/consumer.h> since only gpio_desc structs are ever
>> referenced.
> This driver doesn't reference even linux/gpio/consumer.h so could you drop only of_gpio.h inclusion?
Thanks for helping to review patch, If you can give me review-by, I can 
help push to drm-misc.
> Thanks,
> Inki Dae
>
>> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
>> ---
>>   drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
>> index 1f79bc2..9fc51a6 100644
>> --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
>> +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
>> @@ -11,9 +11,9 @@
>>   #include <linux/component.h>
>>   #include <linux/iopoll.h>
>>   #include <linux/irq.h>
>> +#include <linux/gpio/consumer.h>
>>   #include <linux/mfd/syscon.h>
>>   #include <linux/of_device.h>
>> -#include <linux/of_gpio.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/pm_runtime.h>
>>   #include <linux/regmap.h>
>>
> .
>

