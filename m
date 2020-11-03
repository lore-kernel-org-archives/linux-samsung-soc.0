Return-Path: <SRS0=6Xyg=EJ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4A00C2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 21:24:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5AF3D20757
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 21:24:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="kYhwuY6J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732628AbgKCVY0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 Nov 2020 16:24:26 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:34990 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388671AbgKCVYY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Nov 2020 16:24:24 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201103212411euoutp015d2644bf36ff77c4b32c64ca3aed9105~EHHPp909C3039830398euoutp01b
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Nov 2020 21:24:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201103212411euoutp015d2644bf36ff77c4b32c64ca3aed9105~EHHPp909C3039830398euoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604438651;
        bh=FlFwFSWnxqIBLI3bq4HFIiIcSEyjS1YS++wjk3nZ0Sg=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=kYhwuY6JWexfYWhECAZbcg8uFTzwAbU4qbbmJr83h8QYF4KJTKF+HNlxsh+IwcKzY
         4eAh4p36yOQgBIWgQDmPM+WDmwo1J3XQ/OaW50uZsWZn8Bp67bNaKNobdU0uBiLJzg
         2kuswfHMAccR4nFImG4x9ez23tQPNx3VvybblmNw=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201103212405eucas1p192173d9d54a4e5c953fd1e005cd97ec3~EHHKhbxR91331413314eucas1p1L;
        Tue,  3 Nov 2020 21:24:05 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id D8.E8.06456.57AC1AF5; Tue,  3
        Nov 2020 21:24:05 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201103212404eucas1p11f7b694c657623108b90967da25774f6~EHHJlMKVm1899818998eucas1p1y;
        Tue,  3 Nov 2020 21:24:04 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201103212404eusmtrp2a7f276f84f491d2ddf54f752a36da273~EHHJkmIId0117001170eusmtrp2j;
        Tue,  3 Nov 2020 21:24:04 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-67-5fa1ca755323
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 5C.EE.06314.47AC1AF5; Tue,  3
        Nov 2020 21:24:04 +0000 (GMT)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201103212404eusmtip1aa8375b8224e0fb3d3fa5c310c6c7c23~EHHJUoLID0157501575eusmtip1C;
        Tue,  3 Nov 2020 21:24:04 +0000 (GMT)
Subject: Re: [PATCH] ARM: dts: exynos: Enable DWC2 dual-role support on
 OdroidU3+ boards
To:     linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <478212e8-91c3-4a18-2e8f-b9222052f3de@samsung.com>
Date:   Tue, 3 Nov 2020 22:24:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201103140214.21690-1-m.szyprowski@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphleLIzCtJLcpLzFFi42LZduznOd3SUwvjDb7+NrXYOGM9q8X58xvY
        LWac38fkwOyxaVUnm0ffllWMHp83yQUwR3HZpKTmZJalFunbJXBlfH19kq3gq0jF0nltrA2M
        bwS6GDk5JARMJD4f72TsYuTiEBJYwShx78FNVgjnC6PE99dv2CCcz4wSs/YsZIFpmbxrOzNE
        YjmjxIn9k6Cq3jNKvNu0kw2kSlggSmL21c9gHSICqhKf2xawg9jMAokSTWumM4HYbAKGEl1v
        u8DqeQXsJG69bAWLswioSLy9c4IRxBYVSJL4+/kPM0SNoMTJmU/AZnIC1S9ceoENYqa8xPa3
        c5ghbHGJW0/mM0Fc2swusfJ8QRcjB5DtIvG/UwIiLCzx6vgWdghbRuL/TpByLpByRomH59ay
        Qzg9jBKXm2YwQlRZS9w594sNZBCzgKbE+l36EGFHifOrTrBBzOeTuPFWEOIEPolJ26YzQ4R5
        JTrahCCq1SRmHV8Ht/bghUvMExiVZiF5bBaSZ2YheWYWwt4FjCyrGMVTS4tz01OLDfNSy/WK
        E3OLS/PS9ZLzczcxAtPI6X/HP+1g/Hop6RCjAAejEg/vgW0L44VYE8uKK3MPMUpwMCuJ8Dqd
        PR0nxJuSWFmVWpQfX1Sak1p8iFGag0VJnNd40ctYIYH0xJLU7NTUgtQimCwTB6dUA2N14HPl
        k67qlybw73I/sd1m5pOYjNLFiumNEu0vjCW+XFbS4HD5Y3Lg0+3zS9TiuEp+Ggear9rfet1i
        86zySQ/NaqcfKLlYH9DLnymTkt29++7/Y1KpUjoBz5PDr0eIzk3OYtKJnFO/f5MYb1P0ca8r
        614rHr8Yuevq5Y4Pu6YYFb1Mu3C/4IQSS3FGoqEWc1FxIgBX4jJLHwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAIsWRmVeSWpSXmKPExsVy+t/xu7olpxbGGyzvN7bYOGM9q8X58xvY
        LWac38fkwOyxaVUnm0ffllWMHp83yQUwR+nZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hka
        m8daGZkq6dvZpKTmZJalFunbJehlfH19kq3gq0jF0nltrA2MbwS6GDk5JARMJCbv2s7cxcjF
        ISSwlFHi1NQlrBAJGYmT0xqgbGGJP9e62CCK3jJKTPgyESwhLBAlMfvqZxYQW0RAVeJz2wJ2
        EJtZIFHi1oRJrBANExklrl48wwiSYBMwlOh6CzKJk4NXwE7i1stWJhCbRUBF4u2dE2A1ogJJ
        Ei8vTGWCqBGUODnzCdgCTqD6hUsvsEEsMJOYt/khM4QtL7H97RwoW1zi1pP5TBMYhWYhaZ+F
        pGUWkpZZSFoWMLKsYhRJLS3OTc8tNtQrTswtLs1L10vOz93ECIydbcd+bt7BeGlj8CFGAQ5G
        JR7eA9sWxguxJpYVV+YeYpTgYFYS4XU6ezpOiDclsbIqtSg/vqg0J7X4EKMp0HMTmaVEk/OB
        cZ1XEm9oamhuYWlobmxubGahJM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoGxocRTi/t7VJV7
        9/5HD0qUuW82zNqzWD0z4dCTwE6bzvbmNV9qvv9+fFtZ9CpvkTl744H9d27PKxG7dK7+0TmJ
        2rWPLqSUb+vsf1lbcCLm36HuPu7aO9q3/jZL9IjKb8r781RhkfDLyzN0nmRmPtgYVnL+b4hW
        6jU/gRmM/MGbXmk9Lu7ccL9JiaU4I9FQi7moOBEAHM05ArMCAAA=
