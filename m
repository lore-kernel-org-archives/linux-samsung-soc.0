From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH V3 4/6] ARM: S5P64X0: Modified files for SPI consolidation
 work
Date: Wed, 14 Dec 2011 12:03:10 +0530
Message-ID: <4EE84326.6030903@linaro.org>
References: <1323875763-21197-1-git-send-email-padma.v@samsung.com> <1323875763-21197-5-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:49760 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752388Ab1LNGdR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Dec 2011 01:33:17 -0500
Received: by iaeh11 with SMTP id h11so758696iae.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Dec 2011 22:33:17 -0800 (PST)
In-Reply-To: <1323875763-21197-5-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: padma.kvr@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org, linux@arm.linux.org.uk, broonie@opensource.wolfsonmicro.com

On 12/14/2011 08:46 PM, Padmavathi Venna wrote:
> As SPI platform devices are consolidated to plat-samsung, some
> corresponding changes are required in the respective machine folder.
> Added SPI Setup file for GPIO configurations and platform data
> initialization.
>
> Signed-off-by: Padmavathi Venna<padma.v@samsung.com>
> ---
>   arch/arm/mach-s5p64x0/Kconfig            |    7 +++-
>   arch/arm/mach-s5p64x0/Makefile           |    1 +
>   arch/arm/mach-s5p64x0/include/mach/map.h |    3 ++
>   arch/arm/mach-s5p64x0/setup-spi.c        |   55 ++++++++++++++++++++++++++++++
>   4 files changed, 64 insertions(+), 2 deletions(-)
>   create mode 100644 arch/arm/mach-s5p64x0/setup-spi.c
>
[snip]
> diff --git a/arch/arm/mach-s5p64x0/include/mach/map.h b/arch/arm/mach-s5p64x0/include/mach/map.h
> index 4d3ac8a..c6af0fc 100644
> --- a/arch/arm/mach-s5p64x0/include/mach/map.h
> +++ b/arch/arm/mach-s5p64x0/include/mach/map.h
> @@ -67,6 +67,8 @@
>   #define S3C_PA_RTC		S5P64X0_PA_RTC
>   #define S3C_PA_WDT		S5P64X0_PA_WDT
>   #define S3C_PA_FB		S5P64X0_PA_FB
> +#define S3C_PA_SPI0		S5P64X0_PA_SPI0
> +#define S3C_PA_SPI1		S5P64X0_PA_SPI1
>
>   #define S5P_PA_CHIPID		S5P64X0_PA_CHIPID
>   #define S5P_PA_SROMC		S5P64X0_PA_SROMC
> @@ -75,6 +77,7 @@
>
>   #define SAMSUNG_PA_ADC		S5P64X0_PA_ADC
>
> +

Unncessary insertion of line.

-- 
Tushar Behera
