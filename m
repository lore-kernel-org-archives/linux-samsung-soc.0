From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/4] ARM: dts: exynos4210-origen: Device tree fixes
Date: Wed, 21 Nov 2012 21:18:00 +0900
Message-ID: <0e7c01cdc7e2$3fc71380$bf553a80$%kim@samsung.com>
References: <1353336396-21161-1-git-send-email-t.figa@samsung.com>
 <1803002.oscJKykDTC@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:15569 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750958Ab2KUMSC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Nov 2012 07:18:02 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDU0059F7I1BUD0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Nov 2012 21:18:01 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDU00LY57I0XA80@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Nov 2012 21:18:01 +0900 (KST)
In-reply-to: <1803002.oscJKykDTC@amdc1227>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, thomas.abraham@linaro.org, jhkim@insignal.co.kr, m.szyprowski@samsung.com, tomasz.figa@gmail.com

Tomasz Figa wrote:
> 
> Hi Kgene,
> 
> On Monday 19 of November 2012 15:46:32 Tomasz Figa wrote:
> > This patch series fixes device tree support for Origen board:
> >  - memory is defined using sections of maximum allowed size
> >  - any pin configuration is modified to use pinctrl
> >  - invalid properties in sdhci nodes are replaced according to current
> >    mmc bindings
> >  - a fixed vmmc voltage regulator is added
> >
> > Tested on Origen board.
> >
> > Depends on:
> > [PATCH v2 0/2] mmc: host: sdhci-s3c: Add support for pinctrl interface
> >
> > Tomasz Figa (4):
> >   ARM: dts: exynos4210-origen: Split memory sections
> >   ARM: dts: exynos4210-origen: Update for pinctrl-samsung driver
> >   ARM: dts: exynos4210-origen: Update sdhci nodes for current bindings
> >   ARM: dts: exynos4210-origen: Add vmmc fixed voltage regulator
> >
> >  arch/arm/boot/dts/exynos4210-origen.dts | 54
> > ++++++++++++++++----------------- 1 file changed, 27 insertions(+), 27
> > deletions(-)
> 
> Could you still pick these patches up for 3.8?
> 
Looks OK to me, I want to test 1st patch on origen board with current my
u-boot though.

Will apply, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
