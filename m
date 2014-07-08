From: Arun Kumar K <arun.kk@samsung.com>
Subject: [RESEND PATCHv2 0/3] Power-domain clk handling
Date: Tue,  8 Jul 2014 10:24:31 +0530
Message-ID: <1404795274-27307-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:56745 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750747AbaGHEyl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jul 2014 00:54:41 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, mark.rutland@arm.com, pawel.moll@arm.com, swarren@wwwdotorg.org, prathyush.k@samsung.com, abrestic@chromium.org, shaik.ameer@samsung.com, arunkk.samsung@gmail.com

This patch series for clock handling in power domain is
re-send for merging after rebasing onto latest linux-samsung.git,
for-next branch.
Original series and discussion can be found here:
https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg31550.html

Arun Kumar K (2):
  clk: exynos5420: Add IDs for clocks used in PD mfc
  ARM: dts: Add clock property for mfc_pd in 5420

Prathyush K (1):
  ARM: EXYNOS: Add support for clock handling in power domain

 .../bindings/arm/exynos/power_domain.txt           |   20 +++++++
 arch/arm/boot/dts/exynos5420.dtsi                  |    3 +
 arch/arm/mach-exynos/pm_domains.c                  |   61 +++++++++++++++++++-
 drivers/clk/samsung/clk-exynos5420.c               |    6 +-
 include/dt-bindings/clock/exynos5420.h             |    2 +
 5 files changed, 89 insertions(+), 3 deletions(-)

-- 
1.7.9.5
