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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F28EC433E0
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Mar 2021 06:28:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A88F64E33
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Mar 2021 06:28:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbhCOG2S (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 15 Mar 2021 02:28:18 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:56450 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbhCOG2B (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 15 Mar 2021 02:28:01 -0400
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20210315062759epoutp02b1e38f1a1dd8290481e923484eadb8ca~scCclX8gX2528425284epoutp02v
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Mar 2021 06:27:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20210315062759epoutp02b1e38f1a1dd8290481e923484eadb8ca~scCclX8gX2528425284epoutp02v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1615789679;
        bh=ljwtFnDGAhGeIvjmwPJhEq+BYeIDRG8xkcQeTsi0flo=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=cGuLDiuj1u3EqVcSscVhp5FAiBAZsB3tdhY6QehJUZIY1Lokb+b/AN0qu6z496ePQ
         ZngeNUO6bpF27ThNLp0pmlyGM6gd0WU+LDcikJx9EcQwxir6VENzHXwJdFq2yVoMiV
         yshJQs2H22eBOVjz/d6O3daLBjvIoUjakPduUKdE=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20210315062759epcas1p3fea5cacc10879f163b1ecd2ea7ce753e~scCcGHLRO2823628236epcas1p3R;
        Mon, 15 Mar 2021 06:27:59 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.156]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4DzRLJ6tZSz4x9Q8; Mon, 15 Mar
        2021 06:27:52 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        B2.A2.09582.F3EFE406; Mon, 15 Mar 2021 15:27:11 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210315062710epcas1p107e8186b2138c671620dabf3abd4aea4~scBvFGPtC0400404004epcas1p1y;
        Mon, 15 Mar 2021 06:27:10 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210315062710epsmtrp1669c5c8954c1feb813ba1366d2645dbf~scBvETO8-0391803918epsmtrp1g;
        Mon, 15 Mar 2021 06:27:10 +0000 (GMT)
X-AuditID: b6c32a37-899ff7000000256e-d5-604efe3fa6bd
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        B5.A7.08745.E3EFE406; Mon, 15 Mar 2021 15:27:10 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210315062710epsmtip147767b205d7b4af420928428e985dc26~scBu2Fifa2860828608epsmtip1S;
        Mon, 15 Mar 2021 06:27:10 +0000 (GMT)
Subject: Re: [PATCH] drm/exynos/decon5433: Clean up GPIO includes
To:     Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie,
        daniel@ffwll.ch, krzk@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
From:   Inki Dae <inki.dae@samsung.com>
Message-ID: <3fb21326-8e4a-51bf-4f7c-7a3215f08803@samsung.com>
Date:   Mon, 15 Mar 2021 15:35:48 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
        Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1614654193-40203-1-git-send-email-tiantao6@hisilicon.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEJsWRmVeSWpSXmKPExsWy7bCmvq79P78Eg76dwha9504yWfzfNpHZ
        4srX92wW589vYLfY9Pgaq8WM8/uYLFa/3sfuwO6x99sCFo/Hczeye2xa1cnmsf3bA1aP+93H
        mTw2L6n3+LxJLoA9KtsmIzUxJbVIITUvOT8lMy/dVsk7ON453tTMwFDX0NLCXEkhLzE31VbJ
        xSdA1y0zB+geJYWyxJxSoFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpBSk6BZYFecWJucWleul5y
        fq6VoYGBkSlQYUJ2xqMHf9kLPnBUrHm0kLGB8QB7FyMnh4SAicTcKftYuxi5OIQEdjBKvL0M
        kgBxPjFKbG3fA+V8ZpR4ueIeM0xL2463UIldjBKbZ/cwQTjvGSUa294yglQJCzhKvFv8B2yJ
        iEC0xKLPr1hBbGaBPImLv56C2WwCqhITV9xnA7F5BewkjpxvB6tnAYqv+PAAzBYViJA43j2Z
        HaJGUOLkzCcsIDangLvEkzVL2CFmikvcejKfCcKWl2jeOpsZ5CAJgakcEpO+vANaxgHkuEis
        XWUC8YGwxKvjW6ABICXxsr+NHaK+mVFi4ozTTBBOB6PE3cfXWSCqjCX2L53MBDKIWUBTYv0u
        fYiwosTO33MZIRbzSbz72gO1i1eio00IokRJ4tjFG4wQtoTEhSUT2SBsD4kZR5rYJjAqzkLy
        2iwk78xC8s4shMULGFlWMYqlFhTnpqcWGxYYI0f3JkZwYtUy38E47e0HvUOMTByMhxglOJiV
        RHg/6/gmCPGmJFZWpRblxxeV5qQWH2I0BQb2RGYp0eR8YGrPK4k3NDUyNja2MDE0MzU0VBLn
        TTJ4EC8kkJ5YkpqdmlqQWgTTx8TBKdXA5K9yQiW/Wj186g/7r3Ncbya///pP/Iv68QM/mp9E
        9O4WvPzq94RDN5Y+i9ye+9146prT+9N8JI3vfxCdqZAq5lRjtcNXseJXuaxD6bvrb01etGzY
        Xv5T6q6lXOpxGV+mFfyRE4N2ruvfOmmpGYNHCXNaXGXjhY1XJvq5HZ4RuD/o/jID8Q/Nhh0M
        r/KWCX28ot8al1e36c6+wi+Nt8U+Vd3VrZTLfiQirVl9L6CAZXLi1N6VPuJVTrr7GSN7bfvz
        o8TEN3kJ/ko/+txkZ8/VIuO94YtXMu/tqq3PLP+6ISNh91f7XX2HK57Fnrz/QVlAI1UraN75
        HxcNE58f4Z/Jqvwj+NSpwkn2h95Pf28Xp8RSnJFoqMVcVJwIAGi3VRM1BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPLMWRmVeSWpSXmKPExsWy7bCSnK7dP78Eg7P9eha9504yWfzfNpHZ
        4srX92wW589vYLfY9Pgaq8WM8/uYLFa/3sfuwO6x99sCFo/Hczeye2xa1cnmsf3bA1aP+93H
        mTw2L6n3+LxJLoA9issmJTUnsyy1SN8ugSvj0YO/7AUfOCrWPFrI2MB4gL2LkZNDQsBEom3H
        WyCbi0NIYAejxKV1F4EcDqCEhMSWrRwQprDE4cPFECVvGSXe3p7BCtIrLOAo8W7xH7A5IgLR
        Ej+7t7CA2MwCeRKTty9ggmiYxShx6P4XJpAEm4CqxMQV99lAbF4BO4kj59vBmlmA4is+PACz
        RQUiJFruQwzlFRCUODnzCdhQTgF3iSdrlrBDLFCX+DPvEjOELS5x68l8JghbXqJ562zmCYxC
        s5C0z0LSMgtJyywkLQsYWVYxSqYWFOem5xYbFhjlpZbrFSfmFpfmpesl5+duYgTHkZbWDsY9
        qz7oHWJk4mA8xCjBwawkwvtZxzdBiDclsbIqtSg/vqg0J7X4EKM0B4uSOO+FrpPxQgLpiSWp
        2ampBalFMFkmDk6pBia+JZNXBnmfl/RIOneL6YynrNLfN6cn9TOW/H3DoLO7y/BbyfILj43j
        N3zfqH5+p5zlAqNnN7Zten7F7lLaxbjOYBWfxX/W9K37vz/NL4NRZ/OxnIY3K1ceCfl23WDn
        YYNnrmW7/qj29mbNi3SZFDWxWmC75us003LzR/cSSnym97tEnL/tzmRzK/YW740ITovl2Qvu
        aojc+/Jzwirbc14aXrd2y7ocf6Rkl+BUFheZnnfGj8fWccc8oTvqFy/W2Ngtns/pw9iSOknp
        q4lF5c0/b66ue+vNpTzPv9v7dbf5dafvaZfeyzy239ax5c69pecqjH7dj/u0X+zYyzMOSzmu
        RzI9qTPe6GHua+BQpXJTiaU4I9FQi7moOBEAd9nFbBIDAAA=
X-CMS-MailID: 20210315062710epcas1p107e8186b2138c671620dabf3abd4aea4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210303014433epcas1p4fefd6787c74d86d6f11f93318c3833fd
References: <CGME20210303014433epcas1p4fefd6787c74d86d6f11f93318c3833fd@epcas1p4.samsung.com>
        <1614654193-40203-1-git-send-email-tiantao6@hisilicon.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Tian Tao,

21. 3. 2. 오후 12:03에 Tian Tao 이(가) 쓴 글:
> remove the legacy GPIO headers <linux/of_gpio.h> but what it really
> uses is <linux/gpio/consumer.h> since only gpio_desc structs are ever
> referenced.

This driver doesn't reference even linux/gpio/consumer.h so could you drop only of_gpio.h inclusion?

Thanks,
Inki Dae

> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> index 1f79bc2..9fc51a6 100644
> --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> @@ -11,9 +11,9 @@
>  #include <linux/component.h>
>  #include <linux/iopoll.h>
>  #include <linux/irq.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/of_device.h>
> -#include <linux/of_gpio.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
> 
