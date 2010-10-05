From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/7] ARM: S5PC210: Universal OneNAND support
Date: Tue, 05 Oct 2010 18:23:19 +0900
Message-ID: <003001cb646f$0f492370$2ddb6a50$%kim@samsung.com>
References: <20100930044822.GA16897@july>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:42355 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932314Ab0JEJYG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Oct 2010 05:24:06 -0400
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9T00L638RM1780@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Oct 2010 18:23:46 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9T00HS88RMRA@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Oct 2010 18:23:46 +0900 (KST)
In-reply-to: <20100930044822.GA16897@july>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>, linux-arm-kernel@lists.infradead.org
Cc: ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

Kyungmin Park wrote:
> 
> From: Kyungmin Park <kyungmin.park@samsung.com>
> 
> OneNAND device support for Universal board.
> 
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-s5pv310/Kconfig               |    1 +
>  arch/arm/mach-s5pv310/mach-universal_c210.c |    2 ++
>  2 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv310/Kconfig b/arch/arm/mach-s5pv310/Kconfig
> index 9941852..178eab9 100644
> --- a/arch/arm/mach-s5pv310/Kconfig
> +++ b/arch/arm/mach-s5pv310/Kconfig
> @@ -40,6 +40,7 @@ config MACH_SMDKC210
>  config MACH_UNIVERSAL_C210
>  	bool "Mobile UNIVERSAL_C210 Board"
>  	select CPU_S5PV310
> +	select S5P_DEV_ONENAND
>  	help
>  	  Machine support for Samsung Mobile Universal S5PC210 Reference
>  	  Board. S5PC210(MCP) is one of package option of S5PV310
> diff --git a/arch/arm/mach-s5pv310/mach-universal_c210.c b/arch/arm/mach-
> s5pv310/mach-universal_c210.c
> index b57efae..e169849 100644
> --- a/arch/arm/mach-s5pv310/mach-universal_c210.c
> +++ b/arch/arm/mach-s5pv310/mach-universal_c210.c
> @@ -20,6 +20,7 @@
>  #include <plat/regs-serial.h>
>  #include <plat/s5pv310.h>
>  #include <plat/cpu.h>
> +#include <plat/devs.h>
> 
>  #include <mach/map.h>
> 
> @@ -117,6 +118,7 @@ static struct platform_device universal_gpio_keys = {
> 
>  static struct platform_device *universal_devices[] __initdata = {
>  	&universal_gpio_keys,
> +	&s5p_device_onenand,
>  };
> 
>  static void __init universal_map_io(void)
> --

Ok...will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
