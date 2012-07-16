From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 0/2] ARM: EXYNOS: G2D clock support to Exynos4
Date: Tue, 17 Jul 2012 08:24:24 +0900
Message-ID: <143f01cd63aa$233294c0$6997be40$%kim@samsung.com>
References: <1342415220-15497-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:16216 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750932Ab2GPXY0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Jul 2012 19:24:26 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7A00BBH10GM390@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Jul 2012 08:24:24 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M7A0080G10O7Z80@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Jul 2012 08:24:24 +0900 (KST)
In-reply-to: <1342415220-15497-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Sachin Kamat wrote:
> 
> This patch series moves the SoC specific G2D clock entries from common
> clock-
> file (clock-exynos4.c) to Exynos4210 specific clock file (clock-
> exynos4210.c)
> since G2D clock registers are different in Exynos4210 and Exynos4X12 SoCs
> and adds support for Exynos4x12 G2D clock.
> 
> Changes since v1:
> Incorporated Kukjin's comments to use exynos4210/4x12 in structure names
> instead of exynos4 for better clarity.
> 
> This series is based on Kukjin Kim's latest next/devel-samsung branch.
> 
> Sachin Kamat (2):
>   ARM: EXYNOS: Move G2D clock entries to clock-exynos4210.c file
>   ARM: EXYNOS: Add G2D related clock entries for SMDK4X12
> 
>  arch/arm/mach-exynos/clock-exynos4.c    |   41
+---------------------------
> --
>  arch/arm/mach-exynos/clock-exynos4.h    |    3 ++
>  arch/arm/mach-exynos/clock-exynos4210.c |   37
> ++++++++++++++++++++++++++++
>  arch/arm/mach-exynos/clock-exynos4212.c |   41
> +++++++++++++++++++++++++++++-
>  4 files changed, 81 insertions(+), 41 deletions(-)
> 
> --
> 1.7.4.1

Looks OK to me, will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
