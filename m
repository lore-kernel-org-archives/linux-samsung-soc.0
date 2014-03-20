From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2 5/6] ARM: s3c64xx: Fix incorrect selection of PM-related
 symbols
Date: Fri, 21 Mar 2014 03:20:09 +0900
Message-ID: <532B3159.60609@samsung.com>
References: <1395162964-5916-1-git-send-email-t.figa@samsung.com> <1395162964-5916-5-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f45.google.com ([209.85.160.45]:46495 "EHLO
	mail-pb0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755533AbaCTSUP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Mar 2014 14:20:15 -0400
Received: by mail-pb0-f45.google.com with SMTP id uo5so1315115pbc.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Mar 2014 11:20:14 -0700 (PDT)
In-Reply-To: <1395162964-5916-5-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@linaro.org>, linaro-kernel@lists.linaro.org, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org

On 03/19/14 02:16, Tomasz Figa wrote:
> This patch modifies ARCH_S3C64XX Kconfig entry to select
> SAMSUNG_WAKEMASK and PM_GENERIC_DOMAINS conditionally if PM_SLEEP and
> PM_RUNTIME are enabled respectively to avoid introducing unmet
> dependenies such as
>
> warning: (ARCH_S3C64XX&&  S3C2412_PM&&  CPU_S5P6440&&  CPU_S5P6450)
> selects SAMSUNG_WAKEMASK which has unmet direct dependencies
> (PLAT_SAMSUNG&&  PM)
>
> warning: (ARCH_S3C64XX&&  ARCH_EXYNOS4&&  SOC_EXYNOS5250&&
> SOC_EXYNOS5420) selects PM_GENERIC_DOMAINS which has unmet direct
> dependencies (PM)
>
> and related compilation errors, when PM_SLEEP or PM_RUNTIME is not
> enabled.
>
> Signed-off-by: Tomasz Figa<t.figa@samsung.com>
> ---
>   arch/arm/Kconfig | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index afc751f..0608177 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -757,11 +757,11 @@ config ARCH_S3C64XX
>   	select HAVE_TCM
>   	select NO_IOPORT_MAP
>   	select PLAT_SAMSUNG
> -	select PM_GENERIC_DOMAINS
> +	select PM_GENERIC_DOMAINS if PM_RUNTIME
>   	select S3C_DEV_NAND
>   	select S3C_GPIO_TRACK
>   	select SAMSUNG_ATAGS
> -	select SAMSUNG_WAKEMASK
> +	select SAMSUNG_WAKEMASK if PM_SLEEP
>   	select SAMSUNG_WDT_RESET
>   	help
>   	  Samsung S3C64XX series based systems

Applied, thanks.

- Kukjin
