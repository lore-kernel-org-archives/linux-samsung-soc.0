From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 0/2] ARM: Exynos: Add DT based I/O mapping for Chip-ID controller
Date: Mon, 18 Feb 2013 13:24:57 +0530
Message-ID: <1361174099-18749-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f51.google.com ([209.85.210.51]:33480 "EHLO
	mail-da0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753527Ab3BRHz1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Feb 2013 02:55:27 -0500
Received: by mail-da0-f51.google.com with SMTP id n15so2353481dad.24
        for <linux-samsung-soc@vger.kernel.org>; Sun, 17 Feb 2013 23:55:26 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, t.figa@samsung.com, sylvester.nawrocki@gmail.com

This patch series allows device tree enabled platforms to setup a runtime
I/O mapping for the chip-id controller. This helps to remove statically
defined I/O mapping for the Chip-ID controller.

Thomas Abraham (2):
  ARM: Exynos: Create virtual I/O mapping for Chip-ID controller using device tree
  ARM: dts: Add chip-id controller node on Exynos4/5 SoC

 .../arm/samsung/samsung,exynos4210-chipid.txt      |   15 ++++++
 arch/arm/boot/dts/exynos4.dtsi                     |    5 ++
 arch/arm/boot/dts/exynos5250.dtsi                  |    5 ++
 arch/arm/mach-exynos/common.c                      |   53 +++++++++++---------
 arch/arm/mach-exynos/include/mach/map.h            |    1 -
 5 files changed, 55 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/samsung/samsung,exynos4210-chipid.txt

-- 
1.7.5.4