X-CMS-MailID: 20201103212404eucas1p11f7b694c657623108b90967da25774f6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201103140221eucas1p1c4479a8a89e7e9a05c7582462d79e5c7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201103140221eucas1p1c4479a8a89e7e9a05c7582462d79e5c7
References: <CGME20201103140221eucas1p1c4479a8a89e7e9a05c7582462d79e5c7@eucas1p1.samsung.com>
        <20201103140214.21690-1-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 03.11.2020 15:02, Marek Szyprowski wrote:
> MicroUSB port on OdroidU3+ boards can operate both as peripheral or as
> host port. Till now it was configured as pheriperal only port, but it
> turned out that the DWC2 driver code already handles everything needed to
> support USB role-switch, so switch it to dual-role (OTG) mode. This has
> no effect on OdroidU3 (with 'plus') and OdroidX2, which doesn't have USB
/s/with/without
> needed ID pin and VBUS wiring. Those will still operate correctly in
> pheriperal mode only.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   arch/arm/boot/dts/exynos4412-odroid-common.dtsi |  1 -
>   arch/arm/boot/dts/exynos4412-odroidu3.dts       | 14 ++++++++++++++
>   arch/arm/boot/dts/exynos4412-odroidx.dts        |  4 ++++
>   3 files changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> index 2a6f5b1d7645..2b20d9095d9f 100644
> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> @@ -255,7 +255,6 @@
>   };
>   
>   &hsotg {
> -	dr_mode = "peripheral";
>   	status = "okay";
>   	vusb_d-supply = <&ldo15_reg>;
>   	vusb_a-supply = <&ldo12_reg>;
> diff --git a/arch/arm/boot/dts/exynos4412-odroidu3.dts b/arch/arm/boot/dts/exynos4412-odroidu3.dts
> index b8549d846f86..746c2a99a83c 100644
> --- a/arch/arm/boot/dts/exynos4412-odroidu3.dts
> +++ b/arch/arm/boot/dts/exynos4412-odroidu3.dts
> @@ -21,6 +21,15 @@
>   		reg = <0x40000000 0x7FF00000>;
>   	};
>   
> +	vbus_otg_reg: voltage-regulator-1 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VBUS_VDD_5.0V";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpl2 0 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
>   	leds {
>   		compatible = "gpio-leds";
>   		led1 {
> @@ -105,6 +114,11 @@
>   	phy-names = "hsic0", "hsic1";
>   };
>   
> +&hsotg {
> +	dr_mode = "otg";
> +	vbus-supply = <&vbus_otg_reg>;
> +};
> +
>   &sound {
>   	model = "Odroid-U3";
>   	samsung,audio-widgets =
> diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
> index 46381e9097f4..d6ee62bf336c 100644
> --- a/arch/arm/boot/dts/exynos4412-odroidx.dts
> +++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
> @@ -76,6 +76,10 @@
>   	};
>   };
>   
> +&hsotg {
> +	dr_mode = "peripheral";
> +};
> +
>   &mshc_0 {
>   	vqmmc-supply = <&buck8_reg>;
>   };

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

