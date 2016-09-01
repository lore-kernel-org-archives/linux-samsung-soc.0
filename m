From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [RESEND PATCH 2/3] ARM: dts: add TOPEET itop elite based board
Date: Thu, 01 Sep 2016 15:07:03 +0200
Message-ID: <6405623.At7R6O470M@amdc1976>
References: <750b6941-7d22-971e-84c9-996deab9a7c1@kernel.org>
 <1472648361-3871-1-git-send-email-ayaka@soulik.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1472648361-3871-1-git-send-email-ayaka@soulik.info>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Li <ayaka@soulik.info>
Cc: devicetree@vger.kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, kgene@kernel.org, krzk@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


Hi,

On Wednesday, August 31, 2016 08:59:21 PM Randy Li wrote:
> The TOPEET itop exynos 4412 have three versions base board. The
> Elite version is the cheap one without too much peripheral devices
> on it.
> 
> Currently supported are serial console, wired networking(USB),
> USB OTG in peripheral mode, USB host, SD storage, GPIO buttons,
> PWM beeper, ADC and LEDs. The WM8960 analog audio codec is also
> enabled.
> 
> The FIMC is not used for camera currently, I enabled it just for a
> colorspace convertor.
> 
> Signed-off-by: Randy Li <ayaka@soulik.info>

[...]

> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -135,6 +135,7 @@ dtb-$(CONFIG_ARCH_EXYNOS4) += \
>  	exynos4412-origen.dtb \
>  	exynos4412-smdk4412.dtb \
>  	exynos4412-tiny4412.dtb \
> +	exynos4412-itop-elite.dtb \

Minor nit:

Please keep dtb files in alphabetical order.

>  	exynos4412-trats2.dtb
>  dtb-$(CONFIG_ARCH_EXYNOS5) += \
>  	exynos5250-arndale.dtb \

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
