From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL] cleanup samsung plat-s3c24xx and s5p for v3.5
Date: Tue, 15 May 2012 17:11:36 +0900
Message-ID: <07f201cd3272$595ba050$0c12e0f0$%kim@samsung.com>
References: <4FAEEFD3.9040907@samsung.com>
 <CAOesGMgk+-cqmDmhsjM9fhRpwxV4jNf4y+z1AKWpu8a=6wqkCw@mail.gmail.com>
 <064c01cd31a4$9ddd5c60$d9981520$%kim@samsung.com>
 <201205141917.35692.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:65100 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756749Ab2EOILj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 May 2012 04:11:39 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M4200JIL1F3VIC0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 May 2012 17:11:38 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M42005VT1F9FT80@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 May 2012 17:11:38 +0900 (KST)
In-reply-to: <201205141917.35692.arnd@arndb.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>
Cc: 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Arnd Bergmann wrote:
> 
> On Monday 14 May 2012, Kukjin Kim wrote:
> > It is next/cleanup-samsung-iommu branch and already included in
> > next/cleanup-plat-s3c24xx branch as a base because as I said, that is needed
> > to remove plat-s5p directory.
> > So in this case, would be better if you could pull following branch before
> > pulling next/cleanup-plat-s3c24xx-s5p and sorry for missing pull request it.
> >
> > git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> > next/cleanup-samsung-iommu
> >
> > If any problems, please let me know.
> 
First of all, thanks for your pulling.

> I've pulled the next/cleanup-samsung-iommu into next/drivers and the

But I think would be better if you could pull the next/devel-samsung-iommu into next/drivers instead of next/cleanup-samsung-iommu.
Because actual iommu driver is included in next/devel-samsung-iommu branch and the next/cleanup-samsung-iommu branch includes just
cleanup current Samsung iommu driver.

> next/cleanup-plat-s3c24xx-s5p branch into next/cleanup2, which creates
> a new dependency between our two branches in arm-soc.
> 
Sorry for creating a new dependency :( But now, it is needed and looks ok to me.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
