From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 01/12] ARM: SAMSUNG: local regs-srom header in mach-exynos
Date: Tue, 28 Jul 2015 09:40:50 +0900
Message-ID: <55B6CF92.8050904@samsung.com>
References: <013a01d0c87c$854d4d00$8fe7e700$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:12880 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753190AbbG1Akx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Jul 2015 20:40:53 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NS6006IA9W39H70@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 28 Jul 2015 01:40:51 +0100 (BST)
In-reply-to: <013a01d0c87c$854d4d00$8fe7e700$@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org

On 27.07.2015 23:57, Kukjin Kim wrote:
> 
> This patch moves regs-srom header file into mach-exynos.

Hi,

Minor nits:
1. Could you trim it and remove unnecessary empty line before description?
2. Could you answer in commit message: Why? Why are you moving the headers?


> 
> c: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Malformed "Cc:" tag.

Best regards,
Krzysztof

> Signed-off-by: Kukjin Kim <kgene@kernel.org>
> ---
>  arch/arm/{plat-samsung/include/plat => mach-exynos}/regs-srom.h | 3 +--
>  arch/arm/mach-exynos/suspend.c                                  | 4 ++--
>  2 files changed, 3 insertions(+), 4 deletions(-)
>  rename arch/arm/{plat-samsung/include/plat => mach-exynos}/regs-srom.h (96%)
> 
> diff --git a/arch/arm/plat-samsung/include/plat/regs-srom.h b/arch/arm/mach-exynos/regs-srom.h
> similarity index 96%
> rename from arch/arm/plat-samsung/include/plat/regs-srom.h
> rename to arch/arm/mach-exynos/regs-srom.h
> index 9b6729c..5c4d442 100644
> --- a/arch/arm/plat-samsung/include/plat/regs-srom.h
> +++ b/arch/arm/mach-exynos/regs-srom.h
> @@ -1,5 +1,4 @@
> -/* linux/arch/arm/plat-samsung/include/plat/regs-srom.h
> - *
> +/*
>   * Copyright (c) 2010 Samsung Electronics Co., Ltd.
>   *		http://www.samsung.com
>   *
> diff --git a/arch/arm/mach-exynos/suspend.c b/arch/arm/mach-exynos/suspend.c
> index c506f8e..e00eb39 100644
> --- a/arch/arm/mach-exynos/suspend.c
> +++ b/arch/arm/mach-exynos/suspend.c
> @@ -32,11 +32,11 @@
>  #include <asm/suspend.h>
>  
>  #include <plat/pm-common.h>
> -#include <plat/regs-srom.h>
>  
>  #include "common.h"
> -#include "regs-pmu.h"
>  #include "exynos-pmu.h"
> +#include "regs-pmu.h"
> +#include "regs-srom.h"
>  
>  #define REG_TABLE_END (-1U)
>  
> 
