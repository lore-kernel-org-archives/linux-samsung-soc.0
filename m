Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B99A9C4361B
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 18 Dec 2020 12:47:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 68423239FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 18 Dec 2020 12:47:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbgLRMrq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 18 Dec 2020 07:47:46 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:50041 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbgLRMrq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 18 Dec 2020 07:47:46 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201218124654euoutp02c7f3250a8a504c5dfe18701e3f7cce13~R0Fcyju4z0395003950euoutp02e
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Dec 2020 12:46:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201218124654euoutp02c7f3250a8a504c5dfe18701e3f7cce13~R0Fcyju4z0395003950euoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1608295614;
        bh=hgARtHe6jg9tVIeTEnjTZL5etidav94ZHltUhne+vbY=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=SjG0D+Kl3N7VeJIiaJ8RfYCgbN11RR7VdelXS+sc0yRrKMO7pQOBI/n71n/ALJ+qN
         sKDTIQwLuckDkvGnpey5yK0bTCfKavAoB3K70FNDvvVeztZYrJM36Dq4HSASyw9iJ1
         xsuRCdHY53+EEEI/ZH3Vnr0RzzXYO/9kPDyjTw2o=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201218124649eucas1p1c729bf3ddc0b3a95d5280e400b7d0d1e~R0FX1bC0t1387013870eucas1p1O;
        Fri, 18 Dec 2020 12:46:49 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 2E.08.27958.9B4ACDF5; Fri, 18
        Dec 2020 12:46:49 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201218124648eucas1p2e9fee5de6cd7d62eea61ca2fb98273d3~R0FXTUCXQ2420124201eucas1p27;
        Fri, 18 Dec 2020 12:46:48 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201218124648eusmtrp1633c29b218d395f1f64470c06b82ff21~R0FXSogKE1505415054eusmtrp1_;
        Fri, 18 Dec 2020 12:46:48 +0000 (GMT)
X-AuditID: cbfec7f2-f15ff70000006d36-87-5fdca4b99bfa
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 95.F6.16282.8B4ACDF5; Fri, 18
        Dec 2020 12:46:48 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201218124648eusmtip2cb96873d42e5506ed1357dfeed8126d3~R0FWtCqz-2468924689eusmtip2H;
        Fri, 18 Dec 2020 12:46:48 +0000 (GMT)
