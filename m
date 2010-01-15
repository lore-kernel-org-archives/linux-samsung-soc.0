From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH 2/2] ARM: S5P6440: Add Kconfig and Makefiles for
	S5P6440 GPIO support
Date: Fri, 15 Jan 2010 01:48:16 +0000
Message-ID: <20100115014816.GY3738@trinity.fluff.org>
References: <1263468433-24915-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:52209 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751060Ab0AOBsV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Jan 2010 20:48:21 -0500
Content-Disposition: inline
In-Reply-To: <1263468433-24915-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Thu, Jan 14, 2010 at 08:27:13PM +0900, Kukjin Kim wrote:
> This patch adds the Kconfig and Makefile for the S5P6440 GPIO.

Hi, please merge it into the same patch that adds the files. It is so small
it will not add much to the gpio addition and it means the code will be able
to be built as soon as it added.
 
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-s5p6440/Makefile |    2 +-
>  arch/arm/plat-s5p/Kconfig      |    4 ++++
>  2 files changed, 5 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-s5p6440/Makefile b/arch/arm/mach-s5p6440/Makefile
> index a3ffda9..a79b130 100644
> --- a/arch/arm/mach-s5p6440/Makefile
> +++ b/arch/arm/mach-s5p6440/Makefile
> @@ -12,7 +12,7 @@ obj-				:=
>  
>  # Core support for S5P6440 system
>  
> -obj-$(CONFIG_CPU_S5P6440)	+= cpu.o
> +obj-$(CONFIG_CPU_S5P6440)	+= cpu.o s5p6440-gpio.o
>  
>  # machine support
>  
> diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
> index 7e08b40..9d8686c 100644
> --- a/arch/arm/plat-s5p/Kconfig
> +++ b/arch/arm/plat-s5p/Kconfig
> @@ -14,6 +14,10 @@ config PLAT_S5P
>  	select NO_IOPORT
>  	select ARCH_REQUIRE_GPIOLIB
>  	select S3C_GPIO_TRACK
> +	select SAMSUNG_GPIOLIB
> +	select S3C_GPIO_CFG_S3C64XX
> +	select S3C_GPIO_PULL_UPDOWN
> +	select S3C_GPIO_CFG_S3C24XX
>  	select PLAT_SAMSUNG
>  	select SAMSUNG_CLKSRC
>  	select SAMSUNG_IRQ_VIC_TIMER
> -- 
> 1.6.2.5
> 

-- 
-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
