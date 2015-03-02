From: Beata Michalska <b.michalska@samsung.com>
Subject: [PATCH 0/2] Support for CMU_ISP clock domain on Exynos3250
Date: Mon, 02 Mar 2015 14:17:28 +0100
Message-ID: <1425302250-13446-1-git-send-email-b.michalska@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:9942 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751602AbbCBNSU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Mar 2015 08:18:20 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com, mturquette@linaro.org, kgene@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, sw0312.kim@samsung.com


Hi All,

This simple patchset adds support for CMU_ISP clock domain
on Exynos3250.

Best Regards
Beata Michalska

---

Beata Michalska (1):
  ARM: dts: exynos3250: Add assigned clock parents to CMU node

Tomasz Figa (1):
  clk: samsung: exynos3250: Add driver for CMU_ISP clock domain

 .../devicetree/bindings/clock/exynos3250-clock.txt |    8 +
 arch/arm/boot/dts/exynos3250.dtsi                  |    4 +
 drivers/clk/samsung/clk-exynos3250.c               |  163 ++++++++++++++++++++
 include/dt-bindings/clock/exynos3250.h             |   61 ++++++++
 4 files changed, 236 insertions(+)

-- 
1.7.9.5
