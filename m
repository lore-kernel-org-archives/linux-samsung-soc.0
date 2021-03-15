Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C079AC433DB
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Mar 2021 07:29:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D49F64DE4
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Mar 2021 07:29:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbhCOH2m (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 15 Mar 2021 03:28:42 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:22436 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbhCOH2Y (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 15 Mar 2021 03:28:24 -0400
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20210315072822epoutp02f7be6d0b598dc28d884ef916fd110bd8~sc3KGKj6C1360513605epoutp02R
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Mar 2021 07:28:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20210315072822epoutp02f7be6d0b598dc28d884ef916fd110bd8~sc3KGKj6C1360513605epoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1615793302;
        bh=W4rJ99qkpqE4Aix67bTRAH3sbG9gvSQJ5mXUd21FDTU=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=QrrN76uThDFKUr5pIohO/uW0OeSieHYUn8H3fM+bSZUOz0iGr0hGyuDvSnGETIlZg
         xDOVfC85RTShSc2P248IH6LRPkRMfux8MuiIFnqUtOpNTdSzfgyH+VBNqNQcGvx6Kl
         NIfy5LpmawAuYQNTxEstQB2klBYe2bxPS4o6sa3g=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20210315072821epcas1p30a9d10f37a01160b78a6d3fc8126ee23~sc3JtMo9g3100331003epcas1p3j;
        Mon, 15 Mar 2021 07:28:21 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.155]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4DzSh32P2Xz4x9Px; Mon, 15 Mar
        2021 07:28:19 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
        epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        6A.7E.02418.29C0F406; Mon, 15 Mar 2021 16:28:18 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210315072817epcas1p2cafc753cd81b1d1171532e013eac64bd~sc3GHUmj31802018020epcas1p2l;
        Mon, 15 Mar 2021 07:28:17 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210315072817epsmtrp1ba30a349d27de734b18348020dd1e372~sc3GGjPvA0427604276epsmtrp1g;
        Mon, 15 Mar 2021 07:28:17 +0000 (GMT)
X-AuditID: b6c32a35-c23ff70000010972-78-604f0c9285ea
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        F9.EE.13470.19C0F406; Mon, 15 Mar 2021 16:28:17 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210315072817epsmtip29fc480d31db905adc12b2c2e883c36b4~sc3F3DFmB3031630316epsmtip2S;
        Mon, 15 Mar 2021 07:28:17 +0000 (GMT)
Subject: Re: [PATCH] drm/exynos/decon5433: Clean up GPIO includes
To:     Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie,
        daniel@ffwll.ch, krzk@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
From:   Inki Dae <inki.dae@samsung.com>
Message-ID: <ed1e2d7b-242a-7a9f-46dd-9a81af0dd19d@samsung.com>
Date:   Mon, 15 Mar 2021 16:37:11 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
        Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1e83f1d7-20c7-0ab3-0d8d-e331e7e5d09c@huawei.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAJsWRmVeSWpSXmKPExsWy7bCmge4kHv8Eg39tUha9504yWfzfNpHZ
        4srX92wW589vYLfY9Pgaq8WM8/uYLFa/3sfuwO6x99sCFo/Hczeye2xa1cnmsf3bA1aP+93H
        mTw2L6n3+LxJLoA9KtsmIzUxJbVIITUvOT8lMy/dVsk7ON453tTMwFDX0NLCXEkhLzE31VbJ
        xSdA1y0zB+geJYWyxJxSoFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpBSk6BZYFecWJucWleul5y
        fq6VoYGBkSlQYUJ2xoLpJ9gLtotUXJt0gKmBcYVgFyMnh4SAicSUz/+Yuxi5OIQEdjBKzO2d
        zQ7hfGKUaJt7hQXC+cYocfzGb2aYlrX3v7KA2EICexklzq5xgrDfA7VflQWxhQUcJd4t/sMO
        YosIREss+vyKFcRmFsiTuPjrKZjNJqAqMXHFfTYQm1fATmJ55wSwOAtQ/NLBPWBxUYEIiePd
        k9khagQlTs58AraXE6j+4NcXbBAzxSVuPZnPBGHLSzRvnQ32joTAVA6Jp0e+ATkcQI6LxMsf
        MRD3C0u8Or6FHcKWknjZ38YOUd/MKDFxxmkmCKeDUeLu4+ssEFXGEvuXTmYCGcQsoCmxfpc+
        RFhRYufvuYwQi/kk3n3tYYXYxSvR0SYEUaIkceziDUYIW0LiwpKJbBC2h8SMI01sExgVZyF5
        bRaSd2YheWcWwuIFjCyrGMVSC4pz01OLDQsMkSN7EyM4qWqZ7mCc+PaD3iFGJg7GQ4wSHMxK
        IryfdXwThHhTEiurUovy44tKc1KLDzGaAgN7IrOUaHI+MK3nlcQbmhoZGxtbmBiamRoaKonz
        Jhk8iBcSSE8sSc1OTS1ILYLpY+LglGpg2rxr+2ej+ysXPf2WfcHsfEbY0zX7p6///+x0iOK+
        37vWvjxrHyu6p46xMOUdi8ETyegFbR7zju/v8POUtOv/of5wwzOldWUFFzjPfZhZVvf9yjlB
        joVSCbcl8z5s/hMSJP1VWI9J5JZZ+grXpFvO66s3PZbctnxn8tEEpm9PWG+f/W1cavnjr1v6
        LLk7D8Q9i1bISx3ytWzTdizoLrrqqCgss7D0l/N8g1tzuHPVhEOm7Z88K2GbWvwC9kdWz3bq
        t21i/7lPdurx9cFs3Il2f18czuDXkg8Tc7Cs21UWPC20QLfognTKhUvei8IXGSyJk/lg/+fI
        hbvRK9MCU5slI/wFvytPvmxu2eMvUrdURImlOCPRUIu5qDgRAJ7WXH0zBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPLMWRmVeSWpSXmKPExsWy7bCSvO5EHv8Eg+vv1Cx6z51ksvi/bSKz
        xZWv79kszp/fwG6x6fE1VosZ5/cxWax+vY/dgd1j77cFLB6P525k99i0qpPNY/u3B6we97uP
        M3lsXlLv8XmTXAB7FJdNSmpOZllqkb5dAlfGgukn2Au2i1Rcm3SAqYFxhWAXIyeHhICJxNr7
        X1m6GLk4hAR2M0qcvT2NqYuRAyghIbFlKweEKSxx+HAxRMlbRolFP6czg/QKCzhKvFv8hx3E
        FhGIlvjZvYUFxGYWyJOYvH0BE0RDM5PE+rc/mEASbAKqEhNX3GcDsXkF7CSWd05gBbFZgOKX
        Du4Bi4sKREi03IcYyisgKHFy5hOwoZxA9Qe/vmCDWKAu8WfeJWYIW1zi1pP5TBC2vETz1tnM
        ExiFZiFpn4WkZRaSlllIWhYwsqxilEwtKM5Nzy02LDDMSy3XK07MLS7NS9dLzs/dxAiOIy3N
        HYzbV33QO8TIxMF4iFGCg1lJhPezjm+CEG9KYmVValF+fFFpTmrxIUZpDhYlcd4LXSfjhQTS
        E0tSs1NTC1KLYLJMHJxSDUwGSZp1jy8wLHwbclGkVXOH2YOmoiSug9cy3CuKV/5dUxVqLrsq
        copPZFXaCqm3NQ5rI4oe/3P069rQnsp0O7Tyd2a3bb7IoZusG5zOL9zp8iJRSt8sRPAhb3Zv
        1eoWHd8Lx34pfhP/ZXzrUNfK+5uSyuNKtv3zur3p4K5i09f+U7N6tSbVsPCclik3/q7g98gr
        jFsjNYX50DItl2ZeYeOftecVVQ7GqGf4O7zd2ed74E1Khs+U7PLdCkZmxaeeCtjdS5n0ZJH2
        YQ/z3SVbGI/zfr/Yqn1O/Zguo0pfjsK5C7Gfld2SSzTeX/PUTIw4wB3+nzNA/AhzpHCbLUec
        Vlxr2aqzhrn/8702H1ulxFKckWioxVxUnAgAgKtpURIDAAA=
X-CMS-MailID: 20210315072817epcas1p2cafc753cd81b1d1171532e013eac64bd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210303014433epcas1p4fefd6787c74d86d6f11f93318c3833fd
References: <CGME20210303014433epcas1p4fefd6787c74d86d6f11f93318c3833fd@epcas1p4.samsung.com>
        <1614654193-40203-1-git-send-email-tiantao6@hisilicon.com>
        <3fb21326-8e4a-51bf-4f7c-7a3215f08803@samsung.com>
        <1e83f1d7-20c7-0ab3-0d8d-e331e7e5d09c@huawei.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



21. 3. 15. 오후 3:45에 tiantao (H) 이(가) 쓴 글:
> 
> 在 2021/3/15 14:35, Inki Dae 写道:
>> Hi Tian Tao,
>>
>> 21. 3. 2. 오후 12:03에 Tian Tao 이(가) 쓴 글:
>>> remove the legacy GPIO headers <linux/of_gpio.h> but what it really
>>> uses is <linux/gpio/consumer.h> since only gpio_desc structs are ever
>>> referenced.
>> This driver doesn't reference even linux/gpio/consumer.h so could you drop only of_gpio.h inclusion?
> 
> Thanks for helping to review patch,I've posted a new patch to fix this problem  If you can give me review-by, I can help push to drm-misc.

I can merge this patch and other one[1] to exynos drm tree after review, and will have a pull-request soon so no need to land to drm-misc tree.
Let's not bother Daniel. :)

[1] https://patchwork.kernel.org/project/dri-devel/patch/1615549385-33784-1-git-send-email-tiantao6@hisilicon.com/

Thanks,
Inki Dae

> 
> Subject: [PATCH] drm/exynos/decon5433: Remove the unused include statements
> 
> This driver doesn't reference of_gpio.h, so drop it.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> index 1f79bc2..1510e4e 100644
> --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> @@ -13,7 +13,6 @@
>  #include <linux/irq.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/of_device.h>
> -#include <linux/of_gpio.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
> 
>>
>> Thanks,
>> Inki Dae
>>
>>> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
>>> ---
>>>   drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
>>> index 1f79bc2..9fc51a6 100644
>>> --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
>>> +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
>>> @@ -11,9 +11,9 @@
>>>   #include <linux/component.h>
>>>   #include <linux/iopoll.h>
>>>   #include <linux/irq.h>
>>> +#include <linux/gpio/consumer.h>
>>>   #include <linux/mfd/syscon.h>
>>>   #include <linux/of_device.h>
>>> -#include <linux/of_gpio.h>
>>>   #include <linux/platform_device.h>
>>>   #include <linux/pm_runtime.h>
>>>   #include <linux/regmap.h>
>>>
>> .
>>
> 
> 
