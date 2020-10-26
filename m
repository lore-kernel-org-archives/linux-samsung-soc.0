Return-Path: <SRS0=YeST=EB=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B96AC4363A
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 21:48:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03B3520829
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 21:48:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="FnQXyFSg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390288AbgJZVsL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Oct 2020 17:48:11 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:52506 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390274AbgJZVsL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 17:48:11 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201026214759euoutp01cd30e9fd8d27b7cb3ab84f4ad4601bb3~BqRvKAlns1111611116euoutp01a
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2020 21:47:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201026214759euoutp01cd30e9fd8d27b7cb3ab84f4ad4601bb3~BqRvKAlns1111611116euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1603748879;
        bh=U/Hht8e4he4QLVwftITH602ZO3nodR7cU1xCfqlvRIs=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=FnQXyFSg/Rksn5wCW4U03jDGUX3UP9T2ohSx5DSG4vMZiXh3dGkH9yLZMtgFKk6Ua
         4N7Ky7VhMxSjpdDd4Kt0UqXuKBZAWtPJPTiwT8M+vSBN3bChe/zv3LKbCLaqJTsRpw
         UrNbGdIfVgw4fudXkbD7+wNE8f7QUHguqCssWLfA=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201026214748eucas1p1a974b52567b5d03bdef134797df86ee8~BqRlGHURj0697506975eucas1p1N;
        Mon, 26 Oct 2020 21:47:48 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 90.5E.05997.404479F5; Mon, 26
        Oct 2020 21:47:48 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201026214747eucas1p2791f92b9b7d82f337d1c8eb4546b8a76~BqRkt3-Mf2964029640eucas1p2S;
        Mon, 26 Oct 2020 21:47:47 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201026214747eusmtrp130f93434fefae38bf3740f9dc92f7dd1~BqRktMPk91673716737eusmtrp1O;
        Mon, 26 Oct 2020 21:47:47 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-be-5f9744049a3a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 6D.8D.06314.304479F5; Mon, 26
        Oct 2020 21:47:47 +0000 (GMT)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201026214747eusmtip25a916e23ca5c3d8be10d9ab8fb08f5db~BqRkIDFal3242432424eusmtip2Y;
        Mon, 26 Oct 2020 21:47:47 +0000 (GMT)
