From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH 0/4] ARM: Exynos4: NURI and UniversalC210 fixes for v3.4-rc2
Date: Mon, 16 Apr 2012 08:39:56 +0200
Message-ID: <003401cd1b9b$bd602cd0$38208670$%szyprowski@samsung.com>
References: <1333698206-12348-1-git-send-email-m.szyprowski@samsung.com>
 <4F84686D.60606@samsung.com>
 <00c101cd17ae$4582f0d0$d088d270$%szyprowski@samsung.com>
 <4F899CAF.6080906@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:31848 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751338Ab2DPGkF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Apr 2012 02:40:05 -0400
Received: from euspt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0M2K009CW7U2R440@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 16 Apr 2012 07:39:38 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M2K00FB17UQU5@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 16 Apr 2012 07:40:02 +0100 (BST)
In-reply-to: <4F899CAF.6080906@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Kyungmin Park' <kyungmin.park@samsung.com>

Hi Kukjin,

On Saturday, April 14, 2012 5:50 PM Kukjin Kim wrote:

> >>> I've just checked the support for Samsung NURI and UniversalC210 boards
> >>> in v3.4-rc1 and found some issues. The attached patches fixes the
> >>> leftovers from missing s3c-sdhci driver changes, fixes division by
> >>> zero caused by missing initial value for xusbxti clock and removes broken
> >>> optional configuration entries for touch screen driver. It would be great
> >>> if the attached patches will get merged to v3.4-rcX series.
> >>>
> >> OK, looks good to me, applied.
> >
> > Huh, it doesn't look that easy...
> >
> > I've just noticed that v3.4-rc2 comes with missing s3c-sdhci driver patches
> > (see commit 1ddca05743525), so you need a bit more work on your fixes branch
> > to get sdhci working again. Please restore patches 'ARM: EXYNOS: use
> > 'exynos4-sdhci' as device name for sdhci controllers' and 'ARM: SAMSUNG:
> > remove all uses of clk_type member in sdhci platform data' as well as the
> > other patches which fixes issues after changing the name of sdhci platform
> > devices from s3c-sdhci to exynos4-sdhci. My patch 'ARM: EXYNOS: fix SDHCI
> > support on NURI and UniversalC210 boards' should be dropped then.
> >
> > If you have any problems, let me know, I have them already collected and
> > rebased onto v3.4-rc2, so I can resend an updated version.
> 
> Thanks for your reminder. I re-worked Thomas' patches you said for it
> and you can check it in my -next and -fixes-3 and I'm looking at that.

Thanks, now it is much better. 

The only missing thing are host_caps2 entry updates, which I've posted a few 
minutes ago in '[PATCH for v3.4-rc3] ARM: Samsung: add missing 
MMC_CAP2_BROKEN_VOLTAGE capability' mail.

I would also like to remind that UniversalC210 board requires 'ARM: Exynos4:
use s5p-timer for UniversalC210 board' bugfix/workaround to work with recent 
kernels. Any chance to get this patch merged? It has been (re)posted many 
times since v3.2-rc1 if I remember correctly...

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
