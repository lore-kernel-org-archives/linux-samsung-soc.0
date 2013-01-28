From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH 0/5] Add DRM FIMD DT support for Exynos4 DT Machines
Date: Mon, 28 Jan 2013 11:14:27 +0530
Message-ID: <1359351872-20518-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:36002 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751436Ab3A1Foj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jan 2013 00:44:39 -0500
Received: by mail-pa0-f50.google.com with SMTP id hz10so1309290pad.9
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Jan 2013 21:44:38 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, thomas.abraham@linaro.org, sachin.kamat@linaro.org, t.figa@samsung.com, sylvester.nawrocki@gmail.com

This patch series adds support for DRM FIMD DT for Exynos4 DT Machines,
specifically for Exynos4412 SoC.

Is based on branch "for-next"
http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git

Vikas Sajjan (5):
  ARM: dts: Add FIMD node to exynos4
  ARM: dts: Adds lcd pinctrl node entries for SAMSUNG EXYNOS4412 SoC
  ARM: dts: Add FIMD node and display timing node to
    exynos4412-origen.dts
  ARM: dts: adds FIMD AUXDATA node entry for exynos4 DT
  ARM: EXYNOS: Enable backlight and PWM support for Exynos4 DT machines

 arch/arm/boot/dts/exynos4.dtsi            |    7 +++++++
 arch/arm/boot/dts/exynos4412-origen.dts   |   21 +++++++++++++++++++++
 arch/arm/boot/dts/exynos4x12-pinctrl.dtsi |   26 ++++++++++++++++++++++++++
 arch/arm/mach-exynos/Kconfig              |    2 ++
 arch/arm/mach-exynos/mach-exynos4-dt.c    |    4 ++++
 5 files changed, 60 insertions(+)

-- 
1.7.9.5
