From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/3] ARM: EXYNOS: Move code from hotplug.c to platsmp.c
Date: Thu, 17 Jul 2014 15:15:52 +0200
Message-ID: <53C7CC88.5040707@samsung.com>
References: <1405520417-15027-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:9175 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932322AbaGQNQc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jul 2014 09:16:32 -0400
In-reply-to: <1405520417-15027-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi Krzysztof,

On 16.07.2014 16:20, Krzysztof Kozlowski wrote:
> Cleanup a little the SMP/hotplug code for Exynos by:
> 1. Moving completely all functions from hotplug.c into the platsmp.c;
> 2. Deleting the hotplug.c file.
> 
> After recent cleanups (e.g. 75ad2ab28f0f "ARM: EXYNOS: use
> v7_exit_coherency_flush macro for cache disabling") there was only CPU
> power down related code in hotplug.c file. Keeping this file does not
> give any benefits.
> 
> The commit only moves code around with one additional observable change:
> the hotplug.c was compiled with custom CFLAGS (-march=armv7-a). These
> CFLAGS are not necessary any more.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  arch/arm/mach-exynos/Makefile  |  3 --
>  arch/arm/mach-exynos/common.h  |  2 -
>  arch/arm/mach-exynos/hotplug.c | 92 ------------------------------------------
>  arch/arm/mach-exynos/platsmp.c | 74 +++++++++++++++++++++++++++++++++
>  4 files changed, 74 insertions(+), 97 deletions(-)
>  delete mode 100644 arch/arm/mach-exynos/hotplug.c
> 

For this and remaining patches from this series:

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

--
Best regards,
Tomasz
