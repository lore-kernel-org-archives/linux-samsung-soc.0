From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: [Patch v4 0/2] Enable all cpus in Exynos5420
Date: Mon,  7 Oct 2013 09:47:08 +0530
Message-ID: <1381119431-12697-1-git-send-email-chander.kashyap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f52.google.com ([209.85.160.52]:64697 "EHLO
	mail-pb0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751414Ab3JGERb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Oct 2013 00:17:31 -0400
Received: by mail-pb0-f52.google.com with SMTP id wz12so6565167pbc.11
        for <linux-samsung-soc@vger.kernel.org>; Sun, 06 Oct 2013 21:17:30 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene@kernel.org, thomas.abraham@linaro.org, sylvester.nawrocki@gmail.com, Chander Kashyap <chander.kashyap@linaro.org>

Exynos5420 is an octa-core SoC. This patch series enables the remaining 4 cores.

Changes in v2:
	- Changed the cpu node @unit-address value to reg property value.
Changes in v3:
	- Removed leading 0x from @unit-address value.
Changes in v4:
	- Fixed typo and patch subject from "arm: dt" to "ARM: dt".

Chander Kashyap (2):
  clocksource: mct: extend mct to support 8 local interrupts for
    Exynos5420
  arm: dt: Exynos5420: populate cpu node enteries to 8 cpus

 arch/arm/boot/dts/exynos5420.dtsi |   37 +++++++++++++++++++++++++++++++++++--
 drivers/clocksource/exynos_mct.c  |    4 ++++
 2 files changed, 39 insertions(+), 2 deletions(-)

-- 
1.7.9.5
