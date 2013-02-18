From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH v2 0/7] Add G2D nodes to Exynos4 machines
Date: Mon, 18 Feb 2013 10:32:06 +0530
Message-ID: <1361163733-4338-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:53640 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754668Ab3BRFML (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Feb 2013 00:12:11 -0500
Received: by mail-pa0-f44.google.com with SMTP id kp1so2629532pab.31
        for <linux-samsung-soc@vger.kernel.org>; Sun, 17 Feb 2013 21:12:11 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, s.nawrocki@samsung.com, patches@linaro.org, sachin.kamat@linaro.org

This patch series is based on Kukjin Kim's next/dt-exynos branch of
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tree.

Changes since v1:
* Removed power-domain entry in patch 1/7 as the driver currently
  does not use it.
* Addressed review comments from Sylwester Nawrocki and Tomasz Figa
  in patch 7/7.

Sachin Kamat (7):
  ARM: dts: Add G2D node to exynos4210.dtsi
  ARM: dts: Add G2D node to SMDKV310
  ARM: dts: Add G2D node to exynos4210-origen
  ARM: dts: Add G2D node to exynos4x12.dtsi
  ARM: dts: Add G2D node to SMDK4412
  ARM: dts: Add G2D node to exynos4412-origen
  ARM: dts: Add Samsung G2D DT bindings documentation

 .../devicetree/bindings/gpu/samsung-g2d.txt        |   20 ++++++++++++++++++++
 arch/arm/boot/dts/exynos4210-origen.dts            |    4 ++++
 arch/arm/boot/dts/exynos4210-smdkv310.dts          |    4 ++++
 arch/arm/boot/dts/exynos4210.dtsi                  |    7 +++++++
 arch/arm/boot/dts/exynos4412-smdk4412.dts          |    8 ++++++++
 arch/arm/boot/dts/exynos4x12.dtsi                  |    7 +++++++
 6 files changed, 50 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/samsung-g2d.txt

-- 
1.7.4.1
