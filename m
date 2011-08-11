From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: Samsung: fix watchdog reset issue with clk_get()
Date: Thu, 11 Aug 2011 20:31:19 +0900
Message-ID: <017001cc581a$32b44250$981cc6f0$%kim@samsung.com>
References: <1312809732-7770-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:29976 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754536Ab1HKLbZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Aug 2011 07:31:25 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LPR00DL3HCBXM60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Aug 2011 20:31:23 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LPR00ENXHCB1M@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Aug 2011 20:31:23 +0900 (KST)
In-reply-to: <1312809732-7770-1-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Angus Ainslie' <angus.ainslie@linaro.org>

Marek Szyprowski wrote:
> 
> clkdev framework uses global mutex to protect clock tree, so it is not
> possible to call clk_get() in interrupt context. This patch fixes this
> issue and makes system reset by watchdog call working again.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos4/clock.c                      |    1 +
>  arch/arm/mach-s3c2412/clock.c                      |    1 +
>  arch/arm/mach-s3c2416/clock.c                      |    2 +-
>  arch/arm/mach-s3c2443/clock.c                      |    1 +
>  arch/arm/mach-s3c64xx/clock.c                      |    1 +
>  arch/arm/mach-s5p64x0/cpu.c                        |    2 ++
>  arch/arm/mach-s5pc100/clock.c                      |    1 +
>  arch/arm/mach-s5pv210/clock.c                      |    1 +
>  arch/arm/plat-s3c24xx/s3c2410-clock.c              |    1 +
>  arch/arm/plat-samsung/clock.c                      |    9 +++++++++
>  arch/arm/plat-samsung/include/plat/clock.h         |    2 ++
>  .../arm/plat-samsung/include/plat/watchdog-reset.h |   10 +++-------
>  12 files changed, 24 insertions(+), 8 deletions(-)
> 

(snip)

> +void s3c_wdt_reset_init(void)
+void __init s3c_wdt_reset_init(void)

(snip)

> +extern void s3c_wdt_reset_init(void);
+extern void __init s3c_wdt_reset_init(void);

(snip)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
