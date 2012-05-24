From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] gpio/exynos: Add support for Exynos4x12 SoC
Date: Thu, 24 May 2012 17:36:29 +0900
Message-ID: <008201cd3988$50731ff0$f1595fd0$%kim@samsung.com>
References: <1337307497-15777-1-git-send-email-jy0922.shim@samsung.com>
 <1337307497-15777-2-git-send-email-jy0922.shim@samsung.com>
 <4FB5B9CA.6060705@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:44088 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753668Ab2EXIgr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 May 2012 04:36:47 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M4I00FQOQF6S340@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 May 2012 17:36:29 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M4I00BMFQKT6680@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 May 2012 17:36:29 +0900 (KST)
In-reply-to: <4FB5B9CA.6060705@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Joonyoung Shim' <jy0922.shim@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, linus.walleij@stericsson.com, 'Sangsu Park' <sangsu4u.park@samsung.com>

Joonyoung Shim wrote:
> 
> Add to cc Grant Likely and Linus Walleij
> 
> On 05/18/2012 11:18 AM, Joonyoung Shim wrote:
> > Exynos4x12 GPIO part1 and part2 layouts are different with that of
> > Exynos4210. So, it needs to support gpios for Exynos4x12 SoC. This
> > doesn't support GPVx Exynos4x12 GPIO part4 yet.
> >
> > In the Exynos4x12 GPIO part1 and part2, the interval of base register
> > offset is 0x20 but GPF0, GPJ0, GPK0 and GPM0 ignore the 0x20 interval
> > and have new value. The interrupt reg offset also is about GPF0 and GPK0
> > too. Refer the below layout.
> >
> > - Exynos4x12 GPIO Part1
> > GPIO    Base offset     Interrupt reg offset
> > GPA0    0x000           0x00
> > GPA1    0x020           0x04
> > GPB     0x040           0x08
> > GPC0    0x060           0x0C
> > GPC1    0x080           0x10
> > GPD0    0x0A0           0x14
> > GPD1    0x0C0           0x18
> >          ...
> > GPF0    0x180           0x30
> > GPF1    0x1A0           0x34
> > GPF2    0x1C0           0x38
> > GPF3    0x1E0           0x3C
> >          ...
> > GPJ0    0x240           0x40
> > GPJ1    0x260           0x44
> >
> > - Exynos4x12 GPIO Part2
> >          ...
> > GPK0    0x040           0x08
> > GPK1    0x060           0x0C
> > GPK2    0x080           0x10
> > GPK3    0x0A0           0x14
> > GPL0    0x0C0           0x18
> > GPL1    0x0E0           0x1C
> > GPL2    0x100           0x20
> > GPY0    0x120           x
> > GPY1    0x140           x
> > GPY2    0x160           x
> > GPY3    0x180           x
> > GPY4    0x1A0           x
> > GPY5    0x1C0           x
> > GPY6    0x1E0           x
> >          ...
> > GPM0    0x260           0x24
> > GPM1    0x280           0x28
> > GPM2    0x2A0           0x2C
> > GPM3    0x2C0           0x30
> > GPM4    0x2E0           0x34
> > GPX0    0xC00           x
> > GPX1    0xC20           x
> > GPX2    0xC40           x
> > GPX3    0xC60           x
> >
> > Signed-off-by: Joonyoung Shim<jy0922.shim@samsung.com>
> > Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
> > ---
> >   arch/arm/mach-exynos/include/mach/gpio.h |   28 +++-
> >   arch/arm/mach-exynos/include/mach/irqs.h |    6 -
> >   drivers/gpio/gpio-samsung.c              |  334
> +++++++++++++++++++++++++++---
> >   3 files changed, 327 insertions(+), 41 deletions(-)

See my comments on 1/2 patch.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
