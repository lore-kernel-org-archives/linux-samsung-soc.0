From: Shaik Ameer Basha <shaik.ameer@samsung.com>
Subject: [PATCH v2 0/7] exynos5420: clock file cleanup
Date: Thu, 27 Mar 2014 16:37:43 +0530
Message-ID: <1395918470-16374-1-git-send-email-shaik.ameer@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:40894 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755221AbaC0LH4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Mar 2014 07:07:56 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, shaik.samsung@gmail.com, r.sh.open@gmail.com, Shaik Ameer Basha <shaik.ameer@samsung.com>

Many changes/fixes have been identified for clock file for exynos5420.
These include correct parents, bit fields, new clocks etc. Existing
files needs some correction in terms of names of the clock and
indentation. These issues are addressed in this patch series. It also
replaces the usage of enums with macro as clock ids.

This patch series is rebased on,
git://git.kernel.org/pub/scm/linux/kernel/git/tfiga/samsung-clk.git:samsung-next

This patch is also dependent on the following patches.
ARM: dts: Add I2S nodes to exynos5420
ARM: dts: add dt node for sss module for exynos5250/5420
ARM: dts: update watchdog device nodes for exynos5250 and exynos5420
ARM: dts: use macros in clock bindings for exynos5420

Changes since v1:
-----------------
1] Addressed review comments from Tomasz Figa.
    http://www.spinics.net/lists/devicetree/msg16759.html
    http://www.spinics.net/lists/devicetree/msg16760.html

Rahul Sharma (7):
  clk: exynos5420: Add more clock register offsets
  clk: exynos5420: Add more clock IDs
  clk: exynos5420: Rename clock IDs
  clk: exynos5420: Rename clock names
  clk: exynos5420: Add missing clocks
  clk: exynos5420: Add more registers to restore list
  ARM: dts: update macros in clock bindings for exynos5420

 arch/arm/boot/dts/exynos5420.dtsi      |   90 +--
 drivers/clk/samsung/clk-exynos5420.c   | 1029 +++++++++++++++++++++-----------
 include/dt-bindings/clock/exynos5420.h |  214 ++++---
 3 files changed, 871 insertions(+), 462 deletions(-)

-- 
1.7.9.5
