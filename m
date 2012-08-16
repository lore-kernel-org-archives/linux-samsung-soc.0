From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH] Add MFC device tree support
Date: Thu, 16 Aug 2012 18:01:11 +0530
Message-ID: <1345120273-22913-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:57367 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751213Ab2HPLX2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Aug 2012 07:23:28 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M8U0042OIAJ8AG0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 16 Aug 2012 20:23:27 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M8U00FASI8QMJ00@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 16 Aug 2012 20:23:27 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, k.debski@samsung.com, jtp.park@samsung.com, ch.naveen@samsung.com, arun.kk@samsung.com, joshi@samsung.com

This patch incorporates device tree support for the video codec
IP (MFC) present in Exynos series SoCs.
The driver side support for this will be posted as a separate
patch in the linux-media mailing list.

Naveen Krishna Chatradhi (1):
  ARM: EXYNOS: Add MFC device tree support

 .../devicetree/bindings/media/s5p-mfc.txt          |   24 ++++++++++++++++++++
 arch/arm/boot/dts/exynos4210.dtsi                  |   10 ++++++++
 arch/arm/boot/dts/exynos5250.dtsi                  |   10 ++++++++
 arch/arm/mach-exynos/clock-exynos5.c               |    2 +-
 arch/arm/mach-exynos/mach-exynos4-dt.c             |   22 ++++++++++++++++++
 arch/arm/mach-exynos/mach-exynos5-dt.c             |   22 ++++++++++++++++++
 6 files changed, 89 insertions(+), 1 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/s5p-mfc.txt
