From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 13/15] ARM: Samsung: Move external interrupts support from
	plat-s5pc1xx to plat-s5p
Date: Mon, 17 May 2010 22:28:49 +0900
Message-ID: <004a01caf5c4$e5aebe30$b10c3a90$%kim@samsung.com>
References: <1273817946-29404-1-git-send-email-m.szyprowski@samsung.com>
 <1273817946-29404-14-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout5.samsung.com ([203.254.224.35]:64520 "EHLO
	mailout5.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751735Ab0EQN2z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 May 2010 09:28:55 -0400
Received: from epmmp1 (mailout5.samsung.com [203.254.224.35])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L2K00A6TG45XN@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 May 2010 22:28:53 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L2K002FMG44GW@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 May 2010 22:28:53 +0900 (KST)
In-reply-to: <1273817946-29404-14-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.org

Marek Szyprowski wrote:
> 
> This patch moves external interrupts support code from plat-s5pc1xx to
> plat-s5p and enables support for it on ARCH_S5PC100. This code can be
easily
> reused by S5PV210/S5PC110 and probably S5P6442.

Already merged EINT patch for S5P to Ben's for-2635/s5p-general.
So please re-make based on it.

> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-s5pc100/Kconfig                  |    1 +
>  arch/arm/mach-s5pc100/gpio.c                   |    8 ++--
>  arch/arm/mach-s5pc100/include/mach/gpio.h      |    8 +++
>  arch/arm/plat-s5p/Kconfig                      |    5 ++
>  arch/arm/plat-s5p/Makefile                     |    1 +
>  arch/arm/plat-s5p/include/plat/gpio-ext.h      |   44 ++++++++++++++++++
>  arch/arm/{plat-s5pc1xx => plat-s5p}/irq-eint.c |   57
++++++++++++------------
>  arch/arm/plat-s5pc1xx/include/plat/gpio-ext.h  |   44 ------------------
>  8 files changed, 92 insertions(+), 76 deletions(-)
>  create mode 100644 arch/arm/plat-s5p/include/plat/gpio-ext.h
>  rename arch/arm/{plat-s5pc1xx => plat-s5p}/irq-eint.c (80%)
>  delete mode 100644 arch/arm/plat-s5pc1xx/include/plat/gpio-ext.h
> 

(snip)


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
