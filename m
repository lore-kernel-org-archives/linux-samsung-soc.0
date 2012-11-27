From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: Exynos: Remove unused regs-mem.h file
Date: Tue, 27 Nov 2012 09:53:44 +0900
Message-ID: <15ca01cdcc39$a68f6530$f3ae2f90$%kim@samsung.com>
References: <1353916313-14343-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:44726 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757624Ab2K0Axp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Nov 2012 19:53:45 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0ME400M85FPMVPC0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Nov 2012 09:53:44 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0ME4006S0FTKJS70@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Nov 2012 09:53:44 +0900 (KST)
In-reply-to: <1353916313-14343-1-git-send-email-thomas.abraham@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

Thomas Abraham wrote:
> 
> Remove the unused regs-mem.h file
> 
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
>  arch/arm/mach-exynos/include/mach/regs-mem.h |   23
----------------------
> -
>  1 files changed, 0 insertions(+), 23 deletions(-)
>  delete mode 100644 arch/arm/mach-exynos/include/mach/regs-mem.h
> 
> diff --git a/arch/arm/mach-exynos/include/mach/regs-mem.h b/arch/arm/mach-
> exynos/include/mach/regs-mem.h
> deleted file mode 100644
> index 0368b5a..0000000
> --- a/arch/arm/mach-exynos/include/mach/regs-mem.h
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -/* linux/arch/arm/mach-exynos4/include/mach/regs-mem.h
> - *
> - * Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
> - *		http://www.samsung.com
> - *
> - * EXYNOS4 - SROMC and DMC register definitions
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
> -*/
> -
> -#ifndef __ASM_ARCH_REGS_MEM_H
> -#define __ASM_ARCH_REGS_MEM_H __FILE__
> -
> -#include <mach/map.h>
> -
> -#define S5P_DMC0_MEMCON_OFFSET		0x04
> -
> -#define S5P_DMC0_MEMTYPE_SHIFT		8
> -#define S5P_DMC0_MEMTYPE_MASK		0xF
> -
> -#endif /* __ASM_ARCH_REGS_MEM_H */
> --
> 1.6.6.rc2

OK, applied.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
