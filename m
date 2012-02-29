From: Karol Lewandowski <k.lewandowsk@samsung.com>
Subject: [PATCH 0/3] [media] s5p-tv: Add initial DT-support to s5p-tv's
 subdevices
Date: Wed, 29 Feb 2012 15:51:44 +0100
Message-ID: <1330527107-21222-1-git-send-email-k.lewandowsk@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:41393 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756086Ab2B2OwN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Feb 2012 09:52:13 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: t.stanislaws@samsung.com
Cc: m.szyprowski@samsung.com, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, thomas.abraham@linaro.org, Karol Lewandowski <k.lewandowsk@samsung.com>

This patchset adds initial device tree support to drivers used by
s5p-tv on Exynos4.

DT support for s5p-tv driver itself would benefit from changes to v4l
core (missing OF helper functions) and thus, will be sent later in
separate patchset.

Karol Lewandowski (3):
  [media] s5p-tv: Add initial DT-support for sii9234
  [media] s5p-tv: Add initial DT-support for HDMIPHY
  [media] s5p-tv: Add initial DT-support for TV mixer

 Documentation/devicetree/bindings/i2c/sii9234.txt |   14 ++++++++++++++
 drivers/media/video/s5p-tv/hdmiphy_drv.c          |   10 ++++++++++
 drivers/media/video/s5p-tv/mixer_drv.c            |    9 +++++++++
 drivers/media/video/s5p-tv/sii9234_drv.c          |   20 +++++++++++++++++++-
 4 files changed, 52 insertions(+), 1 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/sii9234.txt

-- 
1.7.8.3
