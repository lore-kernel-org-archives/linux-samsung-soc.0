From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: [PATCH 0/2] ARM: exynos: Enable TMU support in exynos platforms
Date: Thu, 12 Jul 2012 14:45:41 +0530
Message-ID: <1342084543-8302-1-git-send-email-amit.daniel@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gg0-f174.google.com ([209.85.161.174]:48452 "EHLO
	mail-gg0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752808Ab2GLJQJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jul 2012 05:16:09 -0400
Received: by gglu4 with SMTP id u4so2177021ggl.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Jul 2012 02:16:08 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, amit.kachhap@linaro.org, linux-samsung-soc@vger.kernel.org, lenb@kernel.org

These TMU enablement patches are needed for exynos4 and exynos5 TMU
driver patches sent earlier. The link for those are 
http://www.spinics.net/lists/lm-sensors/msg35858.html.

Also patch 1 depends on combiner dt node patch sent by Thomas Abraham.
(http://www.spinics.net/lists/arm-kernel/msg184129.html)

This patchset is based Samsung Maintainer's tree,
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git for-next

Amit Daniel Kachhap (2):
  ARM: exynos4: Add devicetree node for TMU driver
  ARM: exynos5: Add devicetree node for TMU driver

 arch/arm/boot/dts/exynos4210.dtsi        |    7 +++++++
 arch/arm/boot/dts/exynos5250.dtsi        |    6 ++++++
 arch/arm/mach-exynos/clock-exynos4.c     |    5 +++++
 arch/arm/mach-exynos/clock-exynos5.c     |    5 +++++
 arch/arm/mach-exynos/include/mach/irqs.h |    3 +++
 arch/arm/mach-exynos/include/mach/map.h  |    3 +++
 arch/arm/mach-exynos/mach-exynos4-dt.c   |    2 ++
 arch/arm/mach-exynos/mach-exynos5-dt.c   |    2 ++
 8 files changed, 33 insertions(+), 0 deletions(-)
