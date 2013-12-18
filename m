From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 2/2] ARM: EXYNOS: Add CMU virtual addresses for exynos5260
Date: Wed, 18 Dec 2013 17:37:23 +0100
Message-ID: <2468420.340ZhVlqCl@amdc1227>
References: <1386758416-31065-1-git-send-email-vikas.sajjan@linaro.org>
 <1386758416-31065-3-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:21387 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754345Ab3LRQhl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Dec 2013 11:37:41 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MY000HI9GUR0620@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 Dec 2013 16:37:39 +0000 (GMT)
In-reply-to: <1386758416-31065-3-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org, linux-arm-kernel@lists.infradead.org, joshi@samsung.com

Hi Vikas, Young-Gun,

On Wednesday 11 of December 2013 16:25:16 Vikas Sajjan wrote:
> From: Young-Gun Jang <yg1004.jang@samsung.com>
> 
> Adds CMU virtual addresses for exynos5260.
> 
> Change-Id: Ia4f4eda96187d8d9e1edfc1a6b025af56d3bc43e

This line should be dropped.

> Signed-off-by: Young-Gun Jang <yg1004.jang@samsung.com>
> Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
> ---
>  arch/arm/mach-exynos/common.c                  | 65 ++++++++++++++++++++++++++
>  arch/arm/mach-exynos/include/mach/map.h        | 14 ++++++
>  arch/arm/mach-exynos/include/mach/regs-clock.h | 17 +++++++
>  arch/arm/plat-samsung/include/plat/map-s5p.h   | 16 +++++++
>  4 files changed, 112 insertions(+)

Why do you need those static mappings? Unless there is a reason to map
those registers very early (before ioremap() and friends are available)
I'm going to NAK any additions of static mappings.

Best regards,
Tomasz
