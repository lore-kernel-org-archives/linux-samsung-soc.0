From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH Resend 0/6] ARM: dts: Add MFC support for Exynos4
Date: Tue, 29 Jan 2013 09:43:36 +0530
Message-ID: <1359432822-23846-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:34438 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753323Ab3A2EWo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jan 2013 23:22:44 -0500
Received: by mail-pa0-f42.google.com with SMTP id rl6so130517pac.15
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Jan 2013 20:22:44 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Resending this series after adding support for some Exynos4412 boards
(patches 5 and 6) and renaming the patch titles to "ARM: dts: ".

This series is based on for-next branch of Kukjin Kim's tree.
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git

Sachin Kamat (6):
  ARM: dts: Update MFC DT binding documentation
  ARM: dts: Add MFC codec support for Exynos4 DT machines
  ARM: dts: Add MFC codec support to SMDKV310 DT
  ARM: dts: Add MFC codec support to Origen DT
  ARM: dts: Add MFC codec entry to exynos4412-origen DT file
  ARM: dts: Add MFC codec entry to exynos4412-smdk4412 DT file

 .../devicetree/bindings/media/s5p-mfc.txt          |   13 +++++++++++++
 arch/arm/boot/dts/exynos4.dtsi                     |    7 +++++++
 arch/arm/boot/dts/exynos4210-origen.dts            |    5 +++++
 arch/arm/boot/dts/exynos4210-smdkv310.dts          |    5 +++++
 arch/arm/boot/dts/exynos4412-origen.dts            |    5 +++++
 arch/arm/boot/dts/exynos4412-smdk4412.dts          |    5 +++++
 arch/arm/mach-exynos/mach-exynos4-dt.c             |   17 +++++++++++++++++
 7 files changed, 57 insertions(+), 0 deletions(-)

-- 
1.7.4.1
