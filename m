From: Ben Dooks <ben@simtec.co.uk>
Subject: Re: [PATCH 3/5] ARM: S5P6440: Add RTC support for S5P6440
Date: Wed, 28 Jul 2010 19:13:59 +0100
Message-ID: <4C507367.1000206@simtec.co.uk>
References: <1279702814-14929-1-git-send-email-kgene.kim@samsung.com> <1279702814-14929-4-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hull.simtec.co.uk ([78.105.113.97]:45572 "EHLO
	preston.local.simtec.co.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751954Ab0G1SOT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Jul 2010 14:14:19 -0400
In-Reply-To: <1279702814-14929-4-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, p_gortmaker@yahoo.com, Atul Dahiya <atul.dahiya@samsung.com>, ben-linux@fluff.org, a.zummo@towertech.it

On 21/07/10 10:00, Kukjin Kim wrote:
> From: Atul Dahiya <atul.dahiya@samsung.com>
> 
> This patch adds support RTC driver for Samsung S5P6440.
> 
> Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-s5p6440/Kconfig            |    2 ++
>  arch/arm/mach-s5p6440/include/mach/map.h |    2 +-
>  arch/arm/mach-s5p6440/mach-smdk6440.c    |    1 +
>  3 files changed, 4 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-s5p6440/Kconfig b/arch/arm/mach-s5p6440/Kconfig
> index f066fae..b2d4716 100644
> --- a/arch/arm/mach-s5p6440/Kconfig
> +++ b/arch/arm/mach-s5p6440/Kconfig
> @@ -18,7 +18,9 @@ config MACH_SMDK6440
>  	select CPU_S5P6440
>  	select SAMSUNG_DEV_TS
>  	select SAMSUNG_DEV_ADC
> +	select S3C_DEV_RTC
>  	select S3C_DEV_WDT
> +	select HAVE_S3C_RTC
>  	select HAVE_S3C2410_WATCHDOG
>  	help
>  	  Machine support for the Samsung SMDK6440

I'm considering we shoudl just set HAVE_S3C_RTC for
each SOC, as allowing it to compile isn't going to
end up causing a problem. Adding it to each machine
will end up with large Kconfig entries for each.

-- 
Ben
