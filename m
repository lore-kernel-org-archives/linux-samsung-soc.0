From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 0/2] ARM: dts: Add new board dts file for Exynos3250-based
 Rinato board
Date: Tue, 30 Sep 2014 20:07:23 +0900
Message-ID: <1412075245-5763-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:31803 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751411AbaI3LHa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Sep 2014 07:07:30 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NCP008MYO8GZP50@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 30 Sep 2014 20:07:28 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, kyungmin.park@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, jh80.chung@samsung.com, geunsik.lim@samsung.com, cw00.choi@samsung.com

This patchset adds new board dts file for Samsung Rinato board (Gear 2) which
is based on Exynos3250 SoC and adds sleep mode pin configuration using pinctrl
subsystem to reduce leakage power-consumption in sleep state.

This patchset is based on linux-samsung.git (for-next branch).

Chanwoo Choi (2):
  ARM: dts: Add board dts file for Exynos3250-based Rinato board
  ARM: dts: Add sleep mode pin configuration for exynos3250-rinato

 arch/arm/boot/dts/Makefile                |   3 +-
 arch/arm/boot/dts/exynos3250-pinctrl.dtsi |  16 +
 arch/arm/boot/dts/exynos3250-rinato.dts   | 595 ++++++++++++++++++++++++++++++
 3 files changed, 613 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/exynos3250-rinato.dts

-- 
1.8.0
