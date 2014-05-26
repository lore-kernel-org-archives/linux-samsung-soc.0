From: Jaehoon Chung <jh80.chung@samsung.com>
Subject: [PATCHv2 0/3] mmc: fixed the mmc_of_parse for dwmmc
Date: Mon, 26 May 2014 20:35:04 +0900
Message-ID: <1401104107-17651-1-git-send-email-jh80.chung@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:52070 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752100AbaEZLfP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 May 2014 07:35:15 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-mmc@vger.kernel.org
Cc: chris@printf.net, ulf.hansson@linaro.org, ludovic.desroches@atmel.com, tgih.jun@samsung.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Jaehoon Chung <jh80.chung@samsung.com>

This patch-set is fixed the dw-mmc controller problem.
dw-mmc controller have the slot, but mmc_of_parse didn't parse the slot sub-node.
So dw-mmc controller didn't work correctly.

Jaehoon Chung (2):
  mmc: dw_mmc: use the __mmc_of_parse to parse the slot node
  ARM: dts: replace the broken-cd property into slot node for dwmmc.

Ludovic Desroches (1):
  mmc: host: add slot argument to mmc_of_parse

 arch/arm/boot/dts/exynos4412-odroidx.dts      |    2 +-
 arch/arm/boot/dts/exynos4412-origen.dts       |    2 +-
 arch/arm/boot/dts/exynos4412-trats2.dts       |    4 ++--
 arch/arm/boot/dts/exynos5250-arndale.dts      |    2 +-
 arch/arm/boot/dts/exynos5250-cros-common.dtsi |    4 ++--
 arch/arm/boot/dts/exynos5250-smdk5250.dts     |    2 +-
 arch/arm/boot/dts/exynos5420-arndale-octa.dts |    2 +-
 arch/arm/boot/dts/rk3066a-bqcurie2.dts        |    2 +-
 arch/arm/boot/dts/socfpga_arria5.dtsi         |    2 +-
 arch/arm/boot/dts/socfpga_cyclone5.dtsi       |    2 +-
 arch/arm/boot/dts/socfpga_vt.dts              |    2 +-
 drivers/mmc/core/host.c                       |   13 +++++++++----
 drivers/mmc/host/dw_mmc.c                     |   25 ++++++-------------------
 include/linux/mmc/host.h                      |   10 +++++++++-
 14 files changed, 37 insertions(+), 37 deletions(-)

-- 
1.7.9.5
