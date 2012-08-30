From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: RE: [PATCH 0/6] ARM: EXYNOS: Add support for Trats board using device
 tree
Date: Thu, 30 Aug 2012 09:54:01 +0900
Message-ID: <040101cd8649$f1dab7f0$d59027d0$%park@samsung.com>
References: <1346245980-2658-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:13993 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753326Ab2H3AxD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Aug 2012 20:53:03 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9J00BB4MFLHUE0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Aug 2012 09:53:01 +0900 (KST)
Received: from NOKYUNGMINP03 ([10.90.42.196])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9J00K5XMGCVS60@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Aug 2012 09:53:00 +0900 (KST)
In-reply-to: <1346245980-2658-1-git-send-email-t.figa@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Thomas Abraham' <thomas.abraham@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, jy0922.shim@samsung.com

+ Thomas Abraham,

> -----Original Message-----
> From: Tomasz Figa [mailto:t.figa@samsung.com]
> Sent: Wednesday, August 29, 2012 10:13 PM
> To: linux-samsung-soc@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org; kyungmin.park@samsung.com;
> kgene.kim@samsung.com; jy0922.shim@samsung.com; Tomasz Figa
> Subject: [PATCH 0/6] ARM: EXYNOS: Add support for Trats board using device
> tree
> 
> This patch series adds basic device tree support for Samsung Trats board
> along with any necessary prerequisites.
> 
> In addition it refactors Exynos4 dts include files to split parts common
> to
> the whole Exynos4 part from parts specific to Exynos4210 to allow further
> extension of Exynos4210 dts include file and addition of include files for
> other SoCs from Exynos4 line.
> 
> Dependencies:
> -> [PATCH v5] mmc: sdhci-s3c: Add device tree support
> http://www.spinics.net/lists/linux-samsung-soc/msg12056.html
> -> [PATCH v5 2/2] regulator: add device tree support for max8997
> http://www.spinics.net/lists/kernel/msg1328117.html
> 
> Tomasz Figa (6):
>   ARM: dts: Move parts common to Exynos4 from Exynos4210.dtsi to
>     Exynos4.dtsi
>   ARM: EXYNOS: exynos4-dt: Use exynos4 prefix instead of exynos4210
>   ARM: Exynos4: dts: Specify address and size cells for i2c controllers
>   ARM: Exynos4: Add OF compatibility lookups for Exynos4 i2c adapters
>   ARM: EXYNOS: Increase maximum possible memory bank size to 512MiB
>   ARM: Exynos: Add basic dts file for Samsung Trats board
> 
>  arch/arm/boot/dts/exynos4.dtsi             | 418
> +++++++++++++++++++++++++++++
>  arch/arm/boot/dts/exynos4210-trats.dts     | 287 ++++++++++++++++++++
>  arch/arm/boot/dts/exynos4210.dtsi          | 377
+-------------------------
>  arch/arm/mach-exynos/Makefile.boot         |   2 +-
>  arch/arm/mach-exynos/include/mach/memory.h |   4 +-
>  arch/arm/mach-exynos/mach-exynos4-dt.c     |  34 ++-
>  6 files changed, 734 insertions(+), 388 deletions(-)
>  create mode 100644 arch/arm/boot/dts/exynos4.dtsi
>  create mode 100644 arch/arm/boot/dts/exynos4210-trats.dts
> 
> --
> 1.7.12
