From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V5 0/2]  Add DT support for i2s
Date: Thu, 13 Dec 2012 16:12:51 +0530
Message-ID: <1355395373-22058-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:17613 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752811Ab2LMKmC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Dec 2012 05:42:02 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MEY00BJ7TPZNVU0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Dec 2012 19:42:00 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MEY00FYNTPOTH90@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Dec 2012 19:41:59 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma.v@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org
Cc: sbkim73@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, lrg@ti.com, tiwai@suse.de, jassisinghbrar@gmail.com

V5 patches are based on Mark Brown's for-next branch of
"git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git"

Changes since V4:
	- Add a new patch for renaming the samsung i2s secondary fifo interface
	  device name from "samsung-i2s.4" to "samsung-i2s-sec"
	- Add platform_device_id table for the primary and secondary DAIs
	- Avoid using of alias ids in the i2s driver by adding of_device_id
	  table. Primary device can get registered via dt or non-dt but secondary
	  device can get registered only at runtime because the secondary is not
	  physically present on the board.

Changes since V3:
        - Added syntex of gpio specifier as suggested by Mark Brown in
          DT document file
        - Added the requirement for having I2S alias ids
        - Explained about gpio lines
        - Made a seperate patch to get the I2S rclk src clk from alias ID

Changes since V2:
        - Rebased on 3.7-rc3
        - Custom DT bindings are prefixed with samsung
        - As generic device tree DMA helpers not yet mainlined
          I am still using custom dma bindings. So added a
          priliminary statement regarding the same. I will rework
          on my patch once generic DMA helpers are mainlined.

Chnages since V1:
        - Rebased on 3.6-rc6

Padmavathi Venna (2):
  ASoC: Samsung: Rename samsung i2s secondary device name
  ASoC: SAMSUNG: Add DT support for i2s

 .../devicetree/bindings/sound/samsung-i2s.txt      |   75 ++++++
 sound/soc/samsung/dma.c                            |    1 +
 sound/soc/samsung/dma.h                            |    1 +
 sound/soc/samsung/i2s.c                            |  262 ++++++++++++++++----
 sound/soc/samsung/i2s.h                            |    7 -
 sound/soc/samsung/smdk_wm8580.c                    |    7 +-
 sound/soc/samsung/smdk_wm8994.c                    |    4 +-
 7 files changed, 300 insertions(+), 57 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.txt

-- 
1.7.4.4
