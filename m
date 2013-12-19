From: Shirish S <s.shirish@samsung.com>
Subject: [PATCH 0/4]  Add dt support for exynos hdmiphy settings
Date: Thu, 19 Dec 2013 17:42:24 +0530
Message-ID: <1387455148-22999-1-git-send-email-s.shirish@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:46013 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756004Ab3LSMJx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Dec 2013 07:09:53 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, devicetree@vger.kernel.org, t.figa@samsung.com
Cc: kgene.kim@samsung.com, s.nawrocki@samsung.com, shirish@chromium.org, linux-samsung-soc@vger.kernel.org, Shirish S <s.shirish@samsung.com>

For various revisions of a chipset if the signal pattern is changed for every
revision, then the phy setting need to be updated correspondingly by measuring
the signal.
For getting correct signals the clock level and data de-emphasis 
levels needs to be adjusted.
Since only these 2 values matter,we can move the same to dt, 
wherein we can have different dt files for every revision. 

This is an initial patchset towards achieving the same 
for exynos 5250 and can be later extended to future chipsets.

V2: replaced moving of entire phy config structure with only
required and justifiable conf registers.

V3: Incorporated Mark Rutland's comments.

V4: Rebased and included cros5250-common.dtsi.

V5: removed nr-configs feild and also the constraint
    of having the exact number of configs in the dt file
    as in the driver, the programmer can add only the pixel
    clock that needs to be updated.

V6:
V7: removed nr-configs form the dtsi files.

V8: Fixed build error

V9: rebased and incorporated Tomasz comments.


Shirish S (4):
  ARM: dts: smdk5250: Add hdmi phy settings
  ARM: dts: arndale: Add hdmi phy settings
  ARM: exynos: dts: cros5250: Add hdmi phy settings
  drm: exynos: hdmi: Add dt support for hdmiphy settings

 .../devicetree/bindings/video/exynos_hdmi.txt      |   34 ++++++++
 arch/arm/boot/dts/cros5250-common.dtsi             |   74 ++++++++++++++++
 arch/arm/boot/dts/exynos5250-arndale.dts           |   74 ++++++++++++++++
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |   74 ++++++++++++++++
 drivers/gpu/drm/exynos/exynos_hdmi.c               |   89 ++++++++++++++++----
 5 files changed, 327 insertions(+), 18 deletions(-)

-- 
1.7.9.5
