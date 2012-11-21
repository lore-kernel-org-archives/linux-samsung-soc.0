From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos4: Use drive strength 3 for SD pins
Date: Wed, 21 Nov 2012 11:35:56 +0100
Message-ID: <75197263.J0hoc8apCM@amdc1227>
References: <21831256.UCkQ5RyKd5@amdc1227> <1961860.xzxk1Exu2U@amdc1227>
 <0c8201cdc70f$a430a260$ec91e720$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:38424 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752359Ab2KUKgA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Nov 2012 05:36:00 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDU000672RIUL60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Nov 2012 19:35:59 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDU00HQC2RXLI70@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Nov 2012 19:35:58 +0900 (KST)
In-reply-to: <0c8201cdc70f$a430a260$ec91e720$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Marek Szyprowski' <m.szyprowski@samsung.com>

Hi Kgene,

On Tuesday 20 of November 2012 20:10:25 Kukjin Kim wrote:
> Tomasz Figa wrote:
> > Hi Kgene,
> > 
> > On Tuesday 20 of November 2012 18:18:44 Kukjin Kim wrote:
> > > Tomasz Figa wrote:
> > > > This patch modifies pin control groups of SD pins on Exynos4210
> > > > and
> > > > Exynos4x12 to use drive strength 3, which corresponds to
> > > > S5P_GPIO_DRVSTR_LV4 in legacy non-DT code.
> > > 
> > > Well, the value of drive strength depends on board not SoC. So if
> > > required, it should be moved to board DT stuff.
> > 
> > Yes, I fully agree.
> > 
> > I've been thinking whether to change the defaults or just override
> > them
> > for Origen, but I came to a conclusion that 3 (LV4) was the default in
> > non-DT code, so it probably should be also the default in DT variant.
> 
> OK.
> 
> > > BTW, we can use the value as a default...I need to think about that
> > > again for exynos4210 and 4x12.
> > 
> > I wonder which default value is more appropriate, 0 or 3?
> 
> In this case, yes, '3' is more useful...so can you re-submit this patch
> with editing commit?

I can resubmit this patch, but I'm not sure what you expect me to edit. 
Could you explain?

If possible, it would be nice to get this included in 3.8 as it's required 
for Origen board to boot with device tree.

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Linux Platform
