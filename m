From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: [RESEND][PATCH 0/2] Add support to get PMU address via DT for
 exynos5260
Date: Mon, 28 Jul 2014 18:07:58 +0530
Message-ID: <1406551080-14821-1-git-send-email-vikas.sajjan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:21535 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751598AbaG1Mlj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jul 2014 08:41:39 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N9F00BOH9XCWDA0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Jul 2014 21:41:36 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, sajjan.linux@gmail.com, dianders@chromium.org, Vikas Sajjan <vikas.sajjan@samsung.com>

rebased on kgene tree for-next branch
https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/log/?h=for-next

Vikas Sajjan (2):
  ARM: DTS: Add PMU DT node for exynos5260 SoC
  ARM: EXYNOS: Add exynos5260 PMU compatible string to DT match table

 .../devicetree/bindings/arm/samsung/pmu.txt        |    1 +
 arch/arm/boot/dts/exynos5260.dtsi                  |    5 +++++
 arch/arm/mach-exynos/exynos.c                      |    1 +
 3 files changed, 7 insertions(+)

-- 
1.7.9.5
