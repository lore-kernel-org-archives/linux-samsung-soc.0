From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 0/8] DMA: s3c64xx: Conversion to the new channel request API
Date: Thu, 10 Nov 2016 16:17:48 +0100
Message-ID: <1478791076-19528-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:44690 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933884AbcKJPSZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Nov 2016 10:18:25 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: krzk@kernel.org, vinod.koul@intel.com, kgene@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, broonie@kernel.org, ckeepax@opensource.wolfsonmicro.com, ym0914@gmail.com, arnd@arndb.de, javier@osg.samsung.com, andi.shyti@samsung.com, sbkim73@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

This patch series aims to convert the s3c64xx platform to use
the new DMA channel request API, i.e. this is only meaningful 
for non-dt systems using s3c64xx SoCs.

Presumably the first 2 or 4 patches in this series could be queued 
for v4.10-rc1 and the remaining patches could be left for subsequent
release, to avoid non-trivial conflict with patches already applied 
in the ASoC tree.

The whole series can be pulled from git repository:
 git://linuxtv.org/snawrocki/samsung.git 
 branch: for-v4.10/dma/pl080-s3c64xx-v2

Thanks.

Sylwester Nawrocki (8):
  dma: pl08x: Add support for the DMA slave map
  ARM: s3c64xx: Add DMA slave maps for PL080 devices
  spi: s3c64xx: Do not use platform_data for DMA parameters
  ARM: s3c64xx: Drop unused DMA fields from struct s3c64xx_spi_csinfo
  ASoC: samsung: i2s: Do not use platform_data for DMA parameters
  ASoC: samsung: pcm: Do not use platform_data for DMA parameters
  ARM: s3c64xx: Drop initialization of unused struct s3c_audio_pdata
    fields
  ARM: s3c24xx: Drop unused struct s3c_audio_pdata entries

 arch/arm/mach-s3c64xx/dev-audio.c         | 19 --------------
 arch/arm/mach-s3c64xx/pl080.c             | 32 +++++++++++++++++++++++
 arch/arm/plat-samsung/devs.c              | 43 -------------------------------
 drivers/dma/amba-pl08x.c                  | 11 ++++++++
 drivers/spi/spi-s3c64xx.c                 | 21 +++------------
 include/linux/amba/pl08x.h                |  4 +++
 include/linux/platform_data/spi-s3c64xx.h |  3 ---
 sound/soc/samsung/i2s.c                   | 14 ++--------
 sound/soc/samsung/pcm.c                   | 14 ++++------
 9 files changed, 58 insertions(+), 103 deletions(-)

-- 
1.9.1
