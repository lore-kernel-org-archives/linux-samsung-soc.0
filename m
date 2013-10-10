From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ARM: SAMSUNG: Remove unused s5p_device_ehci
Date: Thu, 10 Oct 2013 11:25:38 +0900
Message-ID: <52561022.603@samsung.com>
References: <000001cec55c$b70f0100$252d0300$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:22080 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751318Ab3JJCZn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Oct 2013 22:25:43 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MUF00C6ELES5290@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Oct 2013 03:25:41 +0100 (BST)
In-reply-to: <000001cec55c$b70f0100$252d0300$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org

Hi,

On 10/10/2013 11:02 AM, Jingoo Han wrote:
> Since commit ca91435 "ARM: EXYNOS: Remove unused board files",
> s5p_device_ehci is not used anymore. Thus, s5p_device_ehci can
> be removed. Also, unnecessary S5P_DEV_USB_EHCI option is removed.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

> diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
> index 8ce0ac0..25f40c9 100644
> --- a/arch/arm/plat-samsung/devs.c
> +++ b/arch/arm/plat-samsung/devs.c
> @@ -49,7 +49,6 @@
>  #include <plat/devs.h>
>  #include <plat/adc.h>
>  #include <linux/platform_data/ata-samsung_cf.h>
> -#include <linux/platform_data/usb-ehci-s5p.h>

Are you planning to remove also this file altogether ? Probably the
s5p-ehci driver could be cleaned up then and the platform_data handling
dropped from it as a follow up.

Thanks,
Sylwester
