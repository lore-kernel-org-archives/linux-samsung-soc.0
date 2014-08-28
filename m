From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 12/14] arm64: dts: add Exynos7 based Espresso board dts
 file
Date: Wed, 27 Aug 2014 21:00:15 -0700
Message-ID: <20140828040015.GC4972@localhost>
References: <1409132660-1898-1-git-send-email-ch.naveen@samsung.com>
 <1409132660-1898-4-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:33740 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750714AbaH1EFk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Aug 2014 00:05:40 -0400
Received: by mail-pa0-f42.google.com with SMTP id lf10so809728pab.15
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Aug 2014 21:05:39 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1409132660-1898-4-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: catalin.marinas@arm.com, naveenkrishna.ch@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, cpgs@samsung.com, Rob Herring <robh@kernel.org>

Hi,

On Wed, Aug 27, 2014 at 03:14:19PM +0530, Naveen Krishna Chatradhi wrote:
> This patch adds initial dts file for the Espresso board
> based on Exynos7 from Samsung.
> 
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> ---
>  arch/arm64/boot/dts/Makefile             |    1 +
>  arch/arm64/boot/dts/exynos7-espresso.dts |   69 ++++++++++++++++++++++++++++++
>  2 files changed, 70 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos7-espresso.dts
> 
> diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
> index c52bdb0..d160de1 100644
> --- a/arch/arm64/boot/dts/Makefile
> +++ b/arch/arm64/boot/dts/Makefile
> @@ -1,5 +1,6 @@
>  dtb-$(CONFIG_ARCH_VEXPRESS) += rtsm_ve-aemv8a.dtb foundation-v8.dtb
>  dtb-$(CONFIG_ARCH_XGENE) += apm-mustang.dtb
> +dtb-$(CONFIG_ARCH_EXYNOS7) += exynos7-espresso.dtb

As mentioned on the dtsi patch, please create a subdirectory.

>  targets += dtbs
>  targets += $(dtb-y)
> diff --git a/arch/arm64/boot/dts/exynos7-espresso.dts b/arch/arm64/boot/dts/exynos7-espresso.dts
> new file mode 100644
> index 0000000..e35e83c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos7-espresso.dts
> @@ -0,0 +1,69 @@
> +/*
> + * SAMSUNG Espresso board device tree source
> + *
> + * Copyright (c) 2014 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +/dts-v1/;
> +#include <dt-bindings/gpio/gpio.h>
> +#include "exynos7.dtsi"
> +
> +/ {
> +	model = "Samsung ESPRESSO board based on EXYNOS7";
> +	compatible = "samsung,espresso", "samsung,exynos7";
> +
> +	chosen {
> +		bootargs = "console=ttySAC2,115200n8 root=/dev/ram0 ramdisk=16384 initrd=0x42000000,16M init=/linuxrc";

Having ramdisk bootargs like these in the upstream dts doesn't make much
sense. Configure your bootloader to pass them in instead.

You might want to specify the console through chosen instead, there's
been recent support added for that.

> +
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg = <0x40000000 0xC0000000>;
> +	};
> +
> +	mmc@15740000 {
> +		status = "okay";
> +		num-slots = <1>;
> +		broken-cd;
> +		caps2-mmc-hs200-1_8v;
> +		supports-highspeed;
> +		non-removable;
> +		card-detect-delay = <200>;
> +		clock-frequency = <800000000>;
> +		samsung,dw-mshc-ciu-div = <3>;
> +		samsung,dw-mshc-sdr-timing = <0 4>;
> +		samsung,dw-mshc-ddr-timing = <0 2>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_rdqs &sd0_bus1 &sd0_bus4 &sd0_bus8>;
> +		bus-width = <8>;
> +
> +		slot@0 {
> +			reg = <0>;
> +			bus-width = <8>;
> +		};

I thought the use of slot was deprecated. Why do you have it here?

Also, as mentioned by others elsewhere, please use references instead
of duplicating the structure here.


-Olof
