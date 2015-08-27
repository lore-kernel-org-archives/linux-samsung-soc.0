From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: use vqmmc-supply of emmc/sd for
 exynos4412-odroid-common
Date: Thu, 27 Aug 2015 21:26:44 +0900
Message-ID: <55DF0204.1010604@samsung.com>
References: <1440667758-14960-1-git-send-email-jh80.chung@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:35585 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752033AbbH0M0u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Aug 2015 08:26:50 -0400
In-Reply-To: <1440667758-14960-1-git-send-email-jh80.chung@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jaehoon Chung <jh80.chung@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>

W dniu 27.08.2015 o 18:29, Jaehoon Chung pisze:
> Currently vmmc's property is wrong.
> If it needs to control two supplies, then it has to use vmmc/vqmmc-supply.
> (Card supply power and I/O Line supply Power.)
> 
> Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> index ca7d168..4ddabfd 100644
> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> @@ -461,10 +461,10 @@
>  &mshc_0 {
>  	pinctrl-0 = <&sd4_clk &sd4_cmd &sd4_bus4 &sd4_bus8>;
>  	pinctrl-names = "default";
> -	vmmc-supply = <&ldo20_reg &buck8_reg>;
> +	vmmc-supply = <&ldo20_reg>;
> +	vqmmc-supply = <&buck8_reg>;

Shouldn't this be reversed? LDO20 has 1.8V and it goes to MMC connector,
so it should be VQMMC?

In the same time I can't find on schematics where BUCK8 goes...

The SDHCI_2 node below looks good.

Best regards,
Krzysztof

>  	mmc-pwrseq = <&emmc_pwrseq>;
>  	status = "okay";
> -
>  	num-slots = <1>;
>  	broken-cd;
>  	card-detect-delay = <200>;
> @@ -485,7 +485,8 @@
>  	bus-width = <4>;
>  	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
>  	pinctrl-names = "default";
> -	vmmc-supply = <&ldo4_reg &ldo21_reg>;
> +	vmmc-supply = <&ldo21_reg>;
> +	vqmmc-supply = <&ldo4_reg>;
>  	cd-gpios = <&gpk2 2 0>;
>  	cd-inverted;
>  	status = "okay";
> 
