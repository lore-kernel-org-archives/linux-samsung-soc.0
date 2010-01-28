From: Ben Dooks <ben-linux@fluff.org>
Subject: RFC: change device building for s3c24xx/s3c64xx/s5p series
Date: Thu, 28 Jan 2010 08:23:07 +0000
Message-ID: <20100128082307.GU10014@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:40303 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753914Ab0A1IXJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Jan 2010 03:23:09 -0500
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, Linux Samsung SoC <linux-samsung-soc@vger.kernel.org>

After thinking a bit about the current build for the Samsung architectures
I decided to try the patch included below to change from using Kconfig
to define what is needed to use a build instead.

This is one of the soultions I was thinking about, but does not currently
remove the need for the default setup code for each device... that may be
sorted by a different solution that I will try and sort out a set of
patches for if i feel it will be useful.

If we use the lib target we will end up always building the necessary
device files and then leave it up to the linker to actually pick the ones
that the included board needs. As a note, a small increase in the build
time to ensure that these are created should not be a problem.

Currently we haven't tried the same attempt with the setup code as that
will end up forcing the necessary device definitions into the kernel
unless it is changed to the board calling the necessary default
functions. This would move them out of the SoC setup code, but mean
that all boards would need to be altered. It would also mean that each
board would need to know which SoC it is using.

Any views on the subject would be useful.



>From a199491fc951d114d31d39947d88030bf2d75429 Mon Sep 17 00:00:00 2001
From: Ben Dooks <ben-linux@fluff.org>
Date: Thu, 28 Jan 2010 16:08:44 +0900
Subject: [PATCH] ARM: S3C64XX: Move to using library build for device definitions

To improve the build coverage and to remove the numerous CONFIG_S3C_DEV
defines, try moving the plat-s3c64xx device definition files to be part
of a library.

Due to the fact it seems to be impossible to add libs-y in a platform or
device makefile, we need to add libs-y to arch/arm depending on the
CONFIG_PLAT_S3C64XX. We move the .c files to arch/arm/plat-s3c64xx/devs
as any directories added to libs-y also have their obj-y added to the
build.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/Makefile                            |    1 +
 arch/arm/plat-s3c64xx/Makefile               |    6 ------
 arch/arm/plat-s3c64xx/{ => devs}/dev-adc.c   |    0
 arch/arm/plat-s3c64xx/{ => devs}/dev-audio.c |    0
 arch/arm/plat-s3c64xx/{ => devs}/dev-spi.c   |    0
 5 files changed, 1 insertions(+), 6 deletions(-)
 rename arch/arm/plat-s3c64xx/{ => devs}/dev-adc.c (100%)
 rename arch/arm/plat-s3c64xx/{ => devs}/dev-audio.c (100%)
 rename arch/arm/plat-s3c64xx/{ => devs}/dev-spi.c (100%)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index bbcd512..8f53aa5 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -232,6 +232,7 @@ core-$(CONFIG_VFP)		+= arch/arm/vfp/
 drivers-$(CONFIG_OPROFILE)      += arch/arm/oprofile/
 
 libs-y				:= arch/arm/lib/ $(libs-y)
+libs-$(CONFIG_PLAT_S3C64XX)	+= arch/arm/plat-s3c64xx/devs/
 
 # Default target when executing plain make
 ifeq ($(CONFIG_XIP_KERNEL),y)
diff --git a/arch/arm/plat-s3c64xx/Makefile b/arch/arm/plat-s3c64xx/Makefile
index 80255a5..fd3d0b4 100644
--- a/arch/arm/plat-s3c64xx/Makefile
+++ b/arch/arm/plat-s3c64xx/Makefile
@@ -36,15 +36,9 @@ obj-$(CONFIG_PM)		+= irq-pm.o
 
 obj-$(CONFIG_S3C64XX_DMA)	+= dma.o
 
-# ADC support
-
-obj-$(CONFIG_S3C_ADC)		+= dev-adc.o
-
 # Device setup
 
 obj-$(CONFIG_S3C64XX_SETUP_I2C0) += setup-i2c0.o
 obj-$(CONFIG_S3C64XX_SETUP_I2C1) += setup-i2c1.o
 obj-$(CONFIG_S3C64XX_SETUP_FB_24BPP) += setup-fb-24bpp.o
 obj-$(CONFIG_S3C64XX_SETUP_SDHCI_GPIO) += setup-sdhci-gpio.o
-obj-$(CONFIG_SND_S3C24XX_SOC) += dev-audio.o
-obj-$(CONFIG_SPI_S3C64XX) += dev-spi.o
diff --git a/arch/arm/plat-s3c64xx/dev-adc.c b/arch/arm/plat-s3c64xx/devs/dev-adc.c
similarity index 100%
rename from arch/arm/plat-s3c64xx/dev-adc.c
rename to arch/arm/plat-s3c64xx/devs/dev-adc.c
diff --git a/arch/arm/plat-s3c64xx/dev-audio.c b/arch/arm/plat-s3c64xx/devs/dev-audio.c
similarity index 100%
rename from arch/arm/plat-s3c64xx/dev-audio.c
rename to arch/arm/plat-s3c64xx/devs/dev-audio.c
diff --git a/arch/arm/plat-s3c64xx/dev-spi.c b/arch/arm/plat-s3c64xx/devs/dev-spi.c
similarity index 100%
rename from arch/arm/plat-s3c64xx/dev-spi.c
rename to arch/arm/plat-s3c64xx/devs/dev-spi.c
-- 
1.6.0.4


-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
