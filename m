From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 0/4] Add more supported blocks to UniversalC210 and Trats
Date: Thu, 22 May 2014 07:52:13 +0200
Message-ID: <1400737937-7368-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:45769 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750924AbaEVFwn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 01:52:43 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N5Y009CROBPP270@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 22 May 2014 06:52:37 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

Hello,

This is a small update for Exynos4210 based UniversalC210 and Trats
boards. Full USB support requires merging '[PATCHv5 0/4] Enable usbphy
and hsotg for exynos4' series recently posted by Chanho Park.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland

Changelog:
v2:
- added port sub-nodes to ehci and ohci modules as requested by Tomasz Figa

v1:
- initial version

Marek Szyprowski (3):
  ARM: dts: exynos4210-universal_c210: enable USB functionality
  ARM: dts: exynos4210-universal_c210: add multimedia nodes
  ARM: dts: exynos4210-universal_c210: add external sd card node

Tomasz Figa (1):
  ARM: dts: exynos4210-trats: Enable USB gadget functionality

 arch/arm/boot/dts/exynos4210-trats.dts          | 10 +++++
 arch/arm/boot/dts/exynos4210-universal_c210.dts | 59 +++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

-- 
1.9.2
