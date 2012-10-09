From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 2/2] ARM: Exynos5250: Enabling ohci-exynos driver
Date: Tue, 09 Oct 2012 17:29:14 +0900
Message-ID: <003901cda5f8$2a4f3980$7eedac80$%han@samsung.com>
References: <1349431818-15639-1-git-send-email-gautam.vivek@samsung.com>
 <1349431818-15639-3-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:53681 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751757Ab2JII3P (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Oct 2012 04:29:15 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBM00DYAA7XVTG0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 09 Oct 2012 17:29:14 +0900 (KST)
Received: from DOJG1HAN02 ([12.23.120.99])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MBM00B55A8QKI50@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 09 Oct 2012 17:29:14 +0900 (KST)
In-reply-to: <1349431818-15639-3-git-send-email-gautam.vivek@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vivek Gautam' <gautam.vivek@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, kyungmin.park@samsung.com, 'Jingoo Han' <jg1.han@samsung.com>

On Friday, October 05, 2012 7:10 PM Vivek Gautam wrote
> 
> Adding OHCI device tree node for Exynos5250 along with
> the device base address.
> 
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>

It looks good. Also I have tested this patch with Exynos5250.

Acked-by: Jingoo Han <jg1.han@samsung.com>

> ---
>  .../devicetree/bindings/usb/exynos-usb.txt         |   15 +++++++++++++++
>  arch/arm/boot/dts/exynos5250.dtsi                  |    6 ++++++
>  arch/arm/mach-exynos/include/mach/map.h            |    1 +
>  arch/arm/mach-exynos/mach-exynos5-dt.c             |    2 ++
>  4 files changed, 24 insertions(+), 0 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/exynos-usb.txt
> b/Documentation/devicetree/bindings/usb/exynos-usb.txt
> index 56e35c7..bff10a8 100644
> --- a/Documentation/devicetree/bindings/usb/exynos-usb.txt
> +++ b/Documentation/devicetree/bindings/usb/exynos-usb.txt
> @@ -23,3 +23,18 @@ Example:
>  		interrupts = <0 71 0>;
>  		samsung,vbus-gpio = <&gpx2 6 1 3 3>;
>  	};
> +
> +OHCI
> +Required properties:
> + - compatible: should be "samsung,exynos-ohci" for USB 2.0
> +   OHCI companion controller in host mode.
> + - reg: physical base address of the controller and length of memory mapped
> +   region.
> + - interrupts: interrupt number to the cpu.
> +
> +Example:
> +	ohci {
> +		compatible = "samsung,exynos-ohci";
> +		reg = <0x12120000 0x100>;
> +		interrupts = <0 71 0>;
> +	};
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 73ea844..bcdfbe2 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -224,6 +224,12 @@
>  		interrupts = <0 71 0>;
>  	};
> 
> +	ohci {
> +		compatible = "samsung,exynos-ohci";
> +		reg = <0x12120000 0x100>;
> +		interrupts = <0 71 0>;
> +	};
> +
>  	amba {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
> index 825fe40..cfede1f 100644
> --- a/arch/arm/mach-exynos/include/mach/map.h
> +++ b/arch/arm/mach-exynos/include/mach/map.h
> @@ -196,6 +196,7 @@
>  #define EXYNOS4_PA_OHCI			0x12590000
>  #define EXYNOS4_PA_HSPHY		0x125B0000
>  #define EXYNOS5_PA_EHCI			0x12110000
> +#define EXYNOS5_PA_OHCI			0x12120000
>  #define EXYNOS4_PA_MFC			0x13400000
> 
>  #define EXYNOS4_PA_UART			0x13800000
> diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
> index 6d950d7b..e6c2144 100644
> --- a/arch/arm/mach-exynos/mach-exynos5-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
> @@ -74,6 +74,8 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
>  				"exynos-gsc.3", NULL),
>  	OF_DEV_AUXDATA("samsung,exynos-ehci", EXYNOS5_PA_EHCI,
>  					"s5p-ehci", NULL),
> +	OF_DEV_AUXDATA("samsung,exynos-ohci", EXYNOS5_PA_OHCI,
> +					"exynos-ohci", NULL),
>  	{},
>  };
> 
> --
> 1.7.6.5
