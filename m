From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH] ARM: S3C64XX: Make audio device code built unconditionally
Date: Fri, 29 Jan 2010 04:14:19 +0000
Message-ID: <1264738459-1972-7-git-send-email-ben-linux@fluff.org>
References: <1264738459-1972-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:37382 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756664Ab0A2EOU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Jan 2010 23:14:20 -0500
In-Reply-To: <1264738459-1972-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Making the code depend on CONFIG_SND_S3C24XX_SOC means that if the ASoC
code is build modularily, the boards will fail to link due to the device
code also being built as a module.

As per Mark Brown's suggestions, just compile this always as it is expected
many machines will have audio.

Also move the obj-y line out of the device setup area into a new area just
for devices.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/plat-s3c64xx/Makefile |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-s3c64xx/Makefile b/arch/arm/plat-s3c64xx/Makefile
index e60bde3..33a73f3 100644
--- a/arch/arm/plat-s3c64xx/Makefile
+++ b/arch/arm/plat-s3c64xx/Makefile
@@ -43,10 +43,13 @@ obj-$(CONFIG_S3C_ADC)		+= dev-adc.o
 # SPI support
 obj-$(CONFIG_S3C64XX_DEV_SPI) += dev-spi.o
 
+# Device support
+obj-y				+= dev-audio.o
+
 # Device setup
 
 obj-$(CONFIG_S3C64XX_SETUP_I2C0) += setup-i2c0.o
 obj-$(CONFIG_S3C64XX_SETUP_I2C1) += setup-i2c1.o
 obj-$(CONFIG_S3C64XX_SETUP_FB_24BPP) += setup-fb-24bpp.o
 obj-$(CONFIG_S3C64XX_SETUP_SDHCI_GPIO) += setup-sdhci-gpio.o
-obj-$(CONFIG_SND_S3C24XX_SOC) += dev-audio.o
+
-- 
1.6.0.4
