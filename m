From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos-5422-odroid: Add eMMC and SD regulator
 supplies
Date: Mon, 04 Apr 2016 09:28:43 +0900
Message-ID: <5701B53B.8000703@samsung.com>
References: <56FE7AC4.4090508@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:60424 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753694AbcDDA2v (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 Apr 2016 20:28:51 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O53009842NZF270@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Apr 2016 01:28:48 +0100 (BST)
In-reply-to: <56FE7AC4.4090508@fivetechno.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Markus Reichl <m.reichl@fivetechno.de>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On 01.04.2016 22:42, Markus Reichl wrote:
> Add vmmc and vqmmc supplies from MF circuit sheets for eMMC and SD on
> odroid XU3 and XU4 to avoid warnings in dmesg output.

What warnings?

> 
> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
> ---
>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> index 1bd507b..eec425a 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> @@ -121,7 +121,7 @@
>                         };
>  
>                         ldo3_reg: LDO3 {
> -                               regulator-name = "vdd_ldo3";
> +                               regulator-name = "vddq_mmc0";
>                                 regulator-min-microvolt = <1800000>;
>                                 regulator-max-microvolt = <1800000>;
>                                 regulator-always-on;
> @@ -184,7 +184,7 @@
>                         };
>  
>                         ldo13_reg: LDO13 {
> -                               regulator-name = "vdd_ldo13";
> +                               regulator-name = "vddq_mmc2";
>                                 regulator-min-microvolt = <2800000>;
>                                 regulator-max-microvolt = <2800000>;
>                                 regulator-always-on;
> @@ -211,6 +211,13 @@
>                                 regulator-always-on;
>                         };
>  
> +                       ldo18_reg: LDO18 {
> +                               regulator-name = "vdd_emmc_1V8";
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <1800000>;
> +                               regulator-always-on;

In the same patchset you add always-on and remove. What is the point of
this juggle?

Best regards,
Krzysztof
