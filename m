From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 0/4] clk: Samsung: audss: Add support for Exynos5420
Date: Wed, 10 Jul 2013 17:41:49 +0530
Message-ID: <1373458313-18970-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:17968 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751173Ab3GJMGj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Jul 2013 08:06:39 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MPP009YYYYXBQ60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 10 Jul 2013 21:06:37 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: sbkim73@samsung.com, broonie@kernel.org, kgene.kim@samsung.com, mturquette@linaro.org, dianders@chromium.org, abrestic@chromium.org

This patch set adds support for audio subsystem clks on Exynos5420. Exynos5420
audio subsystem has a gate bit for ADMA controller and the some of parent clks
for mout_i2s are also different from Exynos5250. So this patch adds provision
for supporting both the platforms by passing the parent clk names through
device tree.

Andrew Bresticker (3):
  clk: exynos-audss: add support for Exynos 5420
  clk: exynos-audss: allow input clocks to be specified in device tree
  ARM: dts: exynos5420: add audio clock controller

Padmavathi Venna (1):
  ARM: dts: Correct the /include entry on exynos5420 dtsi file

 .../devicetree/bindings/clock/clk-exynos-audss.txt |   38 +++++++++++++++++--
 arch/arm/boot/dts/exynos5420.dtsi                  |   13 ++++++-
 drivers/clk/samsung/clk-exynos-audss.c             |   36 ++++++++++++++++--
 include/dt-bindings/clk/exynos-audss-clk.h         |    3 +-
 4 files changed, 80 insertions(+), 10 deletions(-)

-- 
1.7.4.4
