From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/3] ARM: EXYNOS: Use EXYNOS4210_GPEx instead of
 EXYNOS4_GPEx
Date: Wed, 29 Aug 2012 15:52:23 +0200
Message-ID: <3351890.rVcxVBV0WB@amdc1227>
References: <4648723.rWnut7F0uJ@amdc1227> <503D57EF.2090402@samsung.com>
 <CAH9JG2UF6cqPcX4idYLRBHwLvs27ErtbwsjEFvMZbyfz_KNsZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:30045 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753710Ab2H2Nw3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Aug 2012 09:52:29 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9I007NIRVB0A10@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Aug 2012 22:52:27 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9I00531RVC7GA0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Aug 2012 22:52:27 +0900 (KST)
In-reply-to: <CAH9JG2UF6cqPcX4idYLRBHwLvs27ErtbwsjEFvMZbyfz_KNsZw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, linux-samsung-soc@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>

Hi,

On Wednesday 29 of August 2012 09:03:12 Kyungmin Park wrote:
> On 8/29/12, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > Please see my comments on Joonyoung Shim's previous patch...
> > http://lists.infradead.org/pipermail/linux-arm-kernel/2012-May/101522.h
> > tml
> It's perference issue. some person like this style. others doesn't.
> Moreever vender, System LSI, provided codes have whole different style.
> It lists up whole gpios for each SoCs.
> 
> EXYNOS4210_{A0, .... Z}
> EXYNOS4412_{A0, .... V4}
> EXYNOS5250_{A0, .... Z}
> 
> anyway, just remain it as broken, and try to use pinctl as Thomas
> mentioned.

OK, I will drop this patchset for the time being. Let's get the pinctrl 
driver merged first and then investigate Exynos4x12 support in it.

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
