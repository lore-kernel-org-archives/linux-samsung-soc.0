From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] arm: exynos4: build is failing due to missing SZ_4K
 definition
Date: Fri, 07 Oct 2011 20:24:01 +0900
Message-ID: <01f801cc84e3$9d5640e0$d802c2a0$%kim@samsung.com>
References: <1317938595-7007-1-git-send-email-angus.ainslie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:63016 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759870Ab1JGLYE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Oct 2011 07:24:04 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSP00MKD0ZZL950@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Oct 2011 20:24:02 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LSP00IC4101N130@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 07 Oct 2011 20:24:01 +0900 (KST)
In-reply-to: <1317938595-7007-1-git-send-email-angus.ainslie@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Angus Ainslie' <angus.ainslie@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, patches@linaro.org

Angus Ainslie wrote:
> 
> linux-next build is failing using the exynos4_defconfig. <asm/sizes.h>
needs to be
> for the SZ_4K definition
> 
> Signed-off-by: Angus Ainslie <angus.ainslie@linaro.org>
> ---
>  arch/arm/mach-exynos4/include/mach/map.h |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/include/mach/map.h b/arch/arm/mach-
> exynos4/include/mach/map.h
> index 918a979..02d68f1 100644
> --- a/arch/arm/mach-exynos4/include/mach/map.h
> +++ b/arch/arm/mach-exynos4/include/mach/map.h
> @@ -13,6 +13,7 @@
>  #ifndef __ASM_ARCH_MAP_H
>  #define __ASM_ARCH_MAP_H __FILE__
> 
> +#include <asm/sizes.h>
>  #include <plat/map-base.h>
> 
>  /*
> --
> 1.7.4.1

Hi Angus,

I'm not sure why to add <asm/sizes.h> in mach/map.h is required now because
there was no adding SZ_ here between v3.1-rc1 and current HEAD in my -next.
Maybe if it is required, here is not proper place?......

Since I can't fetch linux-next from
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git, I need
some time. Let me check again with latest linux-next soon.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
