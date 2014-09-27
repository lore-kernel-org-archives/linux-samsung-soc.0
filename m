From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH 0/2] Exynos3250: add DT node and clock for UART2 and UART3
Date: Sat, 27 Sep 2014 10:28:46 +0530
Message-ID: <1411793928-32692-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:52693 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750975AbaI0FDm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 27 Sep 2014 01:03:42 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NCJ002R7NE5T820@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 27 Sep 2014 14:03:41 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, robh+dt@kernel.org, linux@arm.linux.org.uk, naushad@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

This patch series adds device tree node and missing clock support of UART2
and UART3 for Exynos3250. DT patch is dependent on clock patch.

Pankaj Dubey (2):
  clk: samsung: exynos3250: add uart2/3 related clocks
  arm: dts: exynos3250: add device node support for serial2 and serial3

 arch/arm/boot/dts/exynos3250-pinctrl.dtsi |   21 +++++++++++++++++++++
 arch/arm/boot/dts/exynos3250.dtsi         |   24 ++++++++++++++++++++++++
 drivers/clk/samsung/clk-exynos3250.c      |   11 +++++++++++
 include/dt-bindings/clock/exynos3250.h    |   10 +++++++++-
 4 files changed, 65 insertions(+), 1 deletion(-)

-- 
1.7.9.5
