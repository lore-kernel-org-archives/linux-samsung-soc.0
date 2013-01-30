From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v2 0/5] Add DRM FIMD DT support for Exynos4 DT Machines
Date: Wed, 30 Jan 2013 17:29:22 +0530
Message-ID: <1359547167-16560-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f44.google.com ([209.85.210.44]:45777 "EHLO
	mail-da0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751482Ab3A3L7e (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Jan 2013 06:59:34 -0500
Received: by mail-da0-f44.google.com with SMTP id z20so749017dae.17
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Jan 2013 03:59:34 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, thomas.abraham@linaro.org, sachin.kamat@linaro.org, t.figa@samsung.com, sylvester.nawrocki@gmail.com

This patch series adds support for DRM FIMD DT for Exynos4 DT Machines,
specifically for Exynos4412 SoC.

changes since v1:
	- added new patch to add FIMD DT binding Documentation
	- removed patch enabling SAMSUNG_DEV_BACKLIGHT and SAMSUNG_DEV_PMW 
	for mach-exynos4 DT
	- added 'status' property to fimd DT node

Is based on branch "for-next"
http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git

Sachin Kamat (1):
  ARM: dts: Adds lcd pinctrl node entries for SAMSUNG EXYNOS4412 SoC

Vikas Sajjan (4):
  ARM: dts: Add FIMD node to exynos4
  ARM: dts: Add FIMD node and display timing node to
    exynos4412-origen.dts
  ARM: dts: adds FIMD AUXDATA node entry for exynos4 DT
  ARM: exynos: dts: Add FIMD DT binding Documentation

 .../devicetree/bindings/drm/exynos/fimd.txt        |   37 ++++++++++++++++++++
 arch/arm/boot/dts/exynos4.dtsi                     |    7 ++++
 arch/arm/boot/dts/exynos4412-origen.dts            |   22 ++++++++++++
 arch/arm/boot/dts/exynos4x12-pinctrl.dtsi          |   26 ++++++++++++++
 arch/arm/mach-exynos/mach-exynos4-dt.c             |    4 +++
 5 files changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/drm/exynos/fimd.txt

-- 
1.7.9.5
