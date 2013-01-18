From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V6 00/10]  Add DT support for i2s
Date: Fri, 18 Jan 2013 17:16:59 +0530
Message-ID: <1358509629-20471-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:47536 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751809Ab3ARLss (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Jan 2013 06:48:48 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGT00CDAKT29D01@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jan 2013 20:48:47 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MGT00LG7KPYX890@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jan 2013 20:48:46 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma.v@samsung.com, padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, vinod.koul@intel.com, grant.likely@secretlab.ca, swarren@nvidia.com, boojin.kim@samsung.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, thomas.abraham@linaro.org, lrg@ti.com, tiwai@suse.de, ben-linux@fluff.org

This patch set is dependent on the following patches from
Vinod Koul next branch
1)of: Add generic device tree DMA helpers
2)dmaengine: add helper function to request a slave DMA channel

and also dependent on
1)DMA: PL330: Add xlate function
2)DMA: PL330: Register the DMA controller with the generic DMA helpers
3)ARM: dts: Add #dma-cells for generic dma binding support
4)DMA: PL330: Modify pl330 filter based on new generic dma dt bindings.

This patch set is made based Kukjin Kim for-next branch

Changes since V5:
	- Add generic DMA DT binding support
	- Change the compatible name as suggested by Grant,Mark and Kukjin
	- Make dma dev request api compatible to DT and non-DT
	- Fix compilation error in dmaengine.h for non-DT case 
	- Add basic device tree based lookup for smdk wm8994 machine file.
	- Make SPI driver use generic DMA DT bindings support

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

Padmavathi Venna (10):
  ASoC: Samsung: Rename samsung i2s secondary device name
  ASoC: SAMSUNG: Add DT support for i2s
  ARM: SAMSUNG: Make dma request compatible to generic dma bindings.
  spi: s3c64xx: Modify SPI driver to use generic DMA DT support
  ARM: dts: Add nodes for i2s controllers for Samsung Exynos5 platforms
  ARM: EXYNOS: Enable platform support for I2S controllers
  ASoC: SMDK: WM8994: Add device tree support for machine file
  ARM: dts: Modify SPI nodes according generic DMA DT bindings
  ASoC: Samsung: Update Kconfig for I2S,SPDIF and PCM audio
  dmaengine: Fix compilation error in non-DT case

 .../bindings/sound/samsung,smdk-wm8994.txt         |   14 ++
 .../devicetree/bindings/sound/samsung-i2s.txt      |   63 +++++
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |   26 +++
 arch/arm/boot/dts/exynos5250.dtsi                  |   44 +++-
 arch/arm/mach-exynos/mach-exynos5-dt.c             |    6 +
 arch/arm/plat-samsung/dma-ops.c                    |   10 +-
 arch/arm/plat-samsung/include/plat/dma-ops.h       |    3 +-
 arch/arm/plat-samsung/s3c-dma-ops.c                |    3 +-
 drivers/spi/spi-s3c64xx.c                          |   77 ++-----
 include/linux/dmaengine.h                          |    2 +-
 sound/soc/samsung/Kconfig                          |    6 +-
 sound/soc/samsung/dma.c                            |    3 +-
 sound/soc/samsung/dma.h                            |    1 +
 sound/soc/samsung/i2s.c                            |  238 ++++++++++++++++----
 sound/soc/samsung/i2s.h                            |    7 -
 sound/soc/samsung/smdk_wm8580.c                    |    7 +-
 sound/soc/samsung/smdk_wm8994.c                    |   30 +++-
 17 files changed, 410 insertions(+), 130 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt
 create mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.txt

-- 
1.7.4.4
