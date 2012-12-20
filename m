From: Prasanna Kumar <prasanna.ps@samsung.com>
Subject: [PATCH v2 0/3] ARM: Exynos5 : Add Power domain device tree support and
 fix for hardware issue
Date: Thu, 20 Dec 2012 17:56:15 +0530
Message-ID: <1356006378-17441-1-git-send-email-prasanna.ps@samsung.com>
References: <CAPmaG0uqkRcoUBR8Gjv_+BSJ3hwxUCz0G-YKNQX=qvx83i6QOQ@mail.gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:15794 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751296Ab2LTMFQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Dec 2012 07:05:16 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MFB00FBSW7Z7WH0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Dec 2012 21:04:57 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MFB00BM9W63ML00@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Dec 2012 21:04:56 +0900 (KST)
In-reply-to: <CAPmaG0uqkRcoUBR8Gjv_+BSJ3hwxUCz0G-YKNQX=qvx83i6QOQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org

Hello,
This patch set is for "for-next" branch.

Changes since v1:
[exynos5250.dtsi]
Added power domain support for MAU and ISP power domains in exynos5 dts
[pm_domains.c]
CLKSRC register is saved before PMU register is programmed
Replaced soc_is_exynos5250 with  of_machine_is_compatible 

Prasanna Kumar (3):
  ARM: dts: exynos5: Set up power domain for MFC,G-scaler,MAU and ISP
  arm: exynos5: Enable PM generic domain support in Kconfig
  ARM: EXYNOS5: save CLK_TOP_SRC3 register before powergating

 arch/arm/boot/dts/exynos5250.dtsi |   25 +++++++++++++++++++++++++
 arch/arm/mach-exynos/Kconfig      |    1 +
 arch/arm/mach-exynos/pm_domains.c |   27 +++++++++++++++++++++++++++
 3 files changed, 53 insertions(+), 0 deletions(-)