Subject: Re: [PATCH 08/12] ARM: dts: exynos: adjust node names to DT spec in
 Exynos542x boards
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <f14a69bc-bd8f-b0d7-2967-1e7582562d5e@samsung.com>
Date:   Mon, 26 Oct 2020 22:47:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201026181528.163143-9-krzk@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJKsWRmVeSWpSXmKPExsWy7djPc7osLtPjDQ428Vs8mLeNzWLjjPWs
        Fte/PGe1mH/kHKtF/+PXzBbnz29gt9j0+BqrxeVdc9gsZpzfx2TRuvcIu0X705fMDtwem1Z1
        snlsXlLv0bdlFaPH501yASxRXDYpqTmZZalF+nYJXBkXjr9gK/hqUHHw1V22BsZral2MHBwS
        AiYS9645djFycQgJrGCUuL/iMBOE84VRYtKHpewQzmdGiYbtzWxdjJxgHS82zICqWs4ocffj
        WRYI5z2jxKlbl9hB5goLJEhMXSsDEhcB6b48+RoziMMssIVRYuKXaWCj2AQMJbredoHZvAJ2
        Eu/nHmQFsVkEVCVez7wAZosKJEn8/fyHGaJGUOLkzCcsIDangJnE7ottYDazgLzE9rdzmCFs
        cYlbT+YzQZx6il1ix4pECNtFYuORo4wQtrDEq+Nb2CFsGYnTk3vAPpAQaGaUeHhuLTuE0wN0
        dtMMqA5riTvnfrGBvMYsoCmxfpc+RNhR4tjc3eyQkOSTuPFWEOIGPolJ26YzQ4R5JTrahCCq
        1SRmHV8Ht/bghUvMExiVZiH5bBaSb2Yh+WYWwt4FjCyrGMVTS4tz01OLjfJSy/WKE3OLS/PS
        9ZLzczcxAhPU6X/Hv+xg3PUn6RCjAAejEg/vhbfT4oVYE8uKK3MPMUpwMCuJ8DqdPR0nxJuS
        WFmVWpQfX1Sak1p8iFGag0VJnNd40ctYIYH0xJLU7NTUgtQimCwTB6dUA6P/pOTD9ww7hbfk
        yAvOZ22quH/W7t/7H3cZftkevrR1eohCme3MsLiptWu2bF4qaKG/WzTxoful6Ybb9ojahnP/
        fvnGeMvRdofwZsHfyVtnr1f3yKq6t01u/4+NcsvsnP74VBz6oG16XPFMv4xg5bTZz8MlUyat
        CjyyPGXqkX8OUrKFh1plpjoosRRnJBpqMRcVJwIAhr0qOUwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRmVeSWpSXmKPExsVy+t/xe7rMLtPjDfoeGVs8mLeNzWLjjPWs
        Fte/PGe1mH/kHKtF/+PXzBbnz29gt9j0+BqrxeVdc9gsZpzfx2TRuvcIu0X705fMDtwem1Z1
        snlsXlLv0bdlFaPH501yASxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6
        djYpqTmZZalF+nYJehkXjr9gK/hqUHHw1V22BsZral2MnBwSAiYSLzbMYAKxhQSWMkr8P80I
        EZeRODmtgRXCFpb4c62LrYuRC6jmLaPE7RPrgBIcHMICCRJT18qAxEUEPjNKPGvcxAziMAts
        YZS4M2kbC0THVkaJNStWs4CMYhMwlOh6CzKKk4NXwE7i/dyDYCtYBFQlXs+8AGaLCiRJvLww
        lQmiRlDi5MwnYL2cAmYSuy+2gdnMQPa8zQ+ZIWx5ie1v50DZ4hK3nsxnmsAoNAtJ+ywkLbOQ
        tMxC0rKAkWUVo0hqaXFuem6xoV5xYm5xaV66XnJ+7iZGYExuO/Zz8w7GSxuDDzEKcDAq8fBe
        eDstXog1say4MvcQowQHs5IIr9PZ03FCvCmJlVWpRfnxRaU5qcWHGE2BnpvILCWanA9MF3kl
        8YamhuYWlobmxubGZhZK4rwdAgdjhATSE0tSs1NTC1KLYPqYODilGhgVnI13PP7Ctf1T8boP
        dqICui90L25TrJrtKrJ3ypenGpbfCk453rk37cyy6DrditywXZbFbsd39Rnuqs7Z3TenqVlR
        McV8SvC0y2uTH7y8O21D93xxfrcOazHpmMsqcVO33g9h/2ThNKlveXFMmOfhG2tnnw1JrDXX
        s3r/XvI3n6114Dt3XSYlluKMREMt5qLiRABhbzIn3wIAAA==
X-CMS-MailID: 20201026214747eucas1p2791f92b9b7d82f337d1c8eb4546b8a76
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201026181608eucas1p17927126482dc9ed2aefa2ff4c64491cd
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201026181608eucas1p17927126482dc9ed2aefa2ff4c64491cd
References: <20201026181528.163143-1-krzk@kernel.org>
        <CGME20201026181608eucas1p17927126482dc9ed2aefa2ff4c64491cd@eucas1p1.samsung.com>
        <20201026181528.163143-9-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 26.10.2020 19:15, Krzysztof Kozlowski wrote:
