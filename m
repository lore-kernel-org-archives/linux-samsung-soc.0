From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V2 0/8] Add audio support on smdk5420
Date: Fri, 26 Jul 2013 19:06:44 +0530
Message-ID: <1374845812-7803-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:54594 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754957Ab3GZNer (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Jul 2013 09:34:47 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQJ007J8PPR45R0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Jul 2013 22:34:45 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: broonie@kernel.org, kgene.kim@samsung.com, abrestic@chromium.org, tomasz.figa@gmail.com

Samsung has different versions of I2S introduced in different
platforms. Each version has some new support added for multichannel,
secondary fifo, s/w reset control, internal mux for rclk src clk and
tdm support. Each newly added change has a quirk. So this patch adds
all the required quirks as driver data and based on compatible string
from dtsi fetches the quirks. This also adds i2s support on exynos5420
and make relevent changes in the dtsi files.

Changes since V1:
	- Pass quirks as driver data and fetch the quirks based on
	  compatible string from dtsi file as suggested by
	  Tomasz Figa and Mark Brown
	- Make the I2S driver more flexible with respect to register
	  access as suggested by Tomasz Figa and Mark Brown
	- Add 5420 support in the driver.
	- Modify the dtsi files with the corresponding compatible
	  strings and removed the i2s quirks from 5250 dtsi file.
	- Updated the i2s Documentation with relevent changes and
	  i2s versioning info.
	- Add i2s nodes on exynos5420.dtsi
	- Enable sound support on smdk5420

This patch set is dependent on the following dma and audio subsystem
clk controller patches.
http://comments.gmane.org/gmane.linux.kernel.samsung-soc/20661
http://comments.gmane.org/gmane.linux.kernel.samsung-soc/20668

This patch set is made based on Kukjin Kim for-next branch.

Andrew Bresticker (1):
  ARM: dts: exynos5420: add i2s controllers

Padmavathi Venna (7):
  platform: Increase platform name size
  ASoC: Samsung: I2S: Add quirks as driver data in I2S
  ARM: dts: Change i2s compatible string on exynos5250
  ASoC: Samsung: I2S: Modify driver to give more flexibility
  ASoC: Samsung: I2S: Modify the I2S driver to support I2S on
    Exynos5420
  ARM: dts: wm8994: Add wm8994 support on smdk5420
  ARM: dts: Enable sound support on smdk5420

 .../devicetree/bindings/sound/samsung-i2s.txt      |   25 ++-
 arch/arm/boot/dts/exynos5250.dtsi                  |    9 +-
 arch/arm/boot/dts/exynos5420-smdk5420.dts          |   60 ++++++
 arch/arm/boot/dts/exynos5420.dtsi                  |   44 +++++
 include/linux/mod_devicetable.h                    |    2 +-
 include/linux/platform_data/asoc-s3c.h             |    1 +
 sound/soc/samsung/i2s-regs.h                       |   51 ++++--
 sound/soc/samsung/i2s.c                            |  205 +++++++++++++++-----
 8 files changed, 312 insertions(+), 85 deletions(-)

-- 
1.7.4.4
