From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL] Samsung devel-1 for v3.5
Date: Mon, 14 May 2012 16:47:32 +0900
Message-ID: <064f01cd31a5$d2300660$76901320$%kim@samsung.com>
References: <4FAF0156.5080306@samsung.com>
 <CAOesGMhwEpQstrM5Zc4ie=CX2BAoSsfAvJbZYxUpg66NUnxrjw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:29069 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753336Ab2ENHrc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 May 2012 03:47:32 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M40006IT5N2EIH0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 May 2012 16:47:31 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M4000K5Q5N6RFW1@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 May 2012 16:47:31 +0900 (KST)
In-reply-to: <CAOesGMhwEpQstrM5Zc4ie=CX2BAoSsfAvJbZYxUpg66NUnxrjw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Olof Johansson wrote:
> 
> On Sat, May 12, 2012 at 5:33 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > Hi Arnd, Olof
> >
> > Please pull Samsung devel for v3.5
> >
> > This is including exynos/iommu, platform of drm and fimc-lite, dma for
> > exynos5250 and s3c24xx-hsspi.
> >
> > Note, the exynos/iommu patch got the ack from Joerg and this should be
> sent
> > to upstream via arm tree and since it depends on cleanup-samsung-iommu,
> the
> > cleanup branch is included(merged) in here.
> >
> > If any problems, please let me know.
> 
> Same here, I'll hold off pulling this until we've sorted out the
> cleanup-samsung-iommu request.
> 
Please hold this off for a moment because I need to sort out regarding
s3c-hsotg patches which cause build error because some patches have been
already in usb tree for it.

If required, I will send separate branch to you.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
