From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH v2 0/6] ARM: dts: Add MFC support for Exynos4
Date: Wed, 30 Jan 2013 12:41:23 +0530
Message-ID: <1359529889-26318-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:53753 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753534Ab3A3HUe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Jan 2013 02:20:34 -0500
Received: by mail-pa0-f48.google.com with SMTP id fa1so918060pad.21
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Jan 2013 23:20:34 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org


Changes since v1:
Addressed comments from Sylwester
  - Updated documentation
  - Added 'status' to the nodes
  - Updated Kconfig entry

This series is based on for-next branch of Kukjin Kim's tree.
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
Sachin Kamat (6):
  ARM: dts: Update MFC DT binding documentation
  ARM: dts: Add MFC codec support for Exynos4 DT machines
  ARM: dts: Add MFC codec support to SMDKV310 DT
  ARM: dts: Add MFC codec support to Origen DT
  ARM: dts: Add MFC codec entry to exynos4412-origen DT file
  ARM: dts: Add MFC codec entry to exynos4412-smdk4412 DT file

 .../devicetree/bindings/media/s5p-mfc.txt          |   21 ++++++++++++++++++++
 arch/arm/boot/dts/exynos4.dtsi                     |    8 +++++++
 arch/arm/boot/dts/exynos4210-origen.dts            |    6 +++++
 arch/arm/boot/dts/exynos4210-smdkv310.dts          |    6 +++++
 arch/arm/boot/dts/exynos4412-origen.dts            |    6 +++++
 arch/arm/boot/dts/exynos4412-smdk4412.dts          |    6 +++++
 arch/arm/mach-exynos/Kconfig                       |    1 +
 arch/arm/mach-exynos/mach-exynos4-dt.c             |   17 ++++++++++++++++
 8 files changed, 71 insertions(+), 0 deletions(-)

-- 
1.7.4.1
