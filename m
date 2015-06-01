From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 0/6] Exynos SYSMMU (IOMMU) dts and arch updates
Date: Mon, 01 Jun 2015 12:10:44 +0200
Message-ID: <1433153450-3680-1-git-send-email-m.szyprowski@samsung.com>
References: <1432041645-11172-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:17060 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752067AbbFAKLZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Jun 2015 06:11:25 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NP900GDMGAZM720@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 01 Jun 2015 11:11:23 +0100 (BST)
In-reply-to: <1432041645-11172-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: iommu@lists.linux-foundation.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Kukjin Kim <kgene@kernel.org>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Javier Martinez Canillas <javier@dowhile0.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

Hello,

Main changes for Exynos SYSMMU (IOMMU) driver has been finally scheduled
for merging - see
https://git.kernel.org/cgit/linux/kernel/git/joro/iommu.git/commit/?h=next
In meantime there have been quite a lot of changes related to Exynos DTS
files queued for merging and my patches don't apply anymore. To ease
merge process I've decided to rebased all Exynos SYSMMU dts changes onto
latest exynos next tree from: https://github.com/krzk/linux dt-for-next

While rebasing I've fixes a few spotted issues: some nodes still used
old 'samsung,power-domain' properties (now replaced with 'power-domains')
and added properties to jpeg codec merged recently.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland



Marek Szyprowski (6):
  ARM: Exynos: pm_domains: register power domain driver from
    core_initcall
  ARM: dts: exynos4: add sysmmu nodes
  ARM: dts: exynos3250: add sysmmu nodes
  ARM: dts: exynos4415: add sysmmu nodes
  ARM: dts: exynos5250: add sysmmu nodes
  ARM: dts: exynos5420: add sysmmu nodes

 arch/arm/boot/dts/exynos3250.dtsi |  33 +++++
 arch/arm/boot/dts/exynos4.dtsi    | 118 ++++++++++++++++++
 arch/arm/boot/dts/exynos4210.dtsi |  23 ++++
 arch/arm/boot/dts/exynos4415.dtsi |  11 ++
 arch/arm/boot/dts/exynos4x12.dtsi |  82 +++++++++++++
 arch/arm/boot/dts/exynos5250.dtsi | 250 ++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos5420.dtsi | 183 ++++++++++++++++++++++++++++
 arch/arm/mach-exynos/pm_domains.c |  25 ++--
 8 files changed, 707 insertions(+), 18 deletions(-)

-- 
1.9.2
