From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH 0/4] ARM: S5P: Replace exynos4 kernel timer with s5p_timer
Date: Tue,  5 Apr 2011 09:28:41 +0900
Message-ID: <1301963325-22349-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:50706 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751003Ab1DEA7B (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Apr 2011 20:59:01 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org

Exynos4 arch used exynos4_timer as kernel timer.
But In the plat-s5p, we already have a common s5p_timer for hrt.
In this patch, I replace exynos4_timer with common s5p_timer.
This patch is tested on SMDKV310 and SMDKC210.

[PATCH 1/4] ARM: S5P: Change s5p_timer for local timer support
[PATCH 2/4] ARM: EXYNOS4: Update Kconfig and Makefile for s5p_timer
[PATCH 3/4] ARM: EXYNOS4: Change each platform kernel timer using s5p_timer
[PATCH 4/4] ARM: EXYNOS4: Delete exynos4 kernel timer
