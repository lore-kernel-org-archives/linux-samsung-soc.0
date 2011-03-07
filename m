From: KyongHo Cho <pullip.cho@samsung.com>
Subject: [PATCH 0/2] ARM: EXYNOS4: Enhancement of System MMU
Date: Mon,  7 Mar 2011 10:19:26 +0900
Message-ID: <1299460768-4077-1-git-send-email-pullip.cho@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:54450 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753948Ab1CGBtJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 6 Mar 2011 20:49:09 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, kgene.kim@samsung.com

This patch includes the following enhancements for System MMU:
- Enhanced readability
- Removal of unused data structures or their members
- Simplified function definitions
- Corrections of some logical errors
- Full compliance with Linux coding style
- Simpler way of registering callback functions of System MMU faults
- Add clock gating for System MMU

[PATCH 1/2] ARM: EXYNOS4: Enhancement of System MMU driver
[PATCH 2/2] ARM: EXYNOS4: Implement Clock gating for System MMU
