From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: dts: Add CODEC MCLK for SMDK5250
Date: Sat, 21 Dec 2013 07:25:14 +0900
Message-ID: <52B4C3CA.5040904@samsung.com>
References: <1386797978-12394-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f44.google.com ([209.85.160.44]:49307 "EHLO
	mail-pb0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751810Ab3LTWZT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Dec 2013 17:25:19 -0500
Received: by mail-pb0-f44.google.com with SMTP id rq2so3148840pbb.31
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2013 14:25:18 -0800 (PST)
In-Reply-To: <1386797978-12394-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@linaro.org>

On 12/12/13 06:39, Mark Brown wrote:
> From: Mark Brown<broonie@linaro.org>
>
> There is a 16.934MHz fixed rate clock connected to MCLK1 on the CODEC, add
> this to the device tree bindings.
>
> Signed-off-by: Mark Brown<broonie@linaro.org>
> ---
>   arch/arm/boot/dts/exynos5250-smdk5250.dts | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> index aaacfc833ccc..00b57faf977e 100644
> --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> @@ -79,6 +79,9 @@
>   			gpio-controller;
>   			#gpio-cells =<2>;
>
> +			clocks =<&codec_mclk>;
> +			clock-names = "MCLK1";
> +
>   			AVDD2-supply =<&vdd>;
>   			CPVDD-supply =<&vdd>;
>   			DBVDD-supply =<&dbvdd>;
> @@ -250,5 +253,11 @@
>   			compatible = "samsung,clock-xxti";
>   			clock-frequency =<24000000>;
>   		};
> +
> +		codec_mclk: codec-mclk {
> +			compatible = "fixed-clock";
> +			#clock-cells =<0>;
> +			clock-frequency =<16934000>;
> +		};
>   	};
>   };

Applied, thanks.

- Kukjin
