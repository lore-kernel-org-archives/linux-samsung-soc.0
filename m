From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH V5 0/2] video: drm: Add Device tree support to DRM-FIMD
Date: Fri, 07 Sep 2012 14:37:36 +0530
Message-ID: <1347008858-12069-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:62659 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752105Ab2IGEsD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Sep 2012 00:48:03 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9Y00DKWQNF1PC0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Sep 2012 13:48:01 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9Y003HDQN3MW30@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Sep 2012 13:48:00 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, devicetree-discuss@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, kgene.kim@samsung.com, m.szyprowski@samsung.com, laurent.pinchart@ideasonboard.com

This patch set adds device tree support for DRM-FIMD for Samsung's Exynos5250.
It includes parsing platform data from dts file. Also, adds the driver data
for exynos4 and exynos5 devices.

This patchset is based and tested on top of v3.6-rc4 on smdk5250 board
Also depends on below patchset
http://lists.freedesktop.org/archives/dri-devel/2012-August/026076.html

Changes since V4:
	- Changed the compatible string from "samsung,exynos4-fb" to
	  "samsung,exynos4-fimd".

Changes since V3:
        - Removed the fimd version from driver data and using timing base
          address instead
        - Removed the drm_ prefixes to the structures and fucntions

Changes since V2:
        - Added driver data to exynos5-drm-fimd as per Marek Szyprowski suggestion

Changes since V1:
        - Corrected typo errors and changed compatibility string

Leela Krishna Amudala (2):
  drm/exynos: add platform_device_id table and driver data for drm fimd
  video: drm: exynos: Add device tree support

 Documentation/devicetree/bindings/fb/drm-fimd.txt |   80 ++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_fimd.c          |  138 ++++++++++++++++++++-
 2 files changed, 212 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/fb/drm-fimd.txt
