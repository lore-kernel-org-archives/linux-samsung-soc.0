From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: dts: exynos4: Enable serial controllers on Origen and
 SMDKV310
Date: Mon, 15 Oct 2012 23:23:22 +0900
Message-ID: <10e401cdaae0$a17d44b0$e477ce10$%kim@samsung.com>
References: <1349701968-6675-1-git-send-email-t.figa@samsung.com>
 <1587144.mixS1B3zoJ@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:42807 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750770Ab2JOOXY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Oct 2012 10:23:24 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBX00B81UMYHQA0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 15 Oct 2012 23:23:22 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MBX00I27UMYIS30@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 15 Oct 2012 23:23:22 +0900 (KST)
In-reply-to: <1587144.mixS1B3zoJ@amdc1227>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, tomasz.figa@gmail.com

Tomasz Figa wrote:
> 
> Hi Kgene,
> 
> On Monday 08 of October 2012 15:12:48 Tomasz Figa wrote:
> > This patch adds status override of serial nodes to enable used serial
> > ports on Origen and SMDKV310 board.
> >
> > Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> > ---
> >  arch/arm/boot/dts/exynos4210-origen.dts   | 16 ++++++++++++++++
> >  arch/arm/boot/dts/exynos4210-smdkv310.dts | 16 ++++++++++++++++
> >  2 files changed, 32 insertions(+)
> >
> 
> I think you missed this patch when applying Exynos dts reorganization
> patches. It is needed to enable serial ports on Origen and SMDKV310
boards.
> Could you apply it as well?
> 
Oops, yeah. I will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
