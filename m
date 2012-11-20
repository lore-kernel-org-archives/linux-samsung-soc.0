From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos4: Use drive strength 3 for SD pins
Date: Tue, 20 Nov 2012 10:35:30 +0100
Message-ID: <1961860.xzxk1Exu2U@amdc1227>
References: <21831256.UCkQ5RyKd5@amdc1227>
 <0c2f01cdc700$09c204d0$1d460e70$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:8538 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751698Ab2KTJfg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Nov 2012 04:35:36 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDS00JR05A2RQW0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Nov 2012 18:35:35 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDS00FXT5B9I110@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Nov 2012 18:35:35 +0900 (KST)
In-reply-to: <0c2f01cdc700$09c204d0$1d460e70$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Marek Szyprowski' <m.szyprowski@samsung.com>

Hi Kgene,

On Tuesday 20 of November 2012 18:18:44 Kukjin Kim wrote:
> Tomasz Figa wrote:
> > This patch modifies pin control groups of SD pins on Exynos4210 and
> > Exynos4x12 to use drive strength 3, which corresponds to
> > S5P_GPIO_DRVSTR_LV4 in legacy non-DT code.
> 
> Well, the value of drive strength depends on board not SoC. So if
> required, it should be moved to board DT stuff.

Yes, I fully agree.

I've been thinking whether to change the defaults or just override them 
for Origen, but I came to a conclusion that 3 (LV4) was the default in 
non-DT code, so it probably should be also the default in DT variant.

> BTW, we can use the value as a default...I need to think about that
> again for exynos4210 and 4x12.

I wonder which default value is more appropriate, 0 or 3?

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Linux Platform
