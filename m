From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCHv2 0/2] clk: samsung: Add clock controller driver for Exynos4415
 SoC
Date: Fri, 24 Oct 2014 20:07:06 +0900
Message-ID: <1414148828-23719-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:14758 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755320AbaJXLHM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Oct 2014 07:07:12 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, inki.dae@samsung.com, geunsik.lim@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

This patch adds new clock controller device driver for Exynos4415 SoC.

Changes from v1:
- Separate only clock patches from Exynos4415 patchset[1]
 [1] [PATCH 0/5] Support new Exynos4415 SoC based on Cortex-A9 quad cores
 : https://lkml.org/lkml/2014/10/19/253

- Fix string issue on documentation file of Exynos4415 clock controller

Chanwoo Choi (2):
  clk: samsung: exynos4415: Add clocks using common clock framework
  clk: samsung: Document binding for Exynos4415 clock controller

 .../devicetree/bindings/clock/exynos4415-clock.txt |   38 +
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-exynos4415.c               | 1133 ++++++++++++++++++++
 include/dt-bindings/clock/exynos4415.h             |  360 +++++++
 4 files changed, 1532 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/exynos4415-clock.txt
 create mode 100644 drivers/clk/samsung/clk-exynos4415.c
 create mode 100644 include/dt-bindings/clock/exynos4415.h

-- 
1.8.5.5
