From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v2 0/3] Add enable method support for Exynos SoCs
Date: Sat, 10 Dec 2016 16:15:59 +0530
Message-ID: <1481366762-26413-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:52029 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752924AbcLJKnh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 10 Dec 2016 05:43:37 -0500
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OHY01TOITSMBT60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 10 Dec 2016 19:43:34 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: krzk@kernel.org, kgene@kernel.org, javier@osg.samsung.com, thomas.ab@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

Lets use CPU_METHOD_OF_DECLARE() for smp_ops instead of using it
via machine descriptor. To keep compatibility of older DTBs lets not 
remove smp_ops hooks from machnine_descriptor.

Changes since v1:
 - Dropped code removing smp_ops hooks from exynos.c
 - Separated patch into three patches separating change in .c, .dtsi
   and updated binding Documentation.

Pankaj Dubey (3):
  Documentation: bindings: Add binding doc for exynos enable method
  ARM: EXYNOS: dts: add enable-method property for cpus node
  ARM: EXYNOS: add CPU_METHOD_OF_DECLARE for exynos SoCs

 Documentation/devicetree/bindings/arm/cpus.txt | 1 +
 arch/arm/boot/dts/exynos3250.dtsi              | 1 +
 arch/arm/boot/dts/exynos4210.dtsi              | 1 +
 arch/arm/boot/dts/exynos4212.dtsi              | 1 +
 arch/arm/boot/dts/exynos4412.dtsi              | 1 +
 arch/arm/boot/dts/exynos5250.dtsi              | 1 +
 arch/arm/boot/dts/exynos5260.dtsi              | 1 +
 arch/arm/boot/dts/exynos5410.dtsi              | 1 +
 arch/arm/boot/dts/exynos5420-cpus.dtsi         | 1 +
 arch/arm/boot/dts/exynos5422-cpus.dtsi         | 1 +
 arch/arm/boot/dts/exynos5440.dtsi              | 1 +
 arch/arm/mach-exynos/platsmp.c                 | 2 ++
 12 files changed, 13 insertions(+)

-- 
2.7.4
