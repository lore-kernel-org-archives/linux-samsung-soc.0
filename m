From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5PV210: Fix sysdev related warning messages
Date: Wed, 17 Nov 2010 16:41:09 +0900
Message-ID: <00cd01cb862a$cee84cb0$6cb8e610$%kim@samsung.com>
References: <1289974882-14711-1-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:55263 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759806Ab0KQHkv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Nov 2010 02:40:51 -0500
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LC0009AJQNXW340@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 17 Nov 2010 16:40:45 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LC000BIVQNXIZ@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 17 Nov 2010 16:40:45 +0900 (KST)
In-reply-to: <1289974882-14711-1-git-send-email-sbkim73@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sangbeom Kim' <sbkim73@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, 'Abhilash Kesavan' <a.kesavan@samsung.com>

Sangbeom Kim wrote:
> 
> From: Abhilash Kesavan <a.kesavan@samsung.com>
> 
> This patch fixes following warning messages when CONFIG_PM selected.
> 
> In file included from arch/arm/mach-s5pv210/mach-smdkv210.c:34:
> arch/arm/plat-samsung/include/plat/pm.h:104: warning: 'struct sys_device'
> declared inside parameter list
> arch/arm/plat-samsung/include/plat/pm.h:104: warning: its scope is only
this
> definition or declaration, which is probably not what you want
> arch/arm/plat-samsung/include/plat/pm.h:105: warning: 'struct sys_device'
> declared inside parameter list
> 
> In file included from arch/arm/mach-s5pv210/mach-smdkc110.c:31:
> arch/arm/plat-samsung/include/plat/pm.h:104: warning: 'struct sys_device'
> declared inside parameter list
> arch/arm/plat-samsung/include/plat/pm.h:104: warning: its scope is only
this
> definition or declaration, which is probably not what you want
> arch/arm/plat-samsung/include/plat/pm.h:105: warning: 'struct sys_device'
> declared inside parameter list
> arch/arm/plat-samsung/pm.c:217: warning: 's3c_pm_show_resume_irqs' defined
> but not used
> 
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
> ---
>  arch/arm/mach-s5pv210/mach-smdkc110.c |    1 +
>  arch/arm/mach-s5pv210/mach-smdkv210.c |    1 +
>  2 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/mach-smdkc110.c b/arch/arm/mach-
> s5pv210/mach-smdkc110.c
> index 0ad7924..5dd1681 100644
> --- a/arch/arm/mach-s5pv210/mach-smdkc110.c
> +++ b/arch/arm/mach-s5pv210/mach-smdkc110.c
> @@ -13,6 +13,7 @@
>  #include <linux/init.h>
>  #include <linux/serial_core.h>
>  #include <linux/i2c.h>
> +#include <linux/sysdev.h>
> 
>  #include <asm/mach/arch.h>
>  #include <asm/mach/map.h>
> diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-
> s5pv210/mach-smdkv210.c
> index bcd7a5d..1fbc45b 100644
> --- a/arch/arm/mach-s5pv210/mach-smdkv210.c
> +++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
> @@ -13,6 +13,7 @@
>  #include <linux/i2c.h>
>  #include <linux/init.h>
>  #include <linux/serial_core.h>
> +#include <linux/sysdev.h>
> 
>  #include <asm/mach/arch.h>
>  #include <asm/mach/map.h>
> --
Ok..will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
