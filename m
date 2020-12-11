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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF6EC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Dec 2020 16:54:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26A3823E26
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Dec 2020 16:54:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389958AbgLKPxS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 11 Dec 2020 10:53:18 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35490 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393649AbgLKPwx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Dec 2020 10:52:53 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201211155201euoutp01618b941cb95a9d6dd0d9705f37a6750d~PtGFDwuqd2682526825euoutp01N
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Dec 2020 15:52:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201211155201euoutp01618b941cb95a9d6dd0d9705f37a6750d~PtGFDwuqd2682526825euoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1607701921;
        bh=qIOre0fXzgtPLvPj7pcwH15q8Yq5hBleL3gtOIoZ9CE=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=BDXlHAsYCj5Ou/91WAKJwv3AJNl6KVub4W5vAcuaz46VFJ0LSIkeYyvenXIkuiI0O
         dDxQetI6MzpTeS/A5IHXIP5ZEKJYaAkOMkc5qyscRzdYACZf76HJmf+H44Ltha3AGX
         E0Dhu0eos6Aa/Ks2sorVSnvZCppr+fextQlaes9c=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201211155156eucas1p2158cebcab0667155af6b4b3976b68039~PtGAPZz7c3214532145eucas1p2y;
        Fri, 11 Dec 2020 15:51:56 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 9C.93.27958.C9593DF5; Fri, 11
        Dec 2020 15:51:56 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201211155156eucas1p2345b94e1cc5674a5e9fbe79088654951~PtF-ujBvs3004130041eucas1p2q;
        Fri, 11 Dec 2020 15:51:56 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201211155156eusmtrp161fef23c2ab2c860f77fb12d5e3dedc6~PtF-tzDV02434924349eusmtrp1T;
        Fri, 11 Dec 2020 15:51:56 +0000 (GMT)
X-AuditID: cbfec7f2-f15ff70000006d36-bf-5fd3959cbcc0
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 55.CA.16282.B9593DF5; Fri, 11
        Dec 2020 15:51:56 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201211155155eusmtip139d4124f2768064a3287af8b18c04d1b~PtF-KgYBM0815508155eusmtip18;
        Fri, 11 Dec 2020 15:51:55 +0000 (GMT)
