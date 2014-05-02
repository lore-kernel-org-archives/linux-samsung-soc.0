From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: Add peach-pi board support
Date: Fri, 02 May 2014 19:10:14 +0200
Message-ID: <5363D176.80601@gmail.com>
References: <1399035821-25096-1-git-send-email-arun.kk@samsung.com> <1399035821-25096-4-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f178.google.com ([209.85.216.178]:43600 "EHLO
	mail-qc0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752148AbaEBRKQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 May 2014 13:10:16 -0400
In-Reply-To: <1399035821-25096-4-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, olofj@google.com, t.figa@samsung.com, sachin.kamat@linaro.org, tushar.behera@linaro.org, arunkk.samsung@gmail.com

Hi Arun,

On 02.05.2014 15:03, Arun Kumar K wrote:
> Adds support for google peach-pi board having the
> Exynos5800 SoC.
>
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> ---
>   arch/arm/boot/dts/Makefile                |    3 +-
>   arch/arm/boot/dts/exynos5800-peach-pi.dts |  144 +++++++++++++++++++++++++++++
>   2 files changed, 146 insertions(+), 1 deletion(-)
>   create mode 100644 arch/arm/boot/dts/exynos5800-peach-pi.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 35c146f..efe1573 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -76,7 +76,8 @@ dtb-$(CONFIG_ARCH_EXYNOS) += exynos4210-origen.dtb \
>   	exynos5420-arndale-octa.dtb \
>   	exynos5420-smdk5420.dtb \
>   	exynos5440-sd5v1.dtb \
> -	exynos5440-ssdk5440.dtb
> +	exynos5440-ssdk5440.dtb \
> +	exynos5800-peach-pi.dtb
>   dtb-$(CONFIG_ARCH_HI3xxx) += hi3620-hi4511.dtb
>   dtb-$(CONFIG_ARCH_HIGHBANK) += highbank.dtb \
>   	ecx-2000.dtb
> diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
> new file mode 100644
> index 0000000..e0f8633
> --- /dev/null
> +++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
> @@ -0,0 +1,144 @@
> +/*
> + * Google Peach Pi Rev 10+ board device tree source
> + *
> + * Copyright (c) 2014 Google, Inc
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +/dts-v1/;
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include "exynos5800.dtsi"
> +
> +/ {
> +	model = "Google Peach Pi Rev 10+";
> +
> +	compatible = "google,pi-rev16",
> +		"google,pi-rev15", "google,pi-rev14",
> +		"google,pi-rev13", "google,pi-rev12",
> +		"google,pi-rev11", "google,pi-rev10",
> +		"google,pi", "google,peach", "samsung,exynos5800",
> +		"samsung,exynos5";

I can see this board using the "google,peach" compatible string, which 
is the same as one listed for peach-pit board. Since they are based on 
different SoCs, are they really compatible?

> +
> +	memory {
> +		reg = <0 0>;

I don't think this is a good idea, because this is basically rendering 
this dts file useless, unless used with a bootloader that can actually 
inject correct values. I believe that some generic setup could be 
provided in the dts, so you could at least get the board running.

Otherwise looks good, so after addressing the two comments above feel 
free to add my Reviewed-by.

Best regards,
Tomasz
