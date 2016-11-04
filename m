From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH 0/4] Add SCU device node support for Exynos4
Date: Fri, 04 Nov 2016 09:09:20 +0530
Message-ID: <1478230764-13748-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:36377 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932909AbcKDDgg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Nov 2016 23:36:36 -0400
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OG300EYQM0UQP90@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Nov 2016 12:36:34 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: krzk@kernel.org, kgene@kernel.org, thomas.ab@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

This patch series does some cleanup for Exynos4 SoC based boards.
We are currently statically mapping SCU SFRs in mach-exynos/exynos.c
which can be avoided and related dependencies can be removed by introduction
of SCU device node. 
  
This patch series is tested on Exynos4210 based Origen board for SMP boot.

Pankaj Dubey (4):
  ARM: EXYNOS: Remove smp_init_cpus hook from platsmp.c
  ARM: dts: exynos: Add SCU device node to exynos4.dtsi
  ARM: EXYNOS: Remove static mapping of SCU SFR
  ARM: EXYNOS: Remove unused soc_is_exynos{4,5}

 arch/arm/boot/dts/exynos4.dtsi               |  5 +++
 arch/arm/mach-exynos/common.h                |  5 ---
 arch/arm/mach-exynos/exynos.c                | 22 -------------
 arch/arm/mach-exynos/include/mach/map.h      |  2 --
 arch/arm/mach-exynos/platsmp.c               | 49 +++++++---------------------
 arch/arm/mach-exynos/pm.c                    | 14 ++++++--
 arch/arm/mach-exynos/suspend.c               | 15 ++++++---
 arch/arm/plat-samsung/include/plat/map-s5p.h |  4 ---
 8 files changed, 38 insertions(+), 78 deletions(-)

-- 
2.7.4
