From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 0/3] exynos5420: clock file cleanup
Date: Fri, 20 Dec 2013 18:27:23 +0530
Message-ID: <1387544246-31658-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:18513 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932526Ab3LTMy4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Dec 2013 07:54:56 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, thomas.ab@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Many changes/fixes have been identified for clock file for exynos5420.
These include correct parents, bit fields, new clocks etc. Existing
files needs some correction in terms of names of the clock and
indentation. These issues are addressed in this patch series. It also
replaces the usage of enums with macro as clock ids.

This series is based on linux-next, Kukjin's for-next and
Mike's clk-for-linus-3.13 branches.

This patch is also dependent on the following two series from
Tomasz Figa <t.figa@samsung.com>:
http://www.spinics.net/lists/arm-kernel/msg280223.html
and
http://www.spinics.net/lists/arm-kernel/msg291988.html.

Rahul Sharma (3):
  clk/exynos5420: cleanup clock file
  ARM: dts: replace clock numbers with macros for exynos5420
  clk/exynos5420: replace enums with macros as clock ids

 arch/arm/boot/dts/exynos5420.dtsi        |   47 +-
 drivers/clk/samsung/clk-exynos5420.c     | 1200 ++++++++++++++++++------------
 include/dt-bindings/clk/exynos5420-clk.h |  236 ++++++
 3 files changed, 1004 insertions(+), 479 deletions(-)
 create mode 100644 include/dt-bindings/clk/exynos5420-clk.h

-- 
1.7.10.4
