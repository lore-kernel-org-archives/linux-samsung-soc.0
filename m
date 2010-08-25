From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH RE-SEND] ARM: S5P: Move OneNAND device definitions in
 plat-s5p
Date: Thu, 26 Aug 2010 08:27:45 +0900
Message-ID: <001401cb44ad$22fc4460$68f4cd20$%kim@samsung.com>
References: <1282522043-2420-1-git-send-email-kgene.kim@samsung.com>
 <01ba01cb4268$8346fa50$89d4eef0$%park@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:12573 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752065Ab0HYX1h (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Aug 2010 19:27:37 -0400
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L7Q005EQEHZMS40@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Aug 2010 08:27:36 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L7Q00KM6EHZM4@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Aug 2010 08:27:35 +0900 (KST)
In-reply-to: <01ba01cb4268$8346fa50$89d4eef0$%park@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, kyungmin.park@samsung.com

Kukjin Kim wrote:
> 
> This patch moves OneNAND device definitions from mach-s5pv210 to plat-s5p
> so that can support it commonly.
> 
> Note: S5PC110 and S5PC210 have same OneNAND driver.
> 
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Kyungmin Park <Kyungmin Park <kyungmin.park@samsung.com>

Hmm...typo...will fix like following.
Cc: Kyungmin Park <kyungmin.park@samsung.com>

> ---
>  arch/arm/mach-s5pv210/Kconfig                     |    9 +-----
>  arch/arm/mach-s5pv210/Makefile                    |    1 -
>  arch/arm/mach-s5pv210/include/mach/map.h          |    3 ++
>  arch/arm/mach-s5pv210/mach-aquila.c               |    2 +-
>  arch/arm/mach-s5pv210/mach-goni.c                 |    2 +-
>  arch/arm/mach-s5pv310/include/mach/irqs.h         |    2 +
>  arch/arm/mach-s5pv310/include/mach/map.h          |    6 ++++
>  arch/arm/plat-s5p/Kconfig                         |    5 +++
>  arch/arm/plat-s5p/Makefile                        |    1 +
>  arch/arm/{mach-s5pv210 => plat-s5p}/dev-onenand.c |   28
> +++++++++++---------
>  arch/arm/plat-samsung/include/plat/devs.h         |    2 +-
>  11 files changed, 37 insertions(+), 24 deletions(-)
>  rename arch/arm/{mach-s5pv210 => plat-s5p}/dev-onenand.c (59%)
> 

(snip)

> --


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
