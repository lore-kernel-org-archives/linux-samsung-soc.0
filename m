From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 1/7] Samsung fixes for v3.14
Date: Mon, 16 Dec 2013 05:21:21 +0900
Message-ID: <52AE0F41.7050706@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:43285 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751829Ab3LOUV3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 15 Dec 2013 15:21:29 -0500
Received: by mail-pd0-f174.google.com with SMTP id y13so4433280pdi.5
        for <linux-samsung-soc@vger.kernel.org>; Sun, 15 Dec 2013 12:21:28 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit 6ce4eac1f600b34f2f7f58f9cd8f0503d79e42ae:

   Linux 3.13-rc1 (2013-11-22 11:30:55 -0800)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-fixes

for you to fetch changes up to 236940d2c951a84735fdd7b958b5159eaf501784:

   ARM: dts: Update display clock frequency for Origen-4412 (2013-12-16 
04:41:57 +0900)

----------------------------------------------------------------
Samsung non-critical fixes for v3.14
- Switch FIFO mode for arch_enable_uart_fifo()
- Add missing op_mode for PMIC on exynos5250-arndale
- Add missing clock-frequency for CPU on exynos5250
- Fix typo samaung to samsung for exynos5420-pinctrl
- Fix display clock-frequency for exynos4210/exynos4412-origen

----------------------------------------------------------------
Alexander Shiyan (1):
       ARM: SAMSUNG: Fix switching FIFO in arch_enable_uart_fifo function

Sachin Kamat (4):
       ARM: dts: Add missing op_mode property to PMIC on Arndale
       ARM: dts: Add missing frequency property to exynos5250
       ARM: dts: Fix a typo in exynos5420-pinctrl.dtsi
       ARM: dts: Update display clock frequency for Origen-4412

Tushar Behera (1):
       ARM: dts: Update display clock frequency for Origen-4210

  arch/arm/boot/dts/exynos4210-origen.dts         | 2 +-
  arch/arm/boot/dts/exynos4412-origen.dts         | 2 +-
  arch/arm/boot/dts/exynos5250-arndale.dts        | 2 ++
  arch/arm/boot/dts/exynos5250.dtsi               | 2 ++
  arch/arm/boot/dts/exynos5420-pinctrl.dtsi       | 2 +-
  arch/arm/plat-samsung/include/plat/uncompress.h | 2 ++
  6 files changed, 9 insertions(+), 3 deletions(-)
