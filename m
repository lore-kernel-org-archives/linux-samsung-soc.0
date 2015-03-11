From: Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH v6 0/2] irqchip: Move Exynos PM to use stacked domains
Date: Wed, 11 Mar 2015 15:44:51 +0000
Message-ID: <1426088693-15724-1-git-send-email-marc.zyngier@arm.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:46407 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751926AbbCKPo7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Mar 2015 11:44:59 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Jason Cooper <jason@lakedaemon.net>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

This series is extracted from [4], which is trying to remove all
traces of gic_arch_extn from the tree. As some maintainers are more
responsive than others (understatement of the year...), I've decided
to split it per sub-arch, and get it moving, at least partially.

This series addresses Exynos by converting its PM support to a stacked
domain on top of the standard GIC.

Based on 4.0-rc1.

* From v5: [5]
- Added a big fat warning when an old DT is detected (as requested by Jason)
- Added support for Exynos3250
- Allow interrupt affinity to be changed

* From v4: [4]
- Extracted from the full series
- Rebased on 4.0-rc1

* From v3 [3]:
- Rebased on top of the patch working around hardcoded IRQ on OMAP4/5 [4]
- Fixed more iMX6 DTs (Stephan)
- Fixed Exynos4/5 DTs

* From v2 [2]:
- Addressed numerous comments from Thierry
- Merged bug fixes from Nishanth
- Merged bug fix from Stefan

* From v1 [1]:
- Rebased on 3.19-rc3
- Fixed a number of additional platforms
- Added crossbar conversion to stacked domains
- Merged bug fixes from Nishanth

[5]: http://lists.infradead.org/pipermail/linux-arm-kernel/2015-February/325368.html
[4]: http://lists.infradead.org/pipermail/linux-arm-kernel/2015-January/317531.html
[3]: http://lists.infradead.org/pipermail/linux-arm-kernel/2015-January/315385.html
[2]: http://lists.infradead.org/pipermail/linux-arm-kernel/2015-January/314041.html
[1]: http://lists.infradead.org/pipermail/linux-arm-kernel/2014-November/307338.html

Marc Zyngier (2):
  ARM: exynos4/5: convert pmu wakeup to stacked domains
  DT: exynos: update PMU binding

 .../devicetree/bindings/arm/samsung/pmu.txt        |  17 +++
 arch/arm/boot/dts/exynos3250.dtsi                  |   6 +-
 arch/arm/boot/dts/exynos4.dtsi                     |   4 +
 arch/arm/boot/dts/exynos5250.dtsi                  |   4 +
 arch/arm/boot/dts/exynos5420.dtsi                  |   4 +
 arch/arm/mach-exynos/exynos.c                      |  15 +--
 arch/arm/mach-exynos/suspend.c                     | 139 ++++++++++++++++++---
 7 files changed, 164 insertions(+), 25 deletions(-)

-- 
2.1.4
