From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] ARM: EXYNOS: Fix support of Exynos4210 rev0 SoC
Date: Mon, 20 May 2013 21:58:37 +0200
Message-ID: <1623377.nVo7nUcid2@flatron>
References: <1368630484-29939-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f178.google.com ([209.85.215.178]:60812 "EHLO
	mail-ea0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757932Ab3ETT6l (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 May 2013 15:58:41 -0400
Received: by mail-ea0-f178.google.com with SMTP id q16so4186558ead.23
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 May 2013 12:58:40 -0700 (PDT)
In-Reply-To: <1368630484-29939-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, arnd@arndb.de, Kyungmin Park <kyungmin.park@samsung.com>, olof@lixom.net

Hi Kukjin,

On Wednesday 15 of May 2013 17:08:04 Tomasz Figa wrote:
> This patch extends exynos_init_time() function to handle Exynos4210 rev0
> SoC, which differs in availability of system timers and needs different
> clocksource initialization.
> 
> This makes it possible to use exynos_init_time() function as init_time
> callback for all Exynos-based boards, including Universal_C210, which
> originally had to use samsung_timer_init().
> 
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos/Kconfig               |  3 ++-
>  arch/arm/mach-exynos/common.c              | 30
> +++++++++++++++++++++++++++++- arch/arm/mach-exynos/common.h           
>   |  2 ++
>  arch/arm/mach-exynos/mach-universal_c210.c |  5 ++---
>  4 files changed, 35 insertions(+), 5 deletions(-)

Could you pick this patch to your fixes branch?

This is a fix of a regression in handling Exynos4210 rev0 SoC (e.g. 
Universal C210 board) introduced by patches merged to 3.10.

Best regards,
Tomasz
