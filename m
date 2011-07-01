From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH V2 0/8] ARM: EXYNOS4: Update PM
Date: Fri,  1 Jul 2011 10:57:29 +0900
Message-ID: <1309485457-13305-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:53321 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754268Ab1GACIq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jun 2011 22:08:46 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

This patch updates EXYNOS4 PM based on Russell's suspend consolidation patches.

NOTE: Depends on external GIC patches which are from Changhwan Youn.

Changes since V1:
- address comments from Russell King

[PATCH V2 1/8] ARM: EXYNOS4: Support system level power down configuration
[PATCH V2 2/8] ARM: EXYNOS4: Remove PMU configuration for S2RAM
[PATCH V2 3/8] ARM: EXYNOS4: Add support PM with external GIC
[PATCH V2 4/8] ARM: SAMSUNG: Add support for failure of sleep mode
[PATCH V2 5/8] ARM: EXYNOS4: Support early wakeup entering sleep mode
[PATCH V2 6/8] ARM: EXYNOS4: Move S5P_CENTRAL_SEQ_CONFIGURATION setting for PM
[PATCH V2 7/8] ARM: EXYNOS4: Add save/restore for other ARM registers
[PATCH V2 8/8] ARM: EXYNOS4: Add save/restore function for PLL
