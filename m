From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v3 0/3] exynos5420/hdmi: add support for hdmi subsystem
Date: Wed, 19 Jun 2013 18:21:06 +0530
Message-ID: <1371646269-21880-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:55841 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934141Ab3FSM2Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Jun 2013 08:28:16 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MON00HBJ3YWV1V0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Jun 2013 21:28:15 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, l.stach@pengutronix.de, tomasz.figa@gmail.com, rob.herring@calxeda.com, s.nawrocki@samsung.com, grant.likely@linaro.org, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Add support for exynos5420 hdmi subsystem. It adds compatible strings
for exynos5420 mixer and Changes the drivers as per IP modifications.

This set doesn't have changes for hdmiphy, which will posted
independently.

This set is based on drm-next branch of Inki Dae's tree at
http://git.kernel.org/cgit/linux/kernel/git/daeinki/drm-exynos.git.

v3:
1) instead of replacing with old compatible strings, new ones are added
without removing the support for older ones.
2) removed patch "drm/exynos: fix interlace resolutions for exynos5420" as
it is independently merged.

v2:
1)update device mixer tree binding document with "samsung,exynos5420-mixer"

Rahul Sharma (3):
  drm/exynos: add new compatible strings for hdmi subsystem
  drm/exynos: add support for exynos5420 mixer
  ARM/dts: change compatible strings for hdmi subsystem

 .../devicetree/bindings/video/exynos_hdmi.txt      |    7 ++-
 .../devicetree/bindings/video/exynos_hdmiddc.txt   |    7 ++-
 .../devicetree/bindings/video/exynos_hdmiphy.txt   |    7 ++-
 .../devicetree/bindings/video/exynos_mixer.txt     |    9 ++-
 arch/arm/boot/dts/cros5250-common.dtsi             |    4 +-
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |    4 +-
 arch/arm/boot/dts/exynos5250.dtsi                  |    4 +-
 drivers/gpu/drm/exynos/exynos_ddc.c                |    2 +
 drivers/gpu/drm/exynos/exynos_hdmi.c               |    3 +
 drivers/gpu/drm/exynos/exynos_hdmiphy.c            |    4 ++
 drivers/gpu/drm/exynos/exynos_mixer.c              |   62 ++++++++++++++------
 drivers/gpu/drm/exynos/regs-mixer.h                |    7 +++
 12 files changed, 89 insertions(+), 31 deletions(-)

-- 
1.7.10.4
