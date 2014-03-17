From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: [PATCH v2 0/3] Add initial support of PMU for exynos5260
Date: Mon, 17 Mar 2014 18:39:52 +0530
Message-ID: <1395061795-17777-1-git-send-email-vikas.sajjan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:34458 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932702AbaCQNJi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Mar 2014 09:09:38 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: vikas.sajjan@samsung.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, Vikas Sajjan <vikas.sajjan@linaro.org>

From: Vikas Sajjan <vikas.sajjan@linaro.org>

1) Added initial PMU support for exynos5260

2) Added S2R(single CPU) support on exynos5260

3) Added PMU mapping via DT.

rebased on
1) kgene tree for-next branch
https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/log/?h=for-next

2) Rahul's patches for basic support of exynos5260
http://www.spinics.net/lists/linux-samsung-soc/msg27282.html

3) Rahul's clk patches http://www.spinics.net/lists/linux-samsung-soc/msg27275.html

4) Tomasz Figa's http://permalink.gmane.org/gmane.linux.ports.arm.kernel/299340

Changes since v1:
	       -- Addressed Tomasz Figa's comments.
	       -- removed CMU patch
	       -- Added PMU mapping via DT

Vikas Sajjan (3):
  ARM: EXYNOS: Map PMU address through DT
  ARM: EXYNOS: Add initial support of PMU for Exynos5260
  arm: exynos5260: add support for S2R

 .../devicetree/bindings/arm/samsung/pmu.txt        |    5 +-
 arch/arm/boot/dts/exynos4.dtsi                     |    5 +
 arch/arm/boot/dts/exynos5260.dtsi                  |    5 +
 arch/arm/mach-exynos/common.c                      |   51 ++--
 arch/arm/mach-exynos/common.h                      |   26 +++
 arch/arm/mach-exynos/include/mach/map.h            |    3 -
 arch/arm/mach-exynos/pm.c                          |   96 ++++++--
 arch/arm/mach-exynos/pmu.c                         |  238 +++++++++++++++++++
 arch/arm/mach-exynos/regs-pmu.h                    |  244 ++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/cpu.h           |    8 +
 10 files changed, 637 insertions(+), 44 deletions(-)

-- 
1.7.9.5
