From: Shirish S <s.shirish@samsung.com>
Subject: [PATCH 0/3] Add dt support for exynos hdmiphy settings
Date: Thu, 15 Aug 2013 08:57:02 +0530
Message-ID: <1376537225-3815-1-git-send-email-s.shirish@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:25453 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759979Ab3HODEv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 23:04:51 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, airlied@linux.ie, kgene.kim@samsung.com, shirish@chromium.org

For various revision of chipset if the signal pattern is changed for every 
board, then the phy setting need to be updated correspondingly by measuring
the signal.
With the hdmiphy settings fixed in the driver the only way currently is to
either add a new structure or add compile time option.
To avoid this, we can move the same to dt, wherin we can have different dt
files for every revision. This patchset can be considered as an initiative
towards achieving the same for exynos 5250 and can be later extended to
future chipsets.
Also this patchset moves the entire structure to dt file as-is in the 
driver and hence we can find all the hex values, which are not logically
explained similar to driver.

Shirish S (3):
  ARM: dts: smdk5250: Add hdmi phy settings
  ARM: dts: arndale:  Add hdmi phy settings
  drm: exynos: hdmi: Add dt support for hdmiphy settings

 .../devicetree/bindings/video/exynos_hdmi.txt      |   18 +-
 arch/arm/boot/dts/exynos5250-arndale.dts           |  120 ++++++++++++
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |  120 ++++++++++++
 drivers/gpu/drm/exynos/exynos_hdmi.c               |  191 +++++++-------------
 4 files changed, 320 insertions(+), 129 deletions(-)

-- 
1.7.10.4
