From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v3 0/5] Add DRM FIMD DT support for Exynos4 DT Machines
Date: Fri,  1 Feb 2013 17:02:51 +0530
Message-ID: <1359718376-21947-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f48.google.com ([209.85.210.48]:55476 "EHLO
	mail-da0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755681Ab3BALdC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Feb 2013 06:33:02 -0500
Received: by mail-da0-f48.google.com with SMTP id k18so1727307dae.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Feb 2013 03:33:01 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org

This patch series adds support for DRM FIMD DT for Exynos4 DT Machines,
specifically for Exynos4412 SoC.

changes since v2:
	- added alias to 'fimd@11c00000' node
		(reported by: Rahul Sharma <r.sh.open@gmail.com>)
	- removed 'lcd0_data' node as there was already a similar node lcd_data24
		(reported by: Jingoo Han <jg1.han@samsung.com>
	- replaced spaces with tabs in display-timing node

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
 arch/arm/boot/dts/exynos4x12-pinctrl.dtsi          |   14 ++++++++
 arch/arm/mach-exynos/mach-exynos4-dt.c             |    4 +++
 5 files changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/drm/exynos/fimd.txt

-- 
1.7.9.5
