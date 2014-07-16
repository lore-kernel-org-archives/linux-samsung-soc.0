From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2] ARM: EXYNOS: Fix build with PM_SLEEP=n
Date: Wed, 16 Jul 2014 13:59:32 +0200
Message-ID: <53C66924.3010303@samsung.com>
References: <1405323953-25954-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:56317 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758523AbaGPMAM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Jul 2014 08:00:12 -0400
In-reply-to: <1405323953-25954-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sachin Kamat <sachin.kamat@samsung.com>, Olof Johansson <olof@lixom.net>

Hi Krzysztof,

On 14.07.2014 09:45, Krzysztof Kozlowski wrote:
> Fix building of exynos defconfig with disabled PM_SLEEP:
> CONFIG_PM_SLEEP=n
> CONFIG_PM_SLEEP_SMP=n
> CONFIG_SUSPEND=n
> by moving functions for power up/down of CPU and cluster to platsmp.c
> 
> The build error messages:
> arch/arm/mach-exynos/built-in.o: In function `exynos_boot_secondary':
> arch/arm/mach-exynos/platsmp.c:111: undefined reference to `exynos_cpu_power_state'
> arch/arm/mach-exynos/platsmp.c:112: undefined reference to `exynos_cpu_power_up'
> arch/arm/mach-exynos/platsmp.c:116: undefined reference to `exynos_cpu_power_state'
> make: *** [vmlinux] Error 1
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
> ---
> Changes since v1:
> 1. Use different solution - just move the power up/down functions to a
>    common place instead of adding stubs in common.h. Suggested by Tomasz
>    Figa.
> ---
>  arch/arm/mach-exynos/platsmp.c | 66 ++++++++++++++++++++++++++++++++++++++++++
>  arch/arm/mach-exynos/pm.c      | 66 ------------------------------------------
>  2 files changed, 66 insertions(+), 66 deletions(-)
> 

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

--
Best regards,
Tomasz
