From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH] ARM: dts: exynos4412-odroid: remove redundant pinctrl
 settings
Date: Wed, 7 Oct 2015 01:26:38 +0200
Message-ID: <561458AE.3040801@math.uni-bielefeld.de>
References: <1442858340-4584-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:39761 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753382AbbJFX0n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Oct 2015 19:26:43 -0400
In-Reply-To: <1442858340-4584-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: k.kozlowski@samsung.com, devicetree@vger.kernel.org

Gentle ping!

- Tobias


Tobias Jakobi wrote:
> The pinctrl settings in i2c_0 and i2c_1 are already provided
> through the exynos4 dtsi.
> 
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> index 3f8bc7b..3c34e74 100644
> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> @@ -217,8 +217,6 @@
>  };
>  
>  &i2c_0 {
> -	pinctrl-0 = <&i2c0_bus>;
> -	pinctrl-names = "default";
>  	samsung,i2c-sda-delay = <100>;
>  	samsung,i2c-max-bus-freq = <400000>;
>  	status = "okay";
> @@ -444,8 +442,6 @@
>  };
>  
>  &i2c_1 {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&i2c1_bus>;
>  	status = "okay";
>  	max98090: max98090@10 {
>  		compatible = "maxim,max98090";
> @@ -460,8 +456,6 @@
>  
>  &i2c_2 {
>  	status = "okay";
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&i2c2_bus>;
>  };
>  
>  &i2c_8 {
> 
