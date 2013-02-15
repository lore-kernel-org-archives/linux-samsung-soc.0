From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v4 0/5] Add DRM FIMD DT support for Exynos4 DT Machines
Date: Fri, 15 Feb 2013 12:39:55 +0530
Message-ID: <1360912200-26377-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:47930 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752683Ab3BOHKP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Feb 2013 02:10:15 -0500
Received: by mail-pa0-f52.google.com with SMTP id fb1so1675625pad.39
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Feb 2013 23:10:15 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

This patch series adds support for DRM FIMD DT for Exynos4 DT Machines,
specifically for Exynos4412 SoC.

changes since v3:
	- rebased on
	http://git.kernel.org/?p=linux/kernel/git/kgene/linux-samsung.git;a=shortlog;h=refs/heads/for-next-next

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

Is based on branch "for-next-next"
http://git.kernel.org/?p=linux/kernel/git/kgene/linux-samsung.git;a=shortlog;h=refs/heads/for-next-next

Sachin Kamat (1):
  ARM: dts: Add lcd pinctrl node entries for EXYNOS4412 SoC

Vikas Sajjan (4):
  ARM: dts: Add FIMD node to exynos4
  ARM: dts: Add FIMD node and display timing node to
    exynos4412-origen.dts
  ARM: dts: add FIMD AUXDATA node entry for exynos4 DT
  ARM: exynos: dts: Add FIMD DT binding Documentation

 .../devicetree/bindings/drm/exynos/fimd.txt        |   37 ++++++++++++++++++++
 arch/arm/boot/dts/exynos4.dtsi                     |    7 ++++
 arch/arm/boot/dts/exynos4412-origen.dts            |   22 ++++++++++++
 arch/arm/boot/dts/exynos4x12-pinctrl.dtsi          |   14 ++++++++
 arch/arm/mach-exynos/mach-exynos4-dt.c             |    2 ++
 5 files changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/drm/exynos/fimd.txt

-- 
1.7.9.5
