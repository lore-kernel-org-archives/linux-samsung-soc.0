From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH 0/3] Power-domain clk handling
Date: Fri, 23 May 2014 10:38:09 +0530
Message-ID: <1400821692-22370-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f45.google.com ([209.85.160.45]:35499 "EHLO
	mail-pb0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750961AbaEWFIV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 May 2014 01:08:21 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: t.figa@samsung.com, kgene.kim@samsung.com, mark.rutland@arm.com, pawel.moll@arm.com, swarren@wwwdotorg.org, prathyush.k@samsung.com, abrestic@chromium.org, arunkk.samsung@gmail.com

This patchset enables the clk handling in power domain for
working as per the recommended power domain on / off sequence for
exynos5 SoCs. I have posted an RFC for the same [1] and didnt get any
review comments / objections. So I am dropping the RFC tag and
posting the patch along with the required clk and dt support.

[1] https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg30479.html

Arun Kumar K (2):
  clk: exynos5420: Add IDs for clocks used in PD mfc
  ARM: dts: Add clock property for mfc_pd in 5420

Prathyush K (1):
  ARM: EXYNOS: Add support for clock handling in power domain

 .../bindings/arm/exynos/power_domain.txt           |   18 +++++++
 arch/arm/boot/dts/exynos5420.dtsi                  |    3 ++
 arch/arm/mach-exynos/pm_domains.c                  |   56 +++++++++++++++++++-
 drivers/clk/samsung/clk-exynos5420.c               |    6 ++-
 include/dt-bindings/clock/exynos5420.h             |    2 +
 5 files changed, 82 insertions(+), 3 deletions(-)

-- 
1.7.9.5
