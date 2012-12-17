From: Dongjin Kim <tobetter@gmail.com>
Subject: [PATCH 0/4] ODROID-X: Adding dt-based ODROID-X support
Date: Tue, 18 Dec 2012 04:55:03 +0900
Message-ID: <1355774107-364-1-git-send-email-tobetter@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f46.google.com ([209.85.210.46]:33832 "EHLO
	mail-da0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752535Ab2LQT40 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Dec 2012 14:56:26 -0500
Received: by mail-da0-f46.google.com with SMTP id p5so3008699dak.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Dec 2012 11:56:25 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, Dongjin Kim <tobetter@gmail.com>

This patch set adds DT-based board file for Hardkernel's ODROID-X which is
based on Samsung's Exynos4412 SoC. In the current version had been tested
supporting SDCARD, eMMC and LED blinking.


Dongjin Kim (4):
  ODROID-X: dts: Add board dts file for ODROID-X
  ODROID-X: dts: Add fixed-regulator for peripherals.
  ODROID-X: dts: Add nodes for leds based on GPIO.
  ODROID-X: dts: Add mshc node for ODROID-X board

 arch/arm/boot/dts/Makefile               |    1 +
 arch/arm/boot/dts/exynos4412-odroidx.dts |   97 ++++++++++++++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 arch/arm/boot/dts/exynos4412-odroidx.dts

-- 
1.7.9.5