Subject: Re: [PATCH 7/9] arm64: dts: exynos: correct PMIC interrupt trigger
 level on TM2
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <e5c9f930-8e82-a8a9-9ba8-701e79c6ae6b@samsung.com>
Date:   Fri, 18 Dec 2020 13:46:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201210212903.216728-7-krzk@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDKsWRmVeSWpSXmKPExsWy7djP87o7l9yJN7j7VtZi44z1rBbXvzxn
        tZh/5ByrxfnzG9gt7n89ymix6fE1VovLu+awWcw4v4/JonXvEXaL9qcvmR24PDat6mTzuHNt
        D5vH5iX1Hn1bVjF6fN4kF8AaxWWTkpqTWZZapG+XwJVxaPcS9oIpXBUzdt1mamDcz9HFyMEh
        IWAisadVtYuRk0NIYAWjxNSLIl2MXED2F0aJL9cXMEI4nxklDu05wAJSBdKw43g3M0RiOaPE
        lFXNbBDOR0aJb89XM4NUCQtESfReWswKkhARuMIkcWRnLxtIgllAV2L6uzdgRWwChhJdb7vA
        4rwCdhLPN59hBbFZBFQl+m81gNmiAkkS67t+QNUISpyc+QTsDE4BM4lNU5YyQcyUl9j+dg4z
        hC0ucevJfCaQxRICHzgkpv/Zygxxt4tE14IPULawxKvjW9ghbBmJ05N7WCAamhklHp5byw7h
        9DBKXG6awQhRZS1x59wvNlCQMQtoSqzfpQ8RdpT4c+8sOyQk+SRuvBWEOIJPYtK26cwQYV6J
        jjYhiGo1iVnH18GtPXjhEvMERqVZSF6bheSdWUjemYWwdwEjyypG8dTS4tz01GLDvNRyveLE
        3OLSvHS95PzcTYzABHX63/FPOxjnvvqod4iRiYPxEKMEB7OSCG/og9vxQrwpiZVVqUX58UWl
        OanFhxilOViUxHlXzV4TLySQnliSmp2aWpBaBJNl4uCUamDqe+4hmn8rv3jXlVumXh6/H6o0
        vr9pFcG6xFnxit/hmk9vVyTsar/ikBd96r/2jJnTDyQ53gn+2Nxq1ZF4SnSR8Pl3+zZvsfZd
        6h2YxWfAvI435vt8Tw7PNhbTz9npN1MebNYyzl22cG+cd10W/7bA5Rwv/ivt0Xwx6STzEaXe
        DUnHLO3vWUx8rDT5/tdlZoYr2Yv6pKfz9T4405Am/3lDZm9iIFtlct103g93Q3su6xk9tg3K
        OfHhWErT2qR9V7NU7W64ue12mc7VuqZmslpt82khv3NO5rf5bmzrXJ7XL8KreUDxUVjycZkq
        L4HWvL/LNm3hyPnTYX9SZJPg71kalY37XdhnrNw3/b6B5jMlluKMREMt5qLiRAD8L01pvwMA
        AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRmVeSWpSXmKPExsVy+t/xe7o7ltyJN1iwztRi44z1rBbXvzxn
        tZh/5ByrxfnzG9gt7n89ymix6fE1VovLu+awWcw4v4/JonXvEXaL9qcvmR24PDat6mTzuHNt
        D5vH5iX1Hn1bVjF6fN4kF8AapWdTlF9akqqQkV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtlZKqk
        b2eTkpqTWZZapG+XoJdxaPcS9oIpXBUzdt1mamDcz9HFyMkhIWAiseN4N3MXIxeHkMBSRom+
        7mvMEAkZiZPTGlghbGGJP9e62CCK3jNKrL70jx0kISwQJdF7aTErSEJE4AqTROulK4wgCWYB
        XYnp795Ajd3KKNE8YQPYWDYBQ4mutyCjODl4Bewknm8+A7aCRUBVov8WyDoODlGBJImzpwUh
        SgQlTs58wgJicwqYSWyaspQJYr6ZxLzND5khbHmJ7W/nQNniEreezGeawCg0C0n7LCQts5C0
        zELSsoCRZRWjSGppcW56brGRXnFibnFpXrpecn7uJkZgTG479nPLDsaVrz7qHWJk4mA8xCjB
        wawkwhv64Ha8EG9KYmVValF+fFFpTmrxIUZToHcmMkuJJucDk0JeSbyhmYGpoYmZpYGppZmx
        kjivyZE18UIC6YklqdmpqQWpRTB9TBycUg1Mc7dYP72/u8PvNkfkv7lmxyL67hvyh4nan+I6
        OvHPmoY6TTO2Gd/mvmXbN2/ijCOfZvJP8uDXURLSeCSSlCx3qeH8nxyp4N9TnKd/WH3UvbAl
        edcmvvRDO3SOrD5+wnGGv7Wqy6fqUo+esBknK02dP27fwzfh7c0u492aEVNn/Q7p/2r7NOKi
        WYx5yX1Lj9eyG8smrNo7Vc57+tbcm/v01DvPye42z7Wy2/E988qqqfpXyi3Xbb72VTff1Ijz
        poqu9WmzGamhG3mMOr+39oYnTp1q9Kj2t/WE1cVS8woXJ/48NPHh1eJKLl3BC6ecOHwf914T
        LpaYZxQq3lRYPePRrC08qfnvvi7ZnvR/5opgQSWW4oxEQy3mouJEAEtQjjZSAwAA
X-CMS-MailID: 20201218124648eucas1p2e9fee5de6cd7d62eea61ca2fb98273d3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201210212933eucas1p2741eb3aa0532ed7b8610b78a6d26c2f5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201210212933eucas1p2741eb3aa0532ed7b8610b78a6d26c2f5
References: <20201210212903.216728-1-krzk@kernel.org>
        <CGME20201210212933eucas1p2741eb3aa0532ed7b8610b78a6d26c2f5@eucas1p2.samsung.com>
        <20201210212903.216728-7-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10.12.2020 22:29, Krzysztof Kozlowski wrote:
> The Samsung PMIC datasheets describe the interrupt line as active low
> with a requirement of acknowledge from the CPU.  Without specifying the
> interrupt type in Devicetree, kernel might apply some fixed
> configuration, not necessarily working for this hardware.
>
> Fixes: 01e5d2352152 ("arm64: dts: exynos: Add dts file for Exynos5433-based TM2 board")
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> index 03486a8ffc67..4c5106a0860d 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> @@ -388,7 +388,7 @@ &hsi2c_0 {
>   	pmic@66 {
>   		compatible = "samsung,s2mps13-pmic";
>   		interrupt-parent = <&gpa0>;
> -		interrupts = <7 IRQ_TYPE_NONE>;
> +		interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
>   		reg = <0x66>;
>   		samsung,s2mps11-wrstbi-ground;
>   

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

