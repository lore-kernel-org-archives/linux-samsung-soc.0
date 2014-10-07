From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCHv2 0/2] ARM: dts: Add new board dts file for Exynos3250-based
 Rinato board
Date: Wed, 08 Oct 2014 07:45:37 +0900
Message-ID: <1412721939-10615-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:64250 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755383AbaJGWpr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Oct 2014 18:45:47 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0ND3001GLJ89KM30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 08 Oct 2014 07:45:45 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, mark.rutland@arm.com, arnd@arndb.de, olof@lixom.net, tomasz.figa@gmail.com, kyungmin.park@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, jh80.chung@samsung.com, geunsik.lim@samsung.com, cw00.choi@samsung.com

This patchset adds new board dts file for Samsung Rinato board (Gear 2) which
is based on Exynos3250 SoC and adds sleep mode pin configuration using pinctrl
subsystem to reduce leakage power-consumption in sleep state.

This patchset is based on linux-samsung.git (for-next branch).

Changes from v1:
- Remove useless brace
- Remove unneeded 'regulators' keyword
- Consolidate memory information in one entry

Chanwoo Choi (2):
  ARM: dts: Add board dts file for Exynos3250-based Rinato board
  ARM: dts: Add sleep mode pin configuration for exynos3250-rinato

 arch/arm/boot/dts/Makefile                |   3 +-
 arch/arm/boot/dts/exynos3250-pinctrl.dtsi |  16 +
 arch/arm/boot/dts/exynos3250-rinato.dts   | 586 ++++++++++++++++++++++++++++++
 3 files changed, 604 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/exynos3250-rinato.dts

-- 
1.8.0
