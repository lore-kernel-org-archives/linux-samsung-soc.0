From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 2/3] ARM: EXYNOS: Fix support of Exynos4210 rev0 SoC
Date: Mon, 22 Apr 2013 23:10:34 +0200
Message-ID: <201304222310.34775.arnd@arndb.de>
References: <1366036922-4103-1-git-send-email-t.figa@samsung.com> <1366036922-4103-3-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:50166 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752661Ab3DVVKs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Apr 2013 17:10:48 -0400
In-Reply-To: <1366036922-4103-3-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, thomas.abraham@linaro.org

On Monday 15 April 2013, Tomasz Figa wrote:
> This patch extends exynos_init_time() function to handle Exynos4210 rev0
> SoC, which differs in availability of system timers and needs different
> clocksource initialization.
> 
> This makes it possible to use exynos_init_time() function as init_time
> callback for all Exynos-based boards, including Universal_C210, which
> originally had to use samsung_timer_init().
> 
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

Note that it would be helpful to mention here that this is required for
the calling samsung_timer_init from the exynos4-dt.c file.

	Arnd
