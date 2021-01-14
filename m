Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F8D5C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Jan 2021 19:04:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD94D23A05
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Jan 2021 19:04:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726367AbhANTEU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 14 Jan 2021 14:04:20 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:41460 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726131AbhANTES (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Jan 2021 14:04:18 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210114190336euoutp02f339408a6686d81edd8603702046dde3~aLpD0pcRx2974329743euoutp02G
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Jan 2021 19:03:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210114190336euoutp02f339408a6686d81edd8603702046dde3~aLpD0pcRx2974329743euoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1610651016;
        bh=p9JyyoEzSfZPYysKaNAbup8AeW9Ygru9GNwL3DVNY30=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=iQK/0vq0ZGCl/UKVD3EJtrNEXMICLr435myXg60lutkYzRljk6EsGkMWJStu2VY2q
         ayZ8JfBNqbOr3GaMpvxOn7BJiTzUxk0rXnZ1iFOc5F/uS930y37IEx5ZdVqMMLwVEa
         YG+M3ceKguNF3DfAp/KP6VR9jt3WQQ8vOVFFsuWo=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210114190335eucas1p29ad219336e7348c5398b5e0a6eb475be~aLpCyefoq0423104231eucas1p2m;
        Thu, 14 Jan 2021 19:03:35 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 9A.1A.45488.78590006; Thu, 14
        Jan 2021 19:03:35 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210114190335eucas1p209f9ccf7e413aa34ff712afa1216c7ef~aLpCQsflj2716227162eucas1p2P;
        Thu, 14 Jan 2021 19:03:35 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210114190335eusmtrp12a2aa4abe2f2dd74b830899758ae9d95~aLpCQH7RY2919329193eusmtrp1c;
        Thu, 14 Jan 2021 19:03:35 +0000 (GMT)
X-AuditID: cbfec7f5-c5fff7000000b1b0-96-60009587a9d7
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 9C.1C.16282.68590006; Thu, 14
        Jan 2021 19:03:35 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210114190334eusmtip1d845562ee9967990b013f8997594077b~aLpBzp5vE0394703947eusmtip1Y;
        Thu, 14 Jan 2021 19:03:34 +0000 (GMT)
Subject: Re: [PATCH] soc: samsung: pm_domains: Convert to regular platform
 driver
To:     Saravana Kannan <saravanak@google.com>
Cc:     Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        LKML <linux-kernel@vger.kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <58e1cfb2-cd35-badf-0238-7c62122e2d05@samsung.com>
Date:   Thu, 14 Jan 2021 20:03:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAGETcx9wJVnBAe6mKxfi9DC9YFf6DLzAyxBC8DxhQUqpfTDR3A@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRT2d+/17rqaXae2g0rBxMJKbSQ2yqKizAoqiyh66cyLmjpzcz21
        bD1dD0yT3FJT0hKppmNqzjBckpjkRK3M1PWw6OEIc1lZ6zF/VP73fed85/d95/BjSGGuqw+T
        KE/nFHJZspjmU7X3v1mCTuW7xMwtez5TWl2gd5VaLFU8aZepkJYWWBoJaZE9n5RqzA56CR1Z
        YlBFGiqz6cjzxkoUOWKYtp7ayg+P45IT93KKkMUx/ISGziN77F77WwoHiSyU56FBDANsKAwY
        wzSIzwjZCgRVxaMIEzuCyuY2V0xGEHzJqf9D3MYnunvHeLhxHYG9vIbEZBjB6EcN6VR5shvh
        XLaVcGIvdhYYHr+inCKS/YDgqqOL52zQrAQ0Ng3txAJ2MXzJNtLOUBQbAN2Xx9282Vjo77tH
        YIkHtGoHKSd2Y6PguzFr/BmSnQ51tkISYxH0Dl4hnF7AdjDQfHSIwLGXg7bmI42xJ7xvMfIw
        9oO2vLMUHjiG4EX7TR4mZxF0qQsQVi2Evvax8XQkGwh6UwguL4W2J3oCX9IdemweOIQ75NZe
        InFZAKdPCrF6Buhabv2zberoJHOQWDdhNd2EdXQT1tH99y1BVCUScSplSjynnCfn9gUrZSlK
        lTw+eFdqigH9+TZtP1s+30YV74eDzYhgkBkBQ4q9BKn+LjFCQZzswEFOkRqtUCVzSjPyZSix
        SGCquREtZONl6VwSx+3hFH+7BOPmk0VcJKfsskxaesFn7KT2QlXj3PjSKJcfGTvfHVPz7+ob
        LYJprSNJb6POXFu2/WtE7Iz5ogMPbm6enCV56mvJsGqbhf6SwPAFtm117m+MzbsXiqzq9dui
        Szj/zFANT6XL2MQeZyY/7OdSzxedWym9owiVOKp5n7iVXmJhaX1Zv2nd1Z5lj3y7qbK9wWnF
        J6oMQ95qojAkttavbKbj4qoNfHteuMNPRVnn0Mawz2OWiMOGgaY1AzEbZUvSdpR3jMYlBL3O
        rBhtSJKkp1lt2oDZFdUjv/gp+kR+xKbul8+G7PLMhLAcz+EVPnPqStIXNTRteWXONUG/h2Hq
        Ie/T3qvXlsaqxZQyQSaZRSqUst+9A3mDpQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRmVeSWpSXmKPExsVy+t/xu7rtUxkSDH5MZ7bYOGM9q8X58xvY
        LS7vmsNmMeP8PiaLuV+mMlt0HfrL5sDmsWBTqcemVZ1sHn1bVjF6fN4kF8ASpWdTlF9akqqQ
        kV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJex+1J9wReRiuNznjA1
        ME4W7GLk5JAQMJG4cusXO4gtJLCUUWLGXQ6IuIzEyWkNrBC2sMSfa11sXYxcQDXvGSV2bj/D
        DJIQFgiW6O28zwRiiwhoSWy69pgFpIhZ4DWjxLq9p5khOm4wShx/dBOsg03AUKLrLcgoTg5e
        ATuJ751bgGwODhYBVYkrs8G2iQokSZyY9YkZokRQ4uTMJywgNqdAoMTvLQ1glzILmEnM2/yQ
        GcKWl9j+dg6ULS5x68l8pgmMQrOQtM9C0jILScssJC0LGFlWMYqklhbnpucWG+kVJ+YWl+al
        6yXn525iBEbXtmM/t+xgXPnqo94hRiYOxkOMEhzMSiK8+coMCUK8KYmVValF+fFFpTmpxYcY
        TYHemcgsJZqcD4zvvJJ4QzMDU0MTM0sDU0szYyVxXpMja+KFBNITS1KzU1MLUotg+pg4OKUa
        mDy3c6vdjONh0p9y4tajaX0O2zMjC/J+NqXKr/UQkVl9bl/2b4m42QKn/8bx13/+vZ031/7G
        PP7by1lX8WrPjjL+tORc9qSc2fmCX0stL83epLBZdFb0l3em1nnlW58VbmxtmXZpZ/Kvk1Mt
        Ljhdn9Vs7u4nN/viv22dTJ/MNxkKNMvN8irkEQgN07jAN8/HYYb7wSLGwsPHPn/Y+aDzucSZ
        wsgtZxqVl1ZMiV3AKN8yq1B7r6CcgYqxGIvSrceMG1hmqq9jyp7ItG3XztZZlicYsq/91Pl3
        R/+OvcBt/dJQ/1mia/5/u5x5o2/2l36NxvU316/69FJ417pL3z/8SYrY2qFpHybQutYqQLl7
        pbgSS3FGoqEWc1FxIgAjxTeONwMAAA==
X-CMS-MailID: 20210114190335eucas1p209f9ccf7e413aa34ff712afa1216c7ef
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210113110330eucas1p1e7efa719b5db55ccf3774450a8c1e452
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210113110330eucas1p1e7efa719b5db55ccf3774450a8c1e452
References: <CGME20210113110330eucas1p1e7efa719b5db55ccf3774450a8c1e452@eucas1p1.samsung.com>
        <20210113110320.13149-1-m.szyprowski@samsung.com>
        <CAGETcx9wJVnBAe6mKxfi9DC9YFf6DLzAyxBC8DxhQUqpfTDR3A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Saravana,

On 13.01.2021 21:27, Saravana Kannan wrote:
> On Wed, Jan 13, 2021 at 3:03 AM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> When Exynos power domain driver was introduced, the only way to ensure
>> that power domains will be instantiated before the devices which belongs
>> to them was to initialize them early enough, before the devices are
>> instantiated in the system. This in turn required not to use any platform
>> device infrastructure at all, as there have been no way to ensure proper
>> probe order between devices.
>>
>> This has been finally changed and patch e590474768f1 ("driver core: Set
>> fw_devlink=on by default") ensures that each device will be probbed only
>> when its resource providers are ready. This allows to convert Exynos
>> power domain driver to regular platform driver.
>>
>> This is also required by the mentioned commit to enable probing any
>> device which belongs to the Exynos power domains, as otherwise the core
>> won't notice that the power domains are in fact available.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>> Some more comments are in the following thread:
>> https://protect2.fireeye.com/v1/url?k=8ac052ac-d55b6ba4-8ac1d9e3-0cc47a31c8b4-9068b559b0fd155d&q=1&e=b393c3ff-16ba-48a4-9d72-6805d02971d5&u=https%3A%2F%2Flore.kernel.org%2Flkml%2F2556a69b-5da5-bf80-e051-df2d02fbc40f%40samsung.com%2F
>> ---
>> ...
> Skimmed through this patch and at a high level, it looks good for what
> it's trying to do. Thanks for doing this!
>
> Btw, I assume that this won't work with fw_devlink=off/permissive
> (default since 5.10 or earlier)? My concern is that we might
> temporarily set fw_devlink=permissive by default if the other
> breakages aren't fixed in time for 5.12? How do you want to handle that?

I've applied my patch on top of vanilla v5.10 and checked on my test 
boards. Surprisingly everything works fine, so something must have been 
changed during the last few years as the power domain driver in the 
current form has been written long time ago. I remember that the moment 
when platform devices are created from the of nodes has been change at 
some point, so maybe this is somehow related. Anyway, the platform 
driver for Exynos power domains registered from core_initcall works fine 
with v5.10 kernel.

I have no strong opinion on the way of merging this fix. It can go via 
Samsung tree, so in the end the v5.12-rc1 will have both my fix and your 
change, but won't be fully bisectable in-between. Krzysztof, what's your 
opinion?

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

