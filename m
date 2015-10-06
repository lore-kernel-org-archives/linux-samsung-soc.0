From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH] ARM: dts: exynos4412-odroid: unify voltage regulator
 style
Date: Wed, 7 Oct 2015 01:26:59 +0200
Message-ID: <561458C3.8030806@math.uni-bielefeld.de>
References: <1442858340-4584-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1442858340-4584-2-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:39762 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753078AbbJFX1B (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Oct 2015 19:27:01 -0400
In-Reply-To: <1442858340-4584-2-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: k.kozlowski@samsung.com, devicetree@vger.kernel.org

Gentle ping!

- Tobias

Tobias Jakobi wrote:
> Use 'ldoN_reg: LDON' syntax and drop the deprecated
> 'regulator-compatible' property.
> 
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> index 518230f..9f381bd 100644
> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> @@ -294,15 +294,13 @@
>  				regulator-always-on;
>  			};
>  
> -			ldo8_reg: ldo@8 {
> -				regulator-compatible = "LDO8";
> +			ldo8_reg: LDO8 {
>  				regulator-name = "VDD10_HDMI_1.0V";
>  				regulator-min-microvolt = <1000000>;
>  				regulator-max-microvolt = <1000000>;
>  			};
>  
> -			ldo10_reg: ldo@10 {
> -				regulator-compatible = "LDO10";
> +			ldo10_reg: LDO10 {
>  				regulator-name = "VDDQ_MIPIHSI_1.8V";
>  				regulator-min-microvolt = <1800000>;
>  				regulator-max-microvolt = <1800000>;
> 
