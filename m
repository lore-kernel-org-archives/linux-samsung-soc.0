From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] ARM: S5P: Add System Timer
Date: Fri, 14 May 2010 18:06:39 +0900
Message-ID: <00b901caf344$c6525290$52f6f7b0$%kim@samsung.com>
References: <1273827090-26635-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:57676 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751499Ab0ENJGo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 May 2010 05:06:44 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L2E00JYPJZ6TM@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 May 2010 18:06:42 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L2E00LT1JZ6WC@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 May 2010 18:06:42 +0900 (KST)
In-reply-to: <1273827090-26635-1-git-send-email-kgene.kim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, 'Jongpill Lee' <boyko@samsung.com>, 'Jongpill Lee' <boyko.lee@samsung.com>

Kukjin Kim wrote:
> 
> From: Jongpill Lee <boyko@samsung.com>

Jongpill Lee's e-mail was wrong.
boyko.lee@samsung.com is right.

> 
> This patch addes system timer for Samsung S5P series SoCs

Regarding using clksrc_src structure in system timer driver, is it ok if we
sent separate patch for this.

> Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-s5p6442/include/mach/tick.h      |    6 +
>  arch/arm/mach-s5p6442/mach-smdk6442.c          |    2 +-
>  arch/arm/mach-s5pv210/include/mach/tick.h      |    6 +
>  arch/arm/mach-s5pv210/mach-smdkc110.c          |    2 +-
>  arch/arm/mach-s5pv210/mach-smdkv210.c          |    2 +-
>  arch/arm/plat-s5p/Kconfig                      |    7 +
>  arch/arm/plat-s5p/Makefile                     |    1 +
>  arch/arm/plat-s5p/include/plat/regs-systimer.h |   75 ++++++
>  arch/arm/plat-s5p/s5p-systimer.c               |  287
> ++++++++++++++++++++++++
>  arch/arm/plat-samsung/include/plat/cpu.h       |    3 +
>  10 files changed, 388 insertions(+), 3 deletions(-)
>  create mode 100644 arch/arm/plat-s5p/include/plat/regs-systimer.h
>  create mode 100644 arch/arm/plat-s5p/s5p-systimer.c
> 

(snip)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
