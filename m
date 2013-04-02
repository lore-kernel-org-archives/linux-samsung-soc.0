From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S3C64XX: remove obsolete Makefile line
Date: Tue, 02 Apr 2013 18:55:08 +0900
Message-ID: <237a01ce2f88$28edbd90$7ac938b0$%kim@samsung.com>
References: <1364597502.1345.103.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:60512 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760676Ab3DBJzK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Apr 2013 05:55:10 -0400
In-reply-to: <1364597502.1345.103.camel@x61.thuisdomein>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Paul Bolle' <pebolle@tiscali.nl>, 'Ben Dooks' <ben-linux@fluff.org>, 'Russell King' <linux@arm.linux.org.uk>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Paul Bolle wrote:
> 
> Commit a07613a54d700a974f3a4a657da78ef5d097315d ("Merge branch
> 'samsung/dt' into samsung/cleanup") added this line to
> arch/arm/mach-s3c64xx/Makefile:
>     obj-$(CONFIG_S3C64XX_DEV_SPI)	+= dev-spi.o
> 
> But at that time CONFIG_S3C64XX_DEV_SPI wasn't a valid Kconfig macro
> anymore and arch/arm/mach-s3c64xx/dev-spi.c was already removed. So we
> can remove this line.
> 
Yes, the dev-spi.c has been removed with Consolidation work of SPI platform devices.

> Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
> ---
> Untested.
> 
>  arch/arm/mach-s3c64xx/Makefile | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/mach-s3c64xx/Makefile b/arch/arm/mach-
> s3c64xx/Makefile
> index f9ce1dc..31d0c91 100644
> --- a/arch/arm/mach-s3c64xx/Makefile
> +++ b/arch/arm/mach-s3c64xx/Makefile
> @@ -32,7 +32,6 @@ obj-$(CONFIG_S3C64XX_DMA)	+= dma.o
> 
>  obj-y				+= dev-uart.o
>  obj-y				+= dev-audio.o
> -obj-$(CONFIG_S3C64XX_DEV_SPI)	+= dev-spi.o
> 
>  # Device setup
> 
> --
> 1.7.11.7
> 
Looks OK to me, applied.

Thanks.

- Kukjin
