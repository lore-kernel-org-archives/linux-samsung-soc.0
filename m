From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: exynos_defconfig: increase CONFIG_NR_CPUS value to 8
Date: Tue, 26 Nov 2013 08:29:49 +0900
Message-ID: <1ad401ceea36$3bcbf940$b363ebc0$%kim@samsung.com>
References: <1511364.Pd4tSi34z7@amdc1032> <3699555.ZHO9r7FOJe@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:60352 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751788Ab3KYX3u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Nov 2013 18:29:50 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MWU00GJUELPA6B0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 26 Nov 2013 08:29:49 +0900 (KST)
In-reply-to: <3699555.ZHO9r7FOJe@amdc1227>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Tomasz Figa wrote:
> 
> Hi Bart,
> 
> On Thursday 21 of November 2013 13:06:06 Bartlomiej Zolnierkiewicz wrote:
> > Current CONFIG_NR_CPUS value (2) is too small for:
> > - EXYNOS4412 (4 cores)
> > - EXYNOS5440 (4 cores)
> > - EXYNOS5410 (8 cores)
> > - EXYNOS5420 (8 cores)
> >
> > Set CONFIG_NR_CPUS to 8 so it is correct for all currently
> > supported SoCs.
> >
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > ---
> >  arch/arm/configs/exynos_defconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Definitely a change we want to have.
> 
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> 
Applied and you can see this in my tree in a couple of days.

Thanks,
Kukjin
