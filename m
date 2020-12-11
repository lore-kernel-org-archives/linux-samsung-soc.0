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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D16C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Dec 2020 16:49:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B4F223106
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Dec 2020 16:49:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393132AbgLKPud (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 11 Dec 2020 10:50:33 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:48719 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731730AbgLKPu3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Dec 2020 10:50:29 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201211154938euoutp02a00046f3219b38b3580c886058c44c78~PtD-HDYPW1165211652euoutp02e
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Dec 2020 15:49:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201211154938euoutp02a00046f3219b38b3580c886058c44c78~PtD-HDYPW1165211652euoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1607701778;
        bh=VwlXylKGH2GKKylOlQ3GwpVDNGT+2thXGcHv2s+dRJY=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=qkA7kkRQOZ0scyapZSd6HyyhaNNrAO6kY6f0ceNa1pqSnRel/omNoKHNlwVg7EQZg
         X9H8Ko2nZ3WLaVmTaoLltugr6kAxPpGM+mem0jkuoCfjrrqnn8ODLdpSJTiBTYlGwD
         TwpTDDmGdi9RMmrb4lNTiiguTfOZKtYKElBl78kg=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201211154933eucas1p20edb9a64f00de06af622a12adb3aab88~PtD6mr0mT3100031000eucas1p2t;
        Fri, 11 Dec 2020 15:49:33 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 7D.8E.44805.C0593DF5; Fri, 11
        Dec 2020 15:49:33 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201211154932eucas1p2786d57ed1a7877b65bd7a50bca4e5068~PtD6GYadk3077830778eucas1p2_;
        Fri, 11 Dec 2020 15:49:32 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201211154932eusmtrp2af46884d99902e6b5548b4c05f0942b9~PtD6FtRUI1230412304eusmtrp2S;
        Fri, 11 Dec 2020 15:49:32 +0000 (GMT)
X-AuditID: cbfec7f4-b4fff7000000af05-01-5fd3950cb87c
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 80.8C.21957.C0593DF5; Fri, 11
        Dec 2020 15:49:32 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201211154931eusmtip1216476d7db281cc7176683122d50d33d~PtD5gTvvY1483914839eusmtip1F;
        Fri, 11 Dec 2020 15:49:31 +0000 (GMT)
Subject: Re: [PATCH 6/9] ARM: dts: exynos: correct PMIC interrupt trigger
 level on Odroid XU3 family
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <351d77de-0756-ee16-535a-4ce0fbc2ba04@samsung.com>
Date:   Fri, 11 Dec 2020 16:49:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201210212903.216728-6-krzk@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHKsWRmVeSWpSXmKPExsWy7djP87q8Uy/HG9zfyGixccZ6VovrX56z
        Wsw/co7V4vz5DewW978eZbTY9Pgaq8XlXXPYLGac38dk0br3CLtF+9OXzA5cHptWdbJ53Lm2
        h81j85J6j74tqxg9Pm+SC2CN4rJJSc3JLEst0rdL4Mp4ceYjY8EUzoqHHxtYGhjPsHcxcnJI
        CJhI3Nv1hrGLkYtDSGAFo8SZrbtYIJwvjBJ/LyyBcj4zShz99ZkRpuXs/YVsEInljBKPNu6G
        6v/IKHG7cRsLSJWwQJrElGtHmUESIgJXmCSO7OxlA0kwC+hKTH/3hhnEZhMwlOh62wUW5xWw
        k/ixZDKYzSKgKrHq0V0wW1QgSWJ91w+oGkGJkzOfgC3gFDCTON+ygxliprzE9rdzoGxxiVtP
        5jOBLJYQ+MAhMen1YahXXSQmtU1khbCFJV4d3wIVl5H4vxOmoZlR4uG5tewQTg+jxOWmGVBf
        W0vcOfcL6AwOoBWaEut36UOEHSV+Ne5nBQlLCPBJ3HgrCHEEn8SkbdOZIcK8Eh1tQhDVahKz
        jq+DW3vwwiXmCYxKs5C8NgvJO7OQvDMLYe8CRpZVjOKppcW56anFRnmp5XrFibnFpXnpesn5
        uZsYgUnq9L/jX3YwLn/1Ue8QIxMH4yFGCQ5mJRHe3/WX44V4UxIrq1KL8uOLSnNSiw8xSnOw
        KInzJm1ZEy8kkJ5YkpqdmlqQWgSTZeLglGpg4jyXue+1pNp3bWPttnIut29rlm95UHsjfV20
        nxZbrXqupovPjsB2xzuv2mTyjP8c93IzYvbzfif792BQ2fLNqTYFP+Ptrq7amFPgaSSyrH7e
        coO5x6paw1T4Dqt679qioqVZbhlxKOBcgtyVO94/Hv18mbRnorzc+4vvHm6bo7lqSiQjj4GS
        sdryxT5Zx/q6P7s5bdJWuPOc/xDf5T/RJfNvyDyeflvcrmGLlbWI8c6XszjCbh56c195z2qG
        D3pn735U7Xnw569m1evpFtqS588+Cnadzl8x6e4xiaTYa2v8tVjeafdf9LC/2584e6Lie0Ou
        SuaXD08c+Nm/ZulXp/UWMyTmHYmd0ZToUv2YQ4mlOCPRUIu5qDgRAEnKl0PBAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRmVeSWpSXmKPExsVy+t/xu7o8Uy/HG7ROUbDYOGM9q8X1L89Z
        LeYfOcdqcf78BnaL+1+PMlpsenyN1eLyrjlsFjPO72OyaN17hN2i/elLZgcuj02rOtk87lzb
        w+axeUm9R9+WVYwenzfJBbBG6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp
        29mkpOZklqUW6dsl6GW8OPORsWAKZ8XDjw0sDYxn2LsYOTkkBEwkzt5fyNbFyMUhJLCUUeL3
        9dOMEAkZiZPTGlghbGGJP9e6oIreM0pMmfyQBSQhLJAmMeXaUWaQhIjAFSaJ1ktXwLqZBXQl
        pr97wwzRsZVRYs3BDUwgCTYBQ4mutyCjODl4BewkfiyZDGazCKhKrHp0F8jm4BAVSJI4e1oQ
        okRQ4uTMJ2DLOAXMJM637GCGmG8mMW/zQyhbXmL72zlQtrjErSfzmSYwCs1C0j4LScssJC2z
        kLQsYGRZxSiSWlqcm55bbKhXnJhbXJqXrpecn7uJERiT24793LyDcd6rj3qHGJk4GA8xSnAw
        K4nw/q6/HC/Em5JYWZValB9fVJqTWnyI0RTonYnMUqLJ+cCkkFcSb2hmYGpoYmZpYGppZqwk
        zrt17pp4IYH0xJLU7NTUgtQimD4mDk6pBqbDm1dzCu20M5RcuNTZ9eMBmVv1otvjerxLz/d8
        0ww9eOZ80AnOBz8UNzdcXs1+4ur5rQd95r6eze5nZSNkylbilnfV7kEdFyfD7w8yUvuq9cWE
        sgVVzWZ8Ob9yeuOxn7Mi63KPRD1I6F7//dv2LVxqL6IKVzzR8++24Fzw9Knav51Pf9hWBEZy
        /2k8b+z/f8t8ZQnuS1IrTA43qihf3V6edqIwpufQ0RmPXnAdMzimXdluem9W8MaStVo8+s1b
        9t0NkFvgdHvaE/u4s9+5/P817vx4ZorknEO/WX4Ytau6+R0OfjWnpD2vd/6WZ1Wnnir2tivc
        tGsudrHUfPdt6erGrtQt2THM2ndW3T06cfpcJZbijERDLeai4kQAVox+/1IDAAA=
X-CMS-MailID: 20201211154932eucas1p2786d57ed1a7877b65bd7a50bca4e5068
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201210212931eucas1p2e43bfd1d65d130c0b4f00ea9210658f9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201210212931eucas1p2e43bfd1d65d130c0b4f00ea9210658f9
References: <20201210212903.216728-1-krzk@kernel.org>
        <CGME20201210212931eucas1p2e43bfd1d65d130c0b4f00ea9210658f9@eucas1p2.samsung.com>
        <20201210212903.216728-6-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10.12.2020 22:29, Krzysztof Kozlowski wrote:
> The Samsung PMIC datasheets describe the interrupt line as active low
> with a requirement of acknowledge from the CPU.  The falling edge
> interrupt will mostly work but it's not correct.
>
> Fixes: aac4e0615341 ("ARM: dts: odroidxu3: Enable wake alarm of S2MPS11 RTC")
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>   arch/arm/boot/dts/exynos5422-odroid-core.dtsi | 2 +-
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
> index d0df560eb0db..6d690b1db099 100644
> --- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
> +++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
> @@ -509,7 +509,7 @@ pmic@66 {
>   		samsung,s2mps11-acokb-ground;
>   
>   		interrupt-parent = <&gpx0>;
> -		interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
> +		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&s2mps11_irq>;
>   

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

