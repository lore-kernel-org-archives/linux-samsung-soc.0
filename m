From: Tarek Dakhran <t.dakhran@samsung.com>
Subject: [PATCH v1 0/1] Boot all secondary cores on Exynos SoC's
Date: Tue, 11 Feb 2014 11:15:28 +0900
Message-ID: <1392084929-14116-1-git-send-email-t.dakhran@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:64357 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752133AbaBKCSK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Feb 2014 21:18:10 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Chander Kashyap <chander.kashyap@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Tarek Dakhran <t.dakhran@gmail.com>, Vyacheslav Tyrtov <v.tyrtov@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Tarek Dakhran <t.dakhran@samsung.com>

Due to implementation of exynos_boot_secondary function
only one secondary core boots on Exynos SoC's.

Two new functions added to power up and power down secondary cores:

static int exynos_core_power_up(unsigned int cpu);
static int exynos_core_power_down(unsigned int cpu).

Tested on linux kernel v3.14-rc2.

Comments and additions would be appreciated.
Thank you.
	Tarek.

Tarek Dakhran (1):
  ARM: EXYNOS: enable boot all secondary cpus instead 2

 arch/arm/mach-exynos/hotplug.c  |   11 ++++--
 arch/arm/mach-exynos/platsmp.c  |   75 ++++++++++++++++++++++++++++-----------
 arch/arm/mach-exynos/regs-pmu.h |    5 +++
 3 files changed, 68 insertions(+), 23 deletions(-)

-- 
1.7.10.4