> The Devicetree specification expects device node names to have a generic
> name, representing the class of a device.  Also the convention for node
> names is to use hyphens, not underscores.
>
> No functional changes.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>   arch/arm/boot/dts/exynos5420-arndale-octa.dts      | 4 ++--
>   arch/arm/boot/dts/exynos5420-peach-pit.dts         | 4 ++--
>   arch/arm/boot/dts/exynos5420-smdk5420.dts          | 2 +-
>   arch/arm/boot/dts/exynos5422-odroid-core.dtsi      | 2 +-
>   arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi  | 2 +-
>   arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 4 ++--
>   arch/arm/boot/dts/exynos5422-odroidxu3.dts         | 8 ++++----
>   arch/arm/boot/dts/exynos5800-peach-pi.dts          | 4 ++--
>   8 files changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
> index dd7f8385d81e..bf457d0c02eb 100644
> --- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
> +++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
> @@ -39,7 +39,7 @@ oscclk {
>   		};
>   	};
>   
> -	gpio_keys {
> +	gpio-keys {
>   		compatible = "gpio-keys";
>   
>   		wakeup {
> @@ -344,7 +344,7 @@ &hdmi {
>   &hsi2c_4 {
>   	status = "okay";
>   
> -	s2mps11_pmic@66 {
> +	pmic@66 {
>   		compatible = "samsung,s2mps11-pmic";
>   		reg = <0x66>;
>   
> diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
> index 2bcbdf8a39bf..d54392fe6260 100644
> --- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
> +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
> @@ -138,7 +138,7 @@ panel_in: endpoint {
>   		};
>   	};
>   
> -	mmc1_pwrseq: mmc1_pwrseq {
> +	mmc1_pwrseq: mmc1-pwrseq {
>   		compatible = "mmc-pwrseq-simple";
>   		reset-gpios = <&gpx0 0 GPIO_ACTIVE_LOW>; /* WIFI_EN */
>   		clocks = <&max77802 MAX77802_CLK_32K_CP>;
> @@ -205,7 +205,7 @@ &hsi2c_4 {
>   	status = "okay";
>   	clock-frequency = <400000>;
>   
> -	max77802: max77802-pmic@9 {
> +	max77802: pmic@9 {
>   		compatible = "maxim,max77802";
>   		interrupt-parent = <&gpx3>;
>   		interrupts = <1 IRQ_TYPE_NONE>;
> diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> index 4e49d8095b29..d506da9fa661 100644
> --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
> +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> @@ -129,7 +129,7 @@ &hdmi {
>   &hsi2c_4 {
>   	status = "okay";
>   
> -	s2mps11_pmic@66 {
> +	pmic@66 {
>   		compatible = "samsung,s2mps11-pmic";
>   		reg = <0x66>;
>   
> diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
> index b1cf9414ce17..25fb6331c75e 100644
> --- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
> +++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
> @@ -503,7 +503,7 @@ &dmc {
>   &hsi2c_4 {
>   	status = "okay";
>   
> -	s2mps11_pmic@66 {
> +	pmic@66 {
>   		compatible = "samsung,s2mps11-pmic";
>   		reg = <0x66>;
>   		samsung,s2mps11-acokb-ground;
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi
> index b5ec4f47eb3a..f5f9c077df74 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi
> @@ -40,7 +40,7 @@ codec {
>   
>   &hsi2c_5 {
>   	status = "okay";
> -	max98090: max98090@10 {
> +	max98090: codec@10 {
>   		compatible = "maxim,max98090";
>   		reg = <0x10>;
>   		interrupt-parent = <&gpx3>;
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> index 5da2d81e3be2..e35af40a55cb 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> @@ -13,12 +13,12 @@
>   #include "exynos5422-odroid-core.dtsi"
>   
>   / {
> -	gpio_keys {
> +	gpio-keys {
>   		compatible = "gpio-keys";
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&power_key>;
>   
> -		power_key {
> +		power-key {
>   			/*
>   			 * The power button (SW2) is connected to the PWRON
>   			 * pin (active high) of the S2MPS11 PMIC, which acts
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> index d0f6ac5fa79d..5ff493ecb6ff 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> @@ -21,28 +21,28 @@ &i2c_0 {
>   	status = "okay";
>   
>   	/* A15 cluster: VDD_ARM */
> -	ina231@40 {
> +	sensor@40 {
power-sensor?
>   		compatible = "ti,ina231";
>   		reg = <0x40>;
>   		shunt-resistor = <10000>;
>   	};
>   
>   	/* memory: VDD_MEM */
> -	ina231@41 {
> +	sensor@41 {
>   		compatible = "ti,ina231";
>   		reg = <0x41>;
>   		shunt-resistor = <10000>;
>   	};
>   
>   	/* GPU: VDD_G3D */
> -	ina231@44 {
> +	sensor@44 {
>   		compatible = "ti,ina231";
>   		reg = <0x44>;
>   		shunt-resistor = <10000>;
>   	};
>   
>   	/* A7 cluster: VDD_KFC */
> -	ina231@45 {
> +	sensor@45 {
>   		compatible = "ti,ina231";
>   		reg = <0x45>;
>   		shunt-resistor = <10000>;
> diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
> index 60ab0effe474..0ce3443d39a8 100644
> --- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
> +++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
> @@ -138,7 +138,7 @@ panel_in: endpoint {
>   		};
>   	};
>   
> -	mmc1_pwrseq: mmc1_pwrseq {
> +	mmc1_pwrseq: mmc1-pwrseq {
>   		compatible = "mmc-pwrseq-simple";
>   		reset-gpios = <&gpx0 0 GPIO_ACTIVE_LOW>; /* WIFI_EN */
>   		clocks = <&max77802 MAX77802_CLK_32K_CP>;
> @@ -214,7 +214,7 @@ &hsi2c_4 {
>   	status = "okay";
>   	clock-frequency = <400000>;
>   
> -	max77802: max77802-pmic@9 {
> +	max77802: pmic@9 {
>   		compatible = "maxim,max77802";
>   		interrupt-parent = <&gpx3>;
>   		interrupts = <1 IRQ_TYPE_NONE>;

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

