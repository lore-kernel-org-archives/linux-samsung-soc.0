From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/2] ARM: dts: Enable USB hub on Arndale
Date: Mon, 19 Aug 2013 04:34:12 +0900
Message-ID: <521121B4.1020808@samsung.com>
References: <1376522821-16133-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:35809 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754427Ab3HRTeQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 18 Aug 2013 15:34:16 -0400
Received: by mail-pd0-f181.google.com with SMTP id g10so4214083pdj.12
        for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Aug 2013 12:34:15 -0700 (PDT)
In-Reply-To: <1376522821-16133-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

On 08/15/13 08:27, Mark Brown wrote:
> From: Mark Brown<broonie@linaro.org>
>
> The Arndale has a SMSC USB3503 connected in hardware only mode like a PHY,
> support it using the usb-nop-xceiv binding.
>
> Note that due to a regrettable decision to use a regulator to represent
> the reset signal this uses a fixed voltage regulator to do that, there
> is a plan to use the reset controller binding once that is merged so it
> does not seem worthwhile to fix the usb-nop-xceiv driver at this point.
>
> Signed-off-by: Mark Brown<broonie@linaro.org>
> Tested-by: Tushar Behera<tushar.behera@linaro.org>
> ---
>   arch/arm/boot/dts/exynos5250-arndale.dts | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
> index 96d528d..2428ffd 100644
> --- a/arch/arm/boot/dts/exynos5250-arndale.dts
> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
> @@ -539,4 +539,18 @@
>   	rtc {
>   		status = "okay";
>   	};
> +
> +	usb_hub_bus {
> +		compatible = "simple-bus";
> +		#address-cells =<1>;
> +		#size-cells =<0>;
> +
> +		// SMSC USB3503 connected in hardware only mode as a PHY
> +		usb_hub: usb_hub {
> +			compatible = "smsc,usb3503a";
> +
> +			reset-gpios =<&gpx3 5 1>;
> +			connect-gpios =<&gpd1 7 1>;
> +		};
> +	};
>   };

Applied, thanks.

Kukjin
