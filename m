From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: dts: exynos4: Add support for Exynos4x12 SoCs
Date: Wed, 07 Nov 2012 11:26:42 +0900
Message-ID: <0c4501cdbc8f$5336add0$f9a40970$%kim@samsung.com>
References: <1351089359-7318-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:10887 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752619Ab2KGC0o (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Nov 2012 21:26:44 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MD300NN6IRO40L0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 07 Nov 2012 11:26:42 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MD3006ITISINX60@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 07 Nov 2012 11:26:42 +0900 (KST)
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Tomasz Figa' <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, tomasz.figa@gmail.com, thomas.abraham@linaro.org

Kukjin Kim wrote:
> 
> Tomasz Figa wrote:
> >
> > This patch adds device tree sources for Exynos4x12 SoC series (currently
> > Exynos4212 and Exynos4412) and enables mach-exynos4-dt to support these
> > SoCs.
> >
> > Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> >  arch/arm/boot/dts/exynos4212.dtsi      | 28
++++++++++++++++++++++++++++
> >  arch/arm/boot/dts/exynos4412.dtsi      | 28
++++++++++++++++++++++++++++
> >  arch/arm/boot/dts/exynos4x12.dtsi      | 31
> > +++++++++++++++++++++++++++++++
> >  arch/arm/mach-exynos/mach-exynos4-dt.c |  2 ++
> >  4 files changed, 89 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/exynos4212.dtsi
> >  create mode 100644 arch/arm/boot/dts/exynos4412.dtsi
> >  create mode 100644 arch/arm/boot/dts/exynos4x12.dtsi
> >
> 
> Looks good to me, applied.
> 

[...]

> +/include/ "exynos4x12-pinctrl.dtsi"

BTW, I think, above line should be added when exynos4x12-pinctrl patches
applied.

[...]

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
