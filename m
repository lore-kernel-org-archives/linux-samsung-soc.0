From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/2] ARM: dts: Add wake up key to Arndale octa board
Date: Mon, 24 Feb 2014 09:25:05 +0900
Message-ID: <530A9161.5090206@samsung.com>
References: <1387356339-14082-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f52.google.com ([209.85.160.52]:46806 "EHLO
	mail-pb0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751214AbaBXAZM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 23 Feb 2014 19:25:12 -0500
Received: by mail-pb0-f52.google.com with SMTP id rp16so1226937pbb.25
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Feb 2014 16:25:12 -0800 (PST)
In-Reply-To: <1387356339-14082-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On 12/18/13 17:45, Sachin Kamat wrote:
> Added GPIO based wake up key to Arndale octa board.
>
> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
> ---
>   arch/arm/boot/dts/exynos5420-arndale-octa.dts |   11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
> index edd933feaf48..240caab5129f 100644
> --- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
> +++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
> @@ -12,6 +12,7 @@
>   /dts-v1/;
>   #include "exynos5420.dtsi"
>   #include<dt-bindings/interrupt-controller/irq.h>
> +#include<dt-bindings/input/input.h>
>
>   / {
>   	model = "Insignal Arndale Octa evaluation board based on EXYNOS5420";
> @@ -349,4 +350,14 @@
>   		};
>   	};
>
> +	gpio_keys {
> +		compatible = "gpio-keys";
> +
> +		wakeup {
> +			label = "SW-TACT1";
> +			gpios =<&gpx2 7 1>;
> +			linux,code =<KEY_WAKEUP>;
> +			gpio-key,wakeup;
> +		};
> +	};
>   };

Applied with 2/2 patch, thanks.

- Kukjin
