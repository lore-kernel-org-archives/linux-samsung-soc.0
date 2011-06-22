From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/7] ARM: EXYNOS4: Update PM
Date: Wed, 22 Jun 2011 17:46:38 +0900
Message-ID: <1308732405-16664-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:59718 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751398Ab1FVI4u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Jun 2011 04:56:50 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

Note: This depends on external GIC of EXYNOS4.

[PATCH 1/7] ARM: EXYNOS4: Support system level power down configuration
[PATCH 2/7] ARM: EXYNOS4: Remove PMU configuration for S2RAM
[PATCH 3/7] ARM: EXYNOS4: Add support PM with external GIC
[PATCH 4/7] ARM: EXYNOS4: Support early wakeup while entering sleep mode
[PATCH 5/7] ARM: EXYNOS4: Add save/restore function for PLL
[PATCH 6/7] ARM: EXYNOS4: Add save/restore for more ARM registers
[PATCH 7/7] ARM: EXYNOS4: Move S5P_CENTRAL_SEQ_CONFIGURATION setting for PM
