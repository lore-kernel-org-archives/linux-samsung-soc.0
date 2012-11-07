From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos4: Add support for Exynos4x12 SoCs
Date: Wed, 07 Nov 2012 16:34:16 +0100
Message-ID: <3301517.VQVR99BHPc@amdc1227>
References: <1351089359-7318-1-git-send-email-t.figa@samsung.com>
 <0c4501cdbc8f$5336add0$f9a40970$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:49176 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751428Ab2KGPeW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Nov 2012 10:34:22 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MD4003DDJ8SNX80@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 08 Nov 2012 00:34:20 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MD400JWKJ97XB40@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 08 Nov 2012 00:34:20 +0900 (KST)
In-reply-to: <0c4501cdbc8f$5336add0$f9a40970$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, tomasz.figa@gmail.com, thomas.abraham@linaro.org

Hi Kgene,

On Wednesday 07 of November 2012 11:26:42 Kukjin Kim wrote:
> Kukjin Kim wrote:
> > Tomasz Figa wrote:
> > > This patch adds device tree sources for Exynos4x12 SoC series
> > > (currently Exynos4212 and Exynos4412) and enables mach-exynos4-dt
> > > to support these SoCs.
> > > 
> > > Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> > > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > > ---
> > > 
> > >  arch/arm/boot/dts/exynos4212.dtsi      | 28
> 
> ++++++++++++++++++++++++++++
> 
> > >  arch/arm/boot/dts/exynos4412.dtsi      | 28
> 
> ++++++++++++++++++++++++++++
> 
> > >  arch/arm/boot/dts/exynos4x12.dtsi      | 31
> > > 
> > > +++++++++++++++++++++++++++++++
> > > 
> > >  arch/arm/mach-exynos/mach-exynos4-dt.c |  2 ++
> > >  4 files changed, 89 insertions(+)
> > >  create mode 100644 arch/arm/boot/dts/exynos4212.dtsi
> > >  create mode 100644 arch/arm/boot/dts/exynos4412.dtsi
> > >  create mode 100644 arch/arm/boot/dts/exynos4x12.dtsi
> > 
> > Looks good to me, applied.
> 
> [...]
> 
> > +/include/ "exynos4x12-pinctrl.dtsi"
> 
> BTW, I think, above line should be added when exynos4x12-pinctrl patches
> applied.

Yes, you are right. Seems like a rebase error on my side. Can you fix it 
or should I send a fixed version?


Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Linux Platform
