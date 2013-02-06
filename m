From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 0/7] ARM: dts: Add G2D DT nodes to Exynos4 machines
Date: Wed,  6 Feb 2013 17:21:10 +0530
Message-ID: <1360151477-26460-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:41965 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750782Ab3BFMA6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Feb 2013 07:00:58 -0500
Received: by mail-pa0-f54.google.com with SMTP id fa10so784584pad.27
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Feb 2013 04:00:58 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, s.nawrocki@samsung.com, inki.dae@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

This patch series is based on for-next branch of Kukjin Kim's tree
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git

Patches added on top of MFC DT series which has been accepted by Kukjin.
http://www.spinics.net/lists/linux-samsung-soc/msg15419.html

Sachin Kamat (7):
  ARM: dts: Add G2D node to exynos4210.dtsi
  ARM: dts: Add G2D node to SMDKV310
  ARM: dts: Add G2D node to exynos4210-origen
  ARM: dts: Add G2D node to exynos4x12.dtsi
  ARM: dts: Add G2D node to SMDK4412
  ARM: dts: Add G2D node to exynos4412-origen
  ARM: dts: Add Samsung G2D DT bindings documentation

 .../devicetree/bindings/gpu/samsung-g2d.txt        |   30 ++++++++++++++++++++
 arch/arm/boot/dts/exynos4210-origen.dts            |    4 ++
 arch/arm/boot/dts/exynos4210-smdkv310.dts          |    4 ++
 arch/arm/boot/dts/exynos4210.dtsi                  |    8 +++++
 arch/arm/boot/dts/exynos4412-origen.dts            |    4 ++
 arch/arm/boot/dts/exynos4412-smdk4412.dts          |    4 ++
 arch/arm/boot/dts/exynos4x12.dtsi                  |    7 ++++
 7 files changed, 61 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/samsung-g2d.txt

-- 
1.7.4.1
