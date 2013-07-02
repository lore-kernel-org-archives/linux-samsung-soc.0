From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 3/3] ARM: dts: Add WM1811A audio CODEC to Arndale bindings
Date: Tue, 02 Jul 2013 10:51:36 +0530
Message-ID: <51D26360.2080708@linaro.org>
References: <1372714599-17588-1-git-send-email-broonie@kernel.org> <1372714599-17588-3-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:59638 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752497Ab3GBFVl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Jul 2013 01:21:41 -0400
Received: by mail-pa0-f48.google.com with SMTP id kp12so5822167pab.21
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Jul 2013 22:21:40 -0700 (PDT)
In-Reply-To: <1372714599-17588-3-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@linaro.org>

On 07/02/2013 03:06 AM, Mark Brown wrote:
> From: Mark Brown <broonie@linaro.org>
> 
> The default audio module for the Arndale has a WM811A on it. Add this to

typo: WM1811A

Arndale board also comes with two other audio codec boards - ALC5631Q
and AK4678. Different audio codec boards came with different shipments.

> the device tree bindings.
> 
> Signed-off-by: Mark Brown <broonie@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5250-arndale.dts | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
> index 482f275..75c3065 100644
> --- a/arch/arm/boot/dts/exynos5250-arndale.dts
> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
> @@ -325,7 +325,22 @@
>  	};
>  
>  	i2c@12C90000 {
> -		status = "disabled";
> +		wm1811a@11 {
> +			compatible = "wlf,wm1811";
> +			reg = <0x1a>;
> +
> +			AVDD2-supply = <&main_dc_reg>;
> +			CPVDD-supply = <&main_dc_reg>;
> +			DBVDD1-supply = <&main_dc_reg>;
> +			DBVDD2-supply = <&main_dc_reg>;
> +			DBVDD3-supply = <&main_dc_reg>;
> +			LDO1VDD-supply = <&main_dc_reg>;
> +			SPKVDD1-supply = <&main_dc_reg>;
> +			SPKVDD2-supply = <&main_dc_reg>;
> +
> +			wlf,ldo1ena = <&gpb0 0 0>;
> +			wlf,ldo2ena = <&gpb0 1 0>;
> +		};
>  	};
>  
>  	i2c@12CA0000 {
> 


-- 
Tushar Behera
