From: Vivek Gautam <gautamvivek1987@gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: Exynos5250: Enabling ohci-exynos driver
Date: Thu, 8 Nov 2012 13:37:45 +0530
Message-ID: <CAFp+6iH20vwDit-=wk=HfPDArjr_Kuoj5AaVgTv_drjjz+23zQ@mail.gmail.com>
References: <1352357665-7435-1-git-send-email-gautam.vivek@samsung.com>
	<1352357665-7435-3-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:33769 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751639Ab2KHIHr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Nov 2012 03:07:47 -0500
In-Reply-To: <1352357665-7435-3-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-usb@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, Jingoo Han <jg1.han@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>

Hi all,

On Thu, Nov 8, 2012 at 12:24 PM, Vivek Gautam <gautam.vivek@samsung.com> wrote:
> Adding OHCI device tree node for Exynos5250 along with
> the device base address.
>
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> Acked-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  .../devicetree/bindings/usb/exynos-usb.txt         |   15 +++++++++++++++
>  arch/arm/boot/dts/exynos5250.dtsi                  |    6 ++++++
>  arch/arm/mach-exynos/include/mach/map.h            |    1 +
>  arch/arm/mach-exynos/mach-exynos5-dt.c             |    2 ++
>  4 files changed, 24 insertions(+), 0 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/usb/exynos-usb.txt b/Documentation/devicetree/bindings/usb/exynos-usb.txt
> index 833f5cf..5ff3def1 100644
> --- a/Documentation/devicetree/bindings/usb/exynos-usb.txt
> +++ b/Documentation/devicetree/bindings/usb/exynos-usb.txt
> @@ -23,3 +23,18 @@ Example:
>                 interrupts = <0 71 0>;
>                 samsung,vbus-gpio = <&gpx2 6 1 3 3>;
>         };
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
> +       usb@12120000 {
> +               compatible = "samsung,exynos-ohci";
> +               reg = <0x12120000 0x100>;
> +               interrupts = <0 71 0>;
> +       };
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 2995445..f18abe0 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -244,6 +244,12 @@
>                 interrupts = <0 71 0>;
>         };
>
> +       usb@12120000 {
> +               compatible = "samsung,exynos-ohci";
> +               reg = <0x12120000 0x100>;
> +               interrupts = <0 71 0>;
> +       };
> +
>         amba {
>                 #address-cells = <1>;
>                 #size-cells = <1>;
> diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
> index 9a86b99..471ffaf 100644
> --- a/arch/arm/mach-exynos/include/mach/map.h
> +++ b/arch/arm/mach-exynos/include/mach/map.h
> @@ -198,6 +198,7 @@
>  #define EXYNOS4_PA_OHCI                        0x12590000
>  #define EXYNOS4_PA_HSPHY               0x125B0000
>  #define EXYNOS5_PA_EHCI                        0x12110000
> +#define EXYNOS5_PA_OHCI                        0x12120000
>  #define EXYNOS4_PA_MFC                 0x13400000
>
>  #define EXYNOS4_PA_UART                        0x13800000
> diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
> index f60994e..6348acb 100644
> --- a/arch/arm/mach-exynos/mach-exynos5-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
> @@ -88,6 +88,8 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
>                                 "exynos5-mixer", NULL),
>         OF_DEV_AUXDATA("samsung,exynos-ehci", EXYNOS5_PA_EHCI,
>                                         "s5p-ehci", NULL),
> +       OF_DEV_AUXDATA("samsung,exynos-ohci", EXYNOS5_PA_OHCI,
> +                                       "exynos-ohci", NULL),
missed the alignment here :-(

>         {},
>  };
>
> --
> 1.7.6.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--
Thanks & Regards
Vivek
