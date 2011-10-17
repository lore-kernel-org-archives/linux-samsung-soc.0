From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung devel-3 for v3.2
Date: Mon, 17 Oct 2011 13:42:50 +0900
Message-ID: <000501cc8c87$39960b70$acc22250$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:48355 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751721Ab1JQEmv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Oct 2011 00:42:51 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LT700CP412YEMM0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Oct 2011 13:42:50 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LT7009PT13D9T10@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Mon, 17 Oct 2011 13:42:49 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Russell King' <rmk+kernel@arm.linux.org.uk>, 'Ben Dooks' <ben-linux@fluff.org>

Hi Arnd,

This is for Samsung devel stuff for v3.2 and based on previous
next-samsung-devel-2.

Please pull from:
 git://github.com/kgene/linux-samsung.git next-samsung-devel-3

If any problems, please let me know.

As a note, I need to sort out DT patches from Thomas and prepare reorganize
arch/arm/mach-exynos based on latest arm-soc.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 6b6844dd54e4196dd9818bc63b319f93c37a08be:

  ARM: S5P64X0: Add Power Management support (2011-10-04 20:31:24 +0900)

are available in the git repository at:
  git://github.com/kgene/linux-samsung.git next-samsung-devel-3

Axel Lin (1):
      ARM: S3C2443: Remove redundant s3c_register_clocks call for
init_clocks

Heiko St?bner (2):
      ARM: S3C2443: Move clk_arm and clk_armdiv to common code
      ARM: S3C2416: Add comment describing the armdiv/armclk

Heiko Stuebner (12):
      ARM: SAMSUNG: Add adc registers for S3C2443/S3C2416
      ARM: SAMSUNG: Fix mux bit modification in s3c_adc_select
      ARM: SAMSUNG: Allow overriding of adc device name for S3C24XX
      ARM: SAMSUNG: Add support s3c2443-adc for S3C2443
      ARM: SAMSUNG: Add support s3c2416-adc for S3C2416/S3C2450
      ARM: S3C2416: Add armdiv_mask constant
      ARM: S3C24XX: Add infrastructure to transmit armdiv to common code
      ARM: S3C2443: Add get_rate operation for clk_armdiv
      ARM: S3C2443: handle unset armdiv values gracefully
      ARM: S3C2443: Accommodate cpufreq frequency scheme in armdiv
      ARM: S3C24XX: use clk_get_rate to init fclk in common_setup_clocks
      ARM: S3C24XX: Add devname for hsmmc1 pclk

Kukjin Kim (1):
      ARM: EXYNOS4: Remove useless codes on NURI board

Mark Brown (1):
      ARM: S3C64XX: Enable TCM support

Peter Korsgaard (2):
      ARM: S3C2410: fix S3C_GPIO_SPACE #error message to match reality
      gpio/samsung: only register available gpio banks

Sachin Kamat (3):
      ARM: EXYNOS4: Enable regulator support for HDMI on ORIGEN
      ARM: EXYNOS4: Register power domains on ORIGEN
      ARM: EXYNOS4: Enable MFC on ORIGEN

Sylwester Nawrocki (1):
      ARM: EXYNOS4: Add support for M-5MOLS camera on Nuri board

Thomas Abraham (1):
      gpio/samsung: Fix incorrect gpio pull up/down callback for EXYNOS4

Tushar Behera (1):
      gpio/samsung: Move SoC specific codes within macro

 arch/arm/Kconfig                                   |    1 +
 arch/arm/mach-exynos4/Kconfig                      |   12 ++-
 arch/arm/mach-exynos4/mach-nuri.c                  |  158
+++++++++++++++++++-
 arch/arm/mach-exynos4/mach-origen.c                |   21 +++
 arch/arm/mach-s3c2410/include/mach/gpio-nrs.h      |    2 +-
 .../mach-s3c2410/include/mach/regs-s3c2443-clock.h |    1 +
 arch/arm/mach-s3c2416/clock.c                      |   21 ++-
 arch/arm/mach-s3c2416/s3c2416.c                    |    3 +
 arch/arm/mach-s3c2443/clock.c                      |  105 +------------
 arch/arm/mach-s3c2443/s3c2443.c                    |    3 +
 arch/arm/plat-s3c24xx/s3c2443-clock.c              |  135 ++++++++++++++++-
 arch/arm/plat-samsung/adc.c                        |   43 ++++--
 arch/arm/plat-samsung/include/plat/adc-core.h      |    2 +-
 arch/arm/plat-samsung/include/plat/regs-adc.h      |    3 +
 arch/arm/plat-samsung/include/plat/s3c2443.h       |    7 +-
 drivers/gpio/gpio-samsung.c                        |   45 ++++--
 16 files changed, 413 insertions(+), 149 deletions(-)