Subject: Re: [PATCH 5/9] ARM: dts: exynos: correct PMIC interrupt trigger
 level on Arndale Octa
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <2a374b33-4292-c765-8f92-d72b5d5fcac7@samsung.com>
Date:   Fri, 11 Dec 2020 16:51:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201210212903.216728-5-krzk@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLKsWRmVeSWpSXmKPExsWy7djPc7pzpl6ON3i/WsVi44z1rBbXvzxn
        tZh/5ByrxfnzG9gt7n89ymix6fE1VovLu+awWcw4v4/JonXvEXaL9qcvmR24PDat6mTzuHNt
        D5vH5iX1Hn1bVjF6fN4kF8AaxWWTkpqTWZZapG+XwJWxbc0btoJ+zorZl88zNjAeY+9i5OSQ
        EDCRuDL7D1MXIxeHkMAKRolDk48wQzhfGCWmnlnBDuF8ZpRounKMFabl1Ox7jCC2kMByRonJ
        b6sgij4ySiydsxssISyQKNHR28EIkhARuMIkcWRnLxtIgllAV2L6uzfMIDabgKFE19susDiv
        gJ3E1c7bYBtYBFQlln7YzQRiiwokSazv+gFVIyhxcuYTFhCbU8BMomnZc1aImfIS29/OYYaw
        xSVuPZkP9pCEwAcOiTXXvzJCnO0i8efWBShbWOLV8S3QEJCROD25hwWioZlR4uG5tewQTg+j
        xOWmGVAd1hJ3zv0COoMDaIWmxPpd+hBhR4mdRx4wgoQlBPgkbrwVhDiCT2LStunMEGFeiY42
        IYhqNYlZx9fBrT144RLzBEalWUhem4XknVlI3pmFsHcBI8sqRvHU0uLc9NRiw7zUcr3ixNzi
        0rx0veT83E2MwBR1+t/xTzsY5776qHeIkYmD8RCjBAezkgjv7/rL8UK8KYmVValF+fFFpTmp
        xYcYpTlYlMR5V81eEy8kkJ5YkpqdmlqQWgSTZeLglGpgsm7JivqvvOK3qOPlf69+rSi/vvbO
        qwjzeZWVkT5nqyOWxwTeT7cwCOmPiODXK75oxMqfyitm7cB8Vz6uxT1no8j1zJBdN3v/7g6b
        F2U+8/zRdAF7p8/X5ubvOhQYrp2SojCltoEl8GlV9+TCKYkpeZrqE1O8N281WvH3Zkun5exL
        U3mzF8lNndl8/jvPpg+CEbGPtLiyby6sfam/xvXs3BKxaQ8n/K+9vuPMo23ZXFPOh6zfFGC5
        csUD+0v/tmximzLtLMO+yYl+X1mjktmlgtSFjp04sZbjQYON4knbO6Hllx6X1bNM07yWyGe2
        47pMv4xoGbPalVeFm0w3aW7+umTqfcc1STEct90E7N9MVWIpzkg01GIuKk4EAFPV4ITAAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRmVeSWpSXmKPExsVy+t/xu7pzpl6ON1jezmSxccZ6VovrX56z
        Wsw/co7V4vz5DewW978eZbTY9Pgaq8XlXXPYLGac38dk0br3CLtF+9OXzA5cHptWdbJ53Lm2
        h81j85J6j74tqxg9Pm+SC2CN0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXS
        t7NJSc3JLEst0rdL0MvYtuYNW0E/Z8Xsy+cZGxiPsXcxcnJICJhInJp9j7GLkYtDSGApo8SX
        FRegEjISJ6c1sELYwhJ/rnWxQRS9Z5TY3POIBSQhLJAo0dHbAdYtInCFSaL10hVGkASzgK7E
        9HdvmCE6tjJKLH19lAkkwSZgKNH1FmQUJwevgJ3E1c7bYCtYBFQlln7YDVTDwSEqkCRx9rQg
        RImgxMmZT8CWcQqYSTQte84KMd9MYt7mh8wQtrzE9rdzoGxxiVtP5jNNYBSahaR9FpKWWUha
        ZiFpWcDIsopRJLW0ODc9t9hIrzgxt7g0L10vOT93EyMwJrcd+7llB+PKVx/1DjEycTAeYpTg
        YFYS4f1dfzleiDclsbIqtSg/vqg0J7X4EKMp0DsTmaVEk/OBSSGvJN7QzMDU0MTM0sDU0sxY
        SZzX5MiaeCGB9MSS1OzU1ILUIpg+Jg5OqQamlBMuP0/X2fcFHV1010H8XbG5SXV7D1vHkcvb
        l74NCyhynJH4p9fG+M6dqRv09EKnaFb7NHrJnF4ukD3lIlt3dopTYIj7OtuFPtF9961nz2E2
        OCmmnLZ4R5I7Y84168Mhago+T5MurJ/bYfb8t6WKXihPiIfbCz5PoZg5fzPv3dEsD94QeDCh
        Y9V/IyYj7p7NVSFtF0P+reuudtGzuTKTS/lMzr98JSkXIc+gv4xnH2Zftdh+Iy2Tce3pmjsH
        A9k7Hx5a3zVj3typ3YcaU09OrLrYevHWGtbtJ8zzpuWW3+CRLVAumVpp9O7VCdd0zYgPZ07O
        uMhnk9Vev1P4dnVPXdOSq09lX3ydE+2cXKXEUpyRaKjFXFScCAA3zV6CUgMAAA==
X-CMS-MailID: 20201211155156eucas1p2345b94e1cc5674a5e9fbe79088654951
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201210212928eucas1p2c1ebf42843e8358273846957aa860ade
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201210212928eucas1p2c1ebf42843e8358273846957aa860ade
References: <20201210212903.216728-1-krzk@kernel.org>
        <CGME20201210212928eucas1p2c1ebf42843e8358273846957aa860ade@eucas1p2.samsung.com>
        <20201210212903.216728-5-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10.12.2020 22:28, Krzysztof Kozlowski wrote:
> The Samsung PMIC datasheets describe the interrupt line as active low
> with a requirement of acknowledge from the CPU.  The falling edge
> interrupt will mostly work but it's not correct.
>
> Fixes: 1fed2252713e ("ARM: dts: fix pinctrl for s2mps11-irq on exynos5420-arndale-octa")
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>   arch/arm/boot/dts/exynos5420-arndale-octa.dts | 2 +-
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
> index bf457d0c02eb..1aad4859c5f1 100644
> --- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
> +++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
> @@ -349,7 +349,7 @@ pmic@66 {
>   		reg = <0x66>;
>   
>   		interrupt-parent = <&gpx3>;
> -		interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
> +		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&s2mps11_irq>;
>   

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

