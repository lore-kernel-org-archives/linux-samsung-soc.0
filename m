From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: [PATCH v2 0/2] Enable all cpus in Exynos5420
Date: Thu,  5 Sep 2013 15:52:28 +0530
Message-ID: <1378376550-27762-1-git-send-email-chander.kashyap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f42.google.com ([209.85.160.42]:49009 "EHLO
	mail-pb0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932066Ab3IEKWp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Sep 2013 06:22:45 -0400
Received: by mail-pb0-f42.google.com with SMTP id un15so1612107pbc.15
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Sep 2013 03:22:44 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, thomas.abraham@linaro.org, Chander Kashyap <chander.kashyap@linaro.org>

Exynos5420 is an octacore SoC. This patch series enables the remaining 4 cores.

Changes in v2:
	- Changed the cpu node @unit-address value to reg property value.

Chander Kashyap (2):
  clocksource: mct: extend mct to support 8 local interrupts for
    Exynos5420
  arm: dt: Exynos5420: populate cpu node enteries to 8 cpus

 arch/arm/boot/dts/exynos5420.dtsi |   37 +++++++++++++++++++++++++++++++++++--
 drivers/clocksource/exynos_mct.c  |    4 ++++
 2 files changed, 39 insertions(+), 2 deletions(-)

-- 
1.7.9.5
