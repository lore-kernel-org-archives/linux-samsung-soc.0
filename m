From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH v6] ARM: S5P: Add Ext interrupt support.
Date: Thu, 20 May 2010 07:26:11 +0200
Message-ID: <014801caf7dc$f8332e50$e8998af0$%szyprowski@samsung.com>
References: <1274325653-16243-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:47955 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753666Ab0ETF1H (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 May 2010 01:27:07 -0400
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L2P00KX2DSXC8@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 May 2010 14:26:57 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L2P00EJIDSKP4@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 May 2010 14:26:57 +0900 (KST)
In-reply-to: <1274325653-16243-1-git-send-email-kgene.kim@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Pannaga Bhushan' <p.bhushan@samsung.com>, 'Jongpill Lee' <boyko.lee@samsung.com>, ben-linux@fluff.org

Hello,

On Thursday, May 20, 2010 5:21 AM Kukjin Kim wrote:

> From: Jongpill Lee <boyko.lee@samsung.com>
> 
> This patch adds the following:
> 
> 1. Adds external interrupt support for S5PV210.
> 2. Adds common defines related to external interrupt support for plat-s5p
>    based platforms.
> 3. Based on the new common defines, corresponding changes are made in the
>    affected platforms (S5P6440 and S5P6442).
> 
> Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
> Signed-off-by: Pannaga Bhushan <p.bhushan@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-s5p6440/include/mach/irqs.h      |    9 +-
>  arch/arm/mach-s5p6442/include/mach/irqs.h      |    5 +-
>  arch/arm/mach-s5pv210/Kconfig                  |    1 +
>  arch/arm/mach-s5pv210/include/mach/irqs.h      |   25 +---
>  arch/arm/mach-s5pv210/include/mach/memory.h    |    2 +-
>  arch/arm/mach-s5pv210/include/mach/regs-gpio.h |   48 +++++
>  arch/arm/plat-s5p/Kconfig                      |    6 +
>  arch/arm/plat-s5p/Makefile                     |    1 +
>  arch/arm/plat-s5p/include/plat/irqs.h          |    7 +
>  arch/arm/plat-s5p/irq-eint.c                   |  218
> ++++++++++++++++++++++++
>  10 files changed, 296 insertions(+), 26 deletions(-)
> ...

Works fine here on S5PC100. I will post relevant patches for s5pc100 in
a minute.

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
