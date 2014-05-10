From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v3 0/3] Add PMU node for Exynos4 SoCs
Date: Sat, 10 May 2014 15:46:22 +0900
Message-ID: <1399704385-12508-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:43585 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751166AbaEJG2L (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 10 May 2014 02:28:11 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kgene.kim@samsung.com, robh+dt@kernel.org, t.figa@samsung.com, chow.kim@samsung.com, yg1004.jang@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

This patch updates Exynos4210, Exynos4412 and Exynos4212 dtsi files
for adding PMU (Power Management Unit) reg node.
Updated binding document for the same.

These patches are required for converting PMU implementation free from
static mapping of PMU registers as well as it's dependency from machine
header files, thus allowing us to converting it into DT based.

Revision 2 was posted here 
 - https://lkml.org/lkml/2014/4/25/216 

Changes since v2:
 - Dropped addition of new property followed by one simple fix in syscon driver
   posted here [1].
 - Addressed review comments [2] by Tomasz Figa about property pointing back to
   self device node.
 - Updated binding doc with example.

Changes since v1:
 - Added new property "samsung,syscon-phandle" to get access to PMU regmap handle.
 - Updated Exynos5250, Exynos5420, Exynos4210/4412/4212 dtsi files.
 - Rebased on Kukjin Kim's for-next branch.

[1]: Allow NULL property in syscon_early_regmap_lookup_by_phandle
     https://lkml.org/lkml/2014/5/10/10 and
     https://lkml.org/lkml/2014/4/29/661

[2]: https://lkml.org/lkml/2014/4/25/762

Pankaj Dubey (3):
  ARM: dts: Add PMU node to exynos4210
  ARM: dts: Add PMU node to exynos4212 and exynos4412
  Documentation: update samsung pmu binding information

 Documentation/devicetree/bindings/arm/samsung/pmu.txt |    3 +++
 arch/arm/boot/dts/exynos4210.dtsi                     |    5 +++++
 arch/arm/boot/dts/exynos4212.dtsi                     |    5 +++++
 arch/arm/boot/dts/exynos4412.dtsi                     |    5 +++++
 4 files changed, 18 insertions(+)

-- 
1.7.10.4
