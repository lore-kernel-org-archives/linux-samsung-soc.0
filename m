Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56286C4361B
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 18 Dec 2020 13:27:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A45F23A79
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 18 Dec 2020 13:27:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbgLRN0j (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 18 Dec 2020 08:26:39 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46526 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbgLRN0i (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 18 Dec 2020 08:26:38 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201218132546euoutp01d47d88aab105bddd3daa252752b9a06a~R0nX-MD2D2124921249euoutp01f
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Dec 2020 13:25:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201218132546euoutp01d47d88aab105bddd3daa252752b9a06a~R0nX-MD2D2124921249euoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1608297946;
        bh=QfVGP0V6JC8qUrUN5ATIAPCMstFb1Wk6Iv5vGP8iQRU=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=PEDvg4gYmmKPvIYI8oNCKWAbKo0EBXktUTC+Olm5wGZWjMAQDU2ifyIMtYFly9vsp
         QM9lZsnXQSyCnPqjbQ5aMnHWgV67aM+l4/pgUp2/HpaAHgZvvegN12HwzUSnY/m1t5
         6+lBW56S+yv5MQRmfAV8hIYueDXZ2Yk58BVw64K4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201218132540eucas1p2bbabde9fd325eacff571606ce39b23d1~R0nTA5t092284622846eucas1p2L;
        Fri, 18 Dec 2020 13:25:40 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 99.0E.27958.4DDACDF5; Fri, 18
        Dec 2020 13:25:40 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201218132540eucas1p101870b19e2687a31efdebfbff31776dc~R0nSmH_Su1687016870eucas1p1F;
        Fri, 18 Dec 2020 13:25:40 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201218132540eusmtrp288ccc8cfc236052ed5d63ec6468065d0~R0nSlZlFW3196931969eusmtrp2r;
        Fri, 18 Dec 2020 13:25:40 +0000 (GMT)
X-AuditID: cbfec7f2-f15ff70000006d36-c2-5fdcadd48064
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 47.7E.21957.4DDACDF5; Fri, 18
        Dec 2020 13:25:40 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201218132539eusmtip1f4d1a41f195c90751e6940b84721e54c~R0nR_lj0z2585625856eusmtip1Y;
        Fri, 18 Dec 2020 13:25:39 +0000 (GMT)
Subject: Re: [PATCH 9/9] mfd: sec-irq: Do not enforce (incorrect) interrupt
 trigger type
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <0f1509ef-9ae7-7a77-84b7-360b8f0071c7@samsung.com>
Date:   Fri, 18 Dec 2020 14:25:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201210212903.216728-9-krzk@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNKsWRmVeSWpSXmKPExsWy7djP87pX1t6JN9i7VN9i44z1rBbXvzxn
        tZh/5ByrxfnzG9gt7n89ymix6fE1VovLu+awWcw4v4/JonXvEXaL9qcvmR24PDat6mTzuHNt
        D5vH5iX1Hn1bVjF6fN4kF8AaxWWTkpqTWZZapG+XwJXx4/dj9oJ9PBW7t5o2MD7n7GLk5JAQ
        MJHYtusFM4gtJLCCUaJ3W34XIxeQ/YVRYuXNfWwQzmdGiY2n5jLCdFze9AEqsZxR4sX6o8wQ
        zkdGieNbV4JVCQtESXx9vQAsISJwhUniyM5eNpAEs4CuxPR3b8AWsgkYSnS97QKL8wrYSVzf
        cYMJxGYRUJX4vGMxmC0qkCSxvusHVI2gxMmZT1hAbE4BM4n3HS+gZspLbH87hxnCFpe49WQ+
        E8hiCYEPHBIfD+wFSnAAOS4SX345QbwgLPHq+BZ2CFtG4v9OmPpmRomH59ayQzg9jBKXm2ZA
        PW0tcefcLzaQQcwCmhLrd+lDhB0lDp/oY4KYzydx460gxA18EpO2TYdayyvR0SYEUa0mMev4
        Ori1By9cYp7AqDQLyWezkHwzC8k3sxD2LmBkWcUonlpanJueWmyYl1quV5yYW1yal66XnJ+7
        iRGYnk7/O/5pB+PcVx/1DjEycTAeYpTgYFYS4Q19cDteiDclsbIqtSg/vqg0J7X4EKM0B4uS
        OO+q2WvihQTSE0tSs1NTC1KLYLJMHJxSDUzxhfkLfqyLO3EisE5vr4jigm9OJRqHK7Uesc7Y
        YhVgcq8mh11j1xnX27ZczH+jcwP0/vxT2Xbj3rcN/97cdsp45ZYkzrQ9kOdNtojw3ysGgsVn
        3U8+OV/a0dG94HnDzIXZgSvmmN3Jc85lUJL6/W/V9gfGF6fw6m1ZqrTMtoMryCm940f+iTAW
        mckZTfV7bK828Ltc/TkjxVjhXXda4ySBI4srPzznulr9aubS5EXPvtg+PJ7iIHdD+niviNmU
        NX1ve2fzaH3d5XNK65n5F95ZP7pcvjn0X3JxO//z68KqaCZBNRYOpi+5b+0eiMzbddRI6trj
        e3ecE1+nsNydXbyo70fw2WlGHIaG57l8zOyVWIozEg21mIuKEwFMXb4nvgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRmVeSWpSXmKPExsVy+t/xu7pX1t6JN5hxjc9i44z1rBbXvzxn
        tZh/5ByrxfnzG9gt7n89ymix6fE1VovLu+awWcw4v4/JonXvEXaL9qcvmR24PDat6mTzuHNt
        D5vH5iX1Hn1bVjF6fN4kF8AapWdTlF9akqqQkV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtlZKqk
        b2eTkpqTWZZapG+XoJfx4/dj9oJ9PBW7t5o2MD7n7GLk5JAQMJG4vOkDWxcjF4eQwFJGiXWn
        1zNDJGQkTk5rYIWwhSX+XOtiA7GFBN4zShxvDAKxhQWiJL6+XsAM0iwicIVJovXSFUaQBLOA
        rsT0d2+YIaZuZZS4/H0aWDebgKFE11uISbwCdhLXd9xgArFZBFQlPu9YDGRzcIgKJEmcPS0I
        USIocXLmExYQm1PATOJ9xws2iPlmEvM2P2SGsOUltr+dA2WLS9x6Mp9pAqPQLCTts5C0zELS
        MgtJywJGllWMIqmlxbnpucWGesWJucWleel6yfm5mxiB8bjt2M/NOxjnvfqod4iRiYPxEKME
        B7OSCG/og9vxQrwpiZVVqUX58UWlOanFhxhNgd6ZyCwlmpwPTAh5JfGGZgamhiZmlgamlmbG
        SuK8W+euiRcSSE8sSc1OTS1ILYLpY+LglGpgKt1t67Wy41Peix0dMzfottiws+s6h53J6by+
        jG93reWJebqVfDsmT3yyWly3w+3AGY/PPe8+TRR300rRjZxzM8jUKf4yr+3vb0/bLd6yJ02Y
        MPfv+vZfdTPmPeM6z8Ie1pe6PUNpAcsm/RTDqrIixxUP3ZjNZRsfbj009+L1k/6Hds8u+zHF
        83thiMsa3l0SGvcmpSs/XhIqGh3PkBavbDT7XNXR9Te0Py4x+W3+qjowYk/tfXWfy9xp9q/z
        J3edO6ugankkesNinZnWgm7V/D76WguWvo62qkzYY77kfuqjshijxfoN2it091ux9+88ZnpC
        IqPEVIL7UPO+xKY1pvmhWzN4a26sFN/LMyldiaU4I9FQi7moOBEAza/jIlADAAA=
X-CMS-MailID: 20201218132540eucas1p101870b19e2687a31efdebfbff31776dc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201210212938eucas1p1297b8503e9c059f2bc77c3a429a9114e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201210212938eucas1p1297b8503e9c059f2bc77c3a429a9114e
References: <20201210212903.216728-1-krzk@kernel.org>
        <CGME20201210212938eucas1p1297b8503e9c059f2bc77c3a429a9114e@eucas1p1.samsung.com>
        <20201210212903.216728-9-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10.12.2020 22:29, Krzysztof Kozlowski wrote:
> Interrupt line can be configured on different hardware in different way,
> even inverted.  Therefore driver should not enforce specific trigger
> type - edge falling - but instead rely on Devicetree to configure it.
>
> The Samsung PMIC drivers are used only on Devicetree boards.
>
> Additionally, the PMIC datasheets describe the interrupt line as active
> low with a requirement of acknowledge from the CPU therefore the edge
> falling is not correct.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

It looks that this together with DTS change fixes RTC alarm failure that 
I've observed from time to time on TM2e board!

> ---
>
> This patch should wait till DTS changes are merged, as it relies on
> proper Devicetree.
> ---
>   drivers/mfd/sec-irq.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
> index a98c5d165039..760f88a865ab 100644
> --- a/drivers/mfd/sec-irq.c
> +++ b/drivers/mfd/sec-irq.c
> @@ -480,8 +480,7 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
>   	}
>   
>   	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
> -				       sec_pmic->irq,
> -				       IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> +				       sec_pmic->irq, IRQF_ONESHOT,
>   				       sec_pmic->irq_base, sec_irq_chip,
>   				       &sec_pmic->irq_data);
>   	if (ret != 0) {

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

