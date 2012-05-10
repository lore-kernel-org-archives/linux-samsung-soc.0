From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCHv2 0/3] Add support for DRM display subsystem
Date: Thu, 10 May 2012 13:18:00 +0200
Message-ID: <01fb01cd2e9e$8f4cfbf0$ade6f3d0$%szyprowski@samsung.com>
References: <1331635180-7207-1-git-send-email-m.szyprowski@samsung.com>
 <037301cd2e90$529112e0$f7b338a0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:18782 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759145Ab2EJLSG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 May 2012 07:18:06 -0400
Received: from euspt2 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0M3T006NG0OZ0R50@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 May 2012 12:17:24 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M3T005L40Q1UK@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 May 2012 12:18:02 +0100 (BST)
In-reply-to: <037301cd2e90$529112e0$f7b338a0$%kim@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Joonyoung Shim' <jy0922.shim@samsung.com>

Hello,

On Thursday, May 10, 2012 11:36 AM Kukjin Kim wrote:

> Marek Szyprowski wrote:
> >
> > Hello,
> >
> > This patch set adds support for Exynos DRM display subsystem for
> > Universal C210 and NURI boards. Exynos DRM driver has been merged to 3.3
> > kernel tree and provides unified and more powerful alternative for
> > s3c-fb and s5p-tv drivers. V2 includes update for the latest changes in
> > platform data structure (added 'panel' entry).
> >
> > Best regards
> >
> > Marek Szyprowski
> > Samsung Poland R&D Center
> >
> > Patch summary:
> >
> > Marek Szyprowski (3):
> >   ARM: Exynos: add platform device for core DRM subsystem
> >   ARM: Exynos: Add DRM core device support for Universal C210 board
> >   ARM: Exynos: Add DRM core support for NURI board
> >
> >  arch/arm/mach-exynos/Kconfig               |    7 ++++++
> >  arch/arm/mach-exynos/Makefile              |    1 +
> >  arch/arm/mach-exynos/dev-drm.c             |   29
> ++++++++++++++++++++++++
> >  arch/arm/mach-exynos/mach-nuri.c           |   33
> > ++++++++++++++++++++++++++++
> >  arch/arm/mach-exynos/mach-universal_c210.c |   33
> > ++++++++++++++++++++++++++++
> >  arch/arm/plat-samsung/include/plat/devs.h  |    2 +
> >  6 files changed, 105 insertions(+), 0 deletions(-)
> >  create mode 100644 arch/arm/mach-exynos/dev-drm.c
> >
> > --
> > 1.7.1.569.g6f426
> 
> Well, 2nd and 3rd patches can break multi-platform for EXYNOS SoCs with one
> kernel image.

We can switch completely to DRM driver for both boards and remove entries for 
s3c-fb/tv if this is really needed. IMHO it is a bit lame that the DRM driver
is already in the mainline, but none of the boards use it. Even if one wants
to add support for it to his own board, he cannot find any reference code for
it...

> And I won't apply new feature for non-dt board file from now on. I think, we
> need to support DT in mach-exynos/ instead of non-DT and DT together, so
> please consider to move on dt supporting for Samsung mobile boards.
> 
> Note that I have a plan to replace board files with DT supporting in
> mach-exynos/ next time.

Right now the DT support is so incomplete that even basic things like gpio 
interrupts are not yet supported. This will be a huge regression if you remove
the existing board files and replace them with DT stubs.
 
Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
