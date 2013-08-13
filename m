From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCHv3 0/4] device tree support for exynos rotator
Date: Tue, 13 Aug 2013 14:12:55 +0900
Message-ID: <1376370779-26930-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:62296 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753705Ab3HMFNd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Aug 2013 01:13:33 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com, kgene.kim@samsung.com
Cc: dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, mark.rutland@arm.com, l.stach@pengutronix.de, s.nawrocki@samsung.com, tomasz.figa@gmail.com, linux-samsung-soc@vger.kernel.org, sachin.kamat@linaro.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Chanho Park <chanho61.park@samsung.com>

This patchset includes device tree support for rotator of exynos4210/4x12/5250.
Unfortunately, each of them has slightly different limitations of image size.
The rotator can support several image formats(RGB888/555, YCbCr422/420_2/3p).
For convinience, however, exynos drm rotator driver only support RGB888 and
YCbCr420 2-Plane formats. For example, the exynos4210 has 16k x 16k maximum size
. But rest of them has 8k x 8k. In addition, RGB888 X/Y pixel size of exynos5250
should be multiple of 2. But others are multiple of 4.
Thus, we should define different compatibles and limit tables for each chipsets.

This patchset is based on the Kukjin's dt-exynos tree.
(git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
v3.12-next/dt-exynos)

Changes from v2:
 - Remove unnecessary 'of_match_ptr'
 - Consolidate dt support code and documentation into one patch
 - Fix typo and remove status node.

Changes from v1:
 - Added exynos5250 binding.
 - Move limit table into driver code from DT-nodes

Chanho Park (4):
  drm/exynos: add device tree support for rotator
  ARM: dts: Add rotator node for exynos4210
  ARM: dts: Add rotator node for exynos4x12
  ARM: dts: Add rotator node for exynos5250

 .../devicetree/bindings/gpu/samsung-rotator.txt    |   27 +++++
 arch/arm/boot/dts/exynos4.dtsi                     |    8 ++
 arch/arm/boot/dts/exynos4x12.dtsi                  |    4 +
 arch/arm/boot/dts/exynos5250.dtsi                  |    8 ++
 drivers/gpu/drm/exynos/exynos_drm_rotator.c        |  108 +++++++++++++++-----
 5 files changed, 127 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/samsung-rotator.txt

-- 
1.7.9.5
