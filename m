From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung fixes-4 for v3.8
Date: Tue, 29 Jan 2013 10:03:54 -0800
Message-ID: <06c601cdfe4b$01ef8890$05ce99b0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:49473 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754205Ab3A2SEB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jan 2013 13:04:01 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHE00HG2FIMXW40@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 30 Jan 2013 03:04:00 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHE00JWTFILD540@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 30 Jan 2013 03:03:59 +0900 (KST)
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Arnd and Olof,

Here is a pull request for Samsung fixes-4 for v3.8.

This fixes compatible values for exynos pinctrl and crash on soft reset,
tick and alarm irq numbers on exynos5440 and uninitialized variable on
s3c24xx.

If any problems, please kindly let me know.

Thanks.

- Kukjin

The following changes since commit 949db153b6466c6f7cad5a427ecea94985927311:

  Linux 3.8-rc5 (2013-01-25 11:57:28 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
v3.8-samsung-fixes-4

for you to fetch changes up to 60db7e5f9c9a25a7a9b01007e6e3f5a93bc16a3a:

  ARM: EXYNOS: Fix crash on soft reset on EXYNOS5440 (2013-01-28 14:27:50
-0800)

----------------------------------------------------------------
Cong Ding (1):
      ARM: S3C24XX: fix uninitialized variable warning

Giridhar Maruthy (1):
      ARM: dts: fix tick and alarm irq numbers for exynos5440

Kukjin Kim (1):
      ARM: dts: fix compatible value for exynos pinctrl

Thomas Abraham (2):
      ARM: dts: Fix compatible value of pinctrl module on EXYNOS5440
      ARM: EXYNOS: Fix crash on soft reset on EXYNOS5440

 Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt |   12
++++++------
 arch/arm/boot/dts/exynos4210.dtsi                             |    6 +++---
 arch/arm/boot/dts/exynos4x12.dtsi                             |    8
++++----
 arch/arm/boot/dts/exynos5440.dtsi                             |    4 ++--
 arch/arm/mach-exynos/common.c                                 |   10
++++++----
 arch/arm/mach-s3c24xx/common.c                                |    2 +-
 drivers/gpio/gpio-samsung.c                                   |    6 +++---
 drivers/pinctrl/pinctrl-samsung.c                             |    4 ++--
 8 files changed, 27 insertions(+), 25 deletions(-)
