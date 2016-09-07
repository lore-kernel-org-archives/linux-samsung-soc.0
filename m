From: Randy Li <ayaka@soulik.info>
Subject: [PATCH v6 0/3] Add a new board TOPEET iTOP for Exynos 4412
Date: Thu,  8 Sep 2016 05:58:52 +0800
Message-ID: <1473285535-21996-1-git-send-email-ayaka@soulik.info>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from kozue.soulik.info ([108.61.200.231]:54132 "EHLO
        kozue.soulik.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752563AbcIGV7L (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Sep 2016 17:59:11 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: mark.rutland@arm.com, linux@armlinux.org.uk, kgene@kernel.org, krzk@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, Randy Li <ayaka@soulik.info>

Changelog:
  v6:
    move pwms pinctrl to pwms node
    fix the order of the dtb file in Makefile
 - v5:
   - correct the mail format
 - v4:
   - re-order some nodes in alphabetical order
   - fix some minor bugs
   - add a entry in vendor list
 - v3:
   - fixing the rtc clock, using clock source from PMIC
   - enable the tmu
   - enable the fimc for elite board
   - suuport the audio codec at elite board
   - fixing minor bugs in the last commit
 - v2:
   - removing rtc node
     the clock source driver is not done yet.
   - adding exynos-bus
   - fixing the MFC

Randy Li (3):
  ARM: dts: Add TOPEET itop core board SCP package version
  ARM: dts: add TOPEET itop elite based board
  devicetree: bindings: Add vendor prefix for Topeet.

 .../bindings/arm/samsung/samsung-boards.txt        |   3 +
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/exynos4412-itop-elite.dts        | 239 ++++++++++
 arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi    | 490 +++++++++++++++++++++
 5 files changed, 734 insertions(+)
 create mode 100644 arch/arm/boot/dts/exynos4412-itop-elite.dts
 create mode 100644 arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi

-- 
2.7.4
