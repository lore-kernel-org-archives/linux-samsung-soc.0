From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung fixes-1 for v3.12
Date: Mon, 14 Oct 2013 06:56:50 +0900
Message-ID: <525B1722.5060001@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:61573 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755284Ab3JMV47 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 13 Oct 2013 17:56:59 -0400
Received: by mail-pd0-f171.google.com with SMTP id g10so6615050pdj.16
        for <linux-samsung-soc@vger.kernel.org>; Sun, 13 Oct 2013 14:56:59 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, arm@kernel.org

The following changes since commit 272b98c6455f00884f0350f775c5342358ebb73f:

   Linux 3.12-rc1 (2013-09-16 16:17:51 -0400)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-fixes-1

for you to fetch changes up to b7f8c479e112cc09422aac2bda923a86b381fcc0:

   ARM: dts: fix PL330 MDMA1 address in DT for Universal C210 board 
(2013-10-08 07:09:52 +0900)

----------------------------------------------------------------
Fixes for v3.12
- fix UART for switching FIFO
- correct typo 'samsung,pin-drv'
- correct typo 'earlyprintk'
- remove DP PHY for supporting dptx-phy on exynos5250
- cpufreq regulator lookup for exynos4210-origen and trats
- fix PL330 MDMA1 address for universal c210 board

----------------------------------------------------------------
Al Stone (1):
       ARM: dts: Correct typo in use of samsung,pin-drv for exynos5250

Alexander Shiyan (1):
       ARM: SAMSUNG: Fix switching FIFO in arch_enable_uart_fifo function

Bartlomiej Zolnierkiewicz (1):
       ARM: dts: fix PL330 MDMA1 address in DT for Universal C210 board

Jingoo Han (1):
       ARM: dts: Remove DP PHY node from exynos5250.dtsi

Tomasz Figa (1):
       ARM: dts: Work around lack of cpufreq regulator lookup for 
exynos4210-origen and trats boards

Youngmin Nam (1):
       ARM: dts: Fix a typo on Exynos5440 DTS files

  arch/arm/boot/dts/exynos4210-origen.dts         |  7 +++-
  arch/arm/boot/dts/exynos4210-trats.dts          |  7 +++-
  arch/arm/boot/dts/exynos4210-universal_c210.dts |  4 +++
  arch/arm/boot/dts/exynos5250-pinctrl.dtsi       | 44 
++++++++++++-------------
  arch/arm/boot/dts/exynos5250.dtsi               | 13 +++-----
  arch/arm/boot/dts/exynos5440-sd5v1.dts          |  2 +-
  arch/arm/boot/dts/exynos5440-ssdk5440.dts       |  2 +-
  arch/arm/plat-samsung/include/plat/uncompress.h |  2 ++
  8 files changed, 47 insertions(+), 34 deletions(-)
