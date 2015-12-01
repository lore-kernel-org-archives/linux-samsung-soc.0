From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 03/10] gpio: samsung: move gpio-samsung driver back to
 platform code
Date: Tue, 01 Dec 2015 09:34:18 +0900
Message-ID: <565CEB0A.4090107@samsung.com>
References: <1448467615-447097-1-git-send-email-arnd@arndb.de>
 <1448467615-447097-4-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:12157 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751710AbbLAAeY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Nov 2015 19:34:24 -0500
In-reply-to: <1448467615-447097-4-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Mark Brown <broonie@kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Tomasz Figa <tfiga@chromium.org>, Ben Dooks <ben.dooks@codethink.co.uk>, linux-samsung-soc@vger.kernel.org

On 26.11.2015 01:06, Arnd Bergmann wrote:
> The gpio-samsung driver is special in the sense that it
> interacts directly in multiple ways with the legacy platform
> code for the s3c24xx and s3c64xx platforms. In contrast,
> all devicetree based machines for Samsung, including the
> ones on those two SoC families use a different driver.
> 
> The header files that define the interface between the platform
> code and the gpio driver are not visible when building a
> kernel for ARCH_MULTIPLATFORM, which prevents us from
> turning on this option for s3c64xx.
> 
> To work around this, we now move the driver back into platform
> code, from where it was originally moved to as part of commit
> 1b39d5f2cc5c28 ("gpio/samsung: gpio-samsung.c to support
> Samsung GPIOs").
> 
> The long-term plan for this driver would be to remove it
> entirely, after all Samsung machines have been converted
> over to boot from DT, but there is currently no timeline
> for when that might happen.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/plat-samsung/Kconfig                          | 3 +++
>  arch/arm/plat-samsung/Makefile                         | 2 ++
>  {drivers/gpio => arch/arm/plat-samsung}/gpio-samsung.c | 0
>  drivers/gpio/Kconfig                                   | 7 -------
>  drivers/gpio/Makefile                                  | 1 -
>  5 files changed, 5 insertions(+), 8 deletions(-)
>  rename {drivers/gpio => arch/arm/plat-samsung}/gpio-samsung.c (100%)
> 
> diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
> index 57729b915003..83697414bfa0 100644
> --- a/arch/arm/plat-samsung/Kconfig
> +++ b/arch/arm/plat-samsung/Kconfig
> @@ -294,6 +294,9 @@ config SAMSUNG_WDT_RESET
>  	  Compile support for system restart by triggering watchdog reset.
>  	  Used on SoCs that do not provide dedicated reset control.
>  
> +config GPIO_SAMSUNG
> +	def_bool SAMSUNG_ATAGS
> +

I think this should be put inside "if SAMSUNG_ATAGS" section, just
before SAMSUNG_PM_GPIO (with default=y?). It makes more consistent with
rest of the options depending on ATAGS.

Rest seems fine:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
