From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung fixes for 2.6.38-rc8
Date: Tue, 08 Mar 2011 07:57:57 +0900
Message-ID: <038701cbdd1b$1c11b890$543529b0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:63556 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755554Ab1CGW6D (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Mar 2011 17:58:03 -0500
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Linus Torvalds' <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Hi Linus,

Please pull Samsung fixes from:

git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
s5p-fixes-for-linus

These things are for small fixes on 2.6.38-rc8.
If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit dd9c1549edef02290edced639f67b54a25abbe0e:

  Linux 2.6.38-rc7 (2011-03-01 13:55:12 -0800)

are available in the git repository at:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
s5p-fixes-for-linus

Banajit Goswami (1):
      ARM: S5P64X0: Fix number of GPIO lines in Bank F

Ben Dooks (3):
      ARM: S3C64XX: Fix keypad setup to configure correct number of rows
      ARM: S3C64XX: Add clock for i2c1
      ARM: S3C64XX: Reduce output of s3c64xx_dma_init1()

Lars-Peter Clausen (2):
      ARM: S3C2440: Select missing S3C_DEV_USB_HOST on GTA02
      ARM: S3C2440: Fix usage gpio bank j pin definitions on GTA02

Mark Brown (5):
      ARM: SAMSUNG: Include devs.h in dev-uart.c to prototype devices
      ARM: S3C64XX: Staticise non-exported GPIO to interrupt functions
      ARM: S3C64XX: Tone down SDHCI debugging
      ARM: S3C64XX: Fix build with WM1190 disabled and WM1192 enabled on
SMDK6410
      ARM: S3C64XX: Update regulator names for debugfs compatiblity on
SMDK6410

 arch/arm/mach-s3c2440/Kconfig              |    1 +
 arch/arm/mach-s3c2440/include/mach/gta02.h |   26
+++++++++++++-------------
 arch/arm/mach-s3c64xx/clock.c              |    6 ++++++
 arch/arm/mach-s3c64xx/dma.c                |   11 ++++++-----
 arch/arm/mach-s3c64xx/gpiolib.c            |    4 ++--
 arch/arm/mach-s3c64xx/mach-smdk6410.c      |   13 +++++++------
 arch/arm/mach-s3c64xx/setup-keypad.c       |    2 +-
 arch/arm/mach-s3c64xx/setup-sdhci.c        |    2 +-
 arch/arm/mach-s5p64x0/include/mach/gpio.h  |    4 ++--
 arch/arm/plat-samsung/dev-uart.c           |    2 ++
 10 files changed, 41 insertions(+), 30 deletions(-)
