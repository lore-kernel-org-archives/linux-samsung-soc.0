From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH -next] ARM: EXYNOS: remove duplicated include from common.c
Date: Wed, 13 Mar 2013 14:10:22 +0900
Message-ID: <093201ce1fa9$109a12f0$31ce38d0$%kim@samsung.com>
References: <CAPgLHd9eSiAne_f_8ctbXt8x+ET3v_1o=-gdO1D_11kxx2jo3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:33974 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751353Ab3CMFKY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Mar 2013 01:10:24 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MJL00IEZ2C379M0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 13 Mar 2013 14:10:23 +0900 (KST)
In-reply-to: <CAPgLHd9eSiAne_f_8ctbXt8x+ET3v_1o=-gdO1D_11kxx2jo3g@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Wei Yongjun' <weiyj.lk@gmail.com>, linux@arm.linux.org.uk
Cc: yongjun_wei@trendmicro.com.cn, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Wei Yongjun wrote:
> 
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> Remove duplicated include.
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> ---
>  arch/arm/mach-exynos/common.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
> index d63d399..01e4089 100644
> --- a/arch/arm/mach-exynos/common.c
> +++ b/arch/arm/mach-exynos/common.c
> @@ -23,7 +23,6 @@
>  #include <linux/of_irq.h>
>  #include <linux/export.h>
>  #include <linux/irqdomain.h>
> -#include <linux/irqchip.h>
>  #include <linux/of_address.h>
>  #include <linux/irqchip/arm-gic.h>
> 
Applied, thanks.

- Kukjin
