From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH V2 0/3] ARM: EXYNOS4: Suspend to RAM Support
Date: Thu, 10 Mar 2011 13:51:11 +0900
Message-ID: <1299732674-6752-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:50819 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751041Ab1CJFTu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Mar 2011 00:19:50 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

This patch adds support suspend to ram on EXYNOS4.
This is made based on generic CPU sleep support.

Changes since v1:
- re-maded based on rmk/pm
- added some more registers of CMU to save and restore
- fixed MAUDIO retention after resuming

[PATCH V2 1/3] ARM: EXYNOS4: Add PMU and CMU Registers for PM
[PATCH V2 2/3] ARM: EXYNOS4: Suspend to RAM Support
[PATCH V2 3/3] ARM: EXYNOS4: Update HRT for supporting PM
