From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: Remove unused static iomapping
Date: Thu, 13 Nov 2014 10:26:02 +0530
Message-ID: <000e01cffefe$2ca2f8a0$85e8e9e0$@samsung.com>
References: <1415683022-21771-1-git-send-email-pankaj.dubey@samsung.com>
 <54641AF1.50105@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:15293 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753559AbaKME4V (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Nov 2014 23:56:21 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NEY00I24ODW0A20@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Nov 2014 13:56:20 +0900 (KST)
In-reply-to: <54641AF1.50105@samsung.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, tomasz.figa@gmail.com, thomas.ab@samsung.com, heiko@sntech.de

Hi Kukjin,

On Thursday, November 13, 2014 8:14 AM, Kukjin Kim wrote:
> Subject: Re: [PATCH] ARM: EXYNOS: Remove unused static iomapping
> 
> On 11/11/14 14:17, Pankaj Dubey wrote:
> > This patch removes all unused static iomapping from exynos4/5_iodesc
> > table, and at the same time removes related macros from map.h and
> > map-s5p.h.
> > All such mappings are present in exynos.c but not currently there are
> > no users of these mappings, so its safe to remove these.
> >
> > Signed-off-by: Pankaj Dubey<pankaj.dubey@samsung.com>
> > ---
> > This patch has been compiled tested for exynos_defconfig;
> > multi_v7_defconfig; s5pv210_defconfig; s3c6400_defconfig; and
> s3c2410_defconfig.
> >
> > I have verified system booting on SMDK5250 and Exynos3250 based board.
> >
> >   arch/arm/mach-exynos/exynos.c                |   50
--------------------------
> >   arch/arm/mach-exynos/include/mach/map.h      |   23 ------------
> >   arch/arm/plat-samsung/include/plat/map-s5p.h |   21 -----------
> >   3 files changed, 94 deletions(-)
> 
> Applied, thanks.
> 

May be I am missing something here, but I can't see this in any branch of
your tree.

Thanks,
Pankaj Dubey
> - Kukjin
