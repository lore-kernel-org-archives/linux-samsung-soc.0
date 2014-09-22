From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH/RFC 0/2] serial: samsung: add support for early console
Date: Mon, 22 Sep 2014 15:14:13 +0200
Message-ID: <1411391655-6291-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:49248 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753647AbaIVNOX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Sep 2014 09:14:23 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NCB00ME90WNST30@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Sep 2014 14:17:11 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, thomas.ab@samsung.com, Tomasz Figa <tomasz.figa@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robherring2@gmail.com>

Hello,

This patchset adds support for early console defined in device tree. As
an example, DTS files for all Exynos4 based machines are updated with
the correct value for common chosen/sdtout property.

To get it fully functional additional improvements (support for
early_ioremap) are needed in early console code.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Patch summary:

Tomasz Figa (2):
  serial: samsung: Add support for of_earlycon
  ARM: dts: exynos4: Add stdout-path properties

 arch/arm/boot/dts/exynos4210-origen.dts         |  1 +
 arch/arm/boot/dts/exynos4210-smdkv310.dts       |  1 +
 arch/arm/boot/dts/exynos4210-trats.dts          |  1 +
 arch/arm/boot/dts/exynos4210-universal_c210.dts |  1 +
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi |  4 +
 arch/arm/boot/dts/exynos4412-origen.dts         |  1 +
 arch/arm/boot/dts/exynos4412-smdk4412.dts       |  1 +
 arch/arm/boot/dts/exynos4412-tiny4412.dts       |  4 +
 arch/arm/boot/dts/exynos4412-trats2.dts         |  1 +
 drivers/tty/serial/Kconfig                      |  1 +
 drivers/tty/serial/samsung.c                    | 97 +++++++++++++++++++++++++
 11 files changed, 113 insertions(+)

-- 
1.9.2
