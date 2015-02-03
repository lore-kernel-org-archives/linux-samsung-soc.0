From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v11 0/4] ARM: dts: Add PPMU dt node for Exynos3250/4
Date: Tue, 03 Feb 2015 09:49:07 +0900
Message-ID: <1422924551-10474-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:15517 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755292AbbBCAtU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Feb 2015 19:49:20 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene@kernel.org
Cc: ben-linux@fluff.org, kyungmin.park@samsung.com, myungjoo.ham@samsung.com, inki.dae@samsung.com, cw00.choi@samsung.com, kgene@gmail.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

This patch adds the PPMU (Platform Performance Profiling Unit) dt node for
Exynos{3250|4} SoC. This patch-set send only patches related to exynos dts
file from patch[1]. The devfreq-event patches is already merged to linux-pm.git
(linux-next branch[2]).

[1] https://lkml.org/lkml/2015/1/25/573
- [PATCH v10 0/7] devfreq: Add devfreq-event class to provide raw data for devfreq device
[2] https://git.kernel.org/cgit/linux/kernel/git/rafael/linux-pm.git/commit/?h=linux-next&id=59f978d43f5afa91c0a8870f3705a208f085cba1

Chanwoo Choi (4):
  ARM: dts: Add PPMU dt node for Exynos3250 SoC
  ARM: dts: Add PPMU dt node for Exynos4 SoCs
  ARM: dts: exynos: Add PPMU node for Exynos3250-based Rinato/Monk board
  ARM: dts: exynos: Add PPMU node for Exynos4412-based TRATS2 board

 arch/arm/boot/dts/exynos3250-monk.dts   |  40 ++++++++++++
 arch/arm/boot/dts/exynos3250-rinato.dts |  40 ++++++++++++
 arch/arm/boot/dts/exynos3250.dtsi       |  74 ++++++++++++++++++++++
 arch/arm/boot/dts/exynos4.dtsi          | 108 ++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos4210.dtsi       |   8 +++
 arch/arm/boot/dts/exynos4412-trats2.dts |  40 ++++++++++++
 6 files changed, 310 insertions(+)

-- 
1.8.5.5
