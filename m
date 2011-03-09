From: Jaecheol Lee <jc.lee@samsung.com>
Subject: [PATCH 0/3] ARM: EXYNOS4: Support suspend to ram
Date: Wed,  9 Mar 2011 11:08:38 +0900
Message-ID: <1299636521-4831-1-git-send-email-jc.lee@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:58271 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932082Ab1CICjh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Mar 2011 21:39:37 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, kgene.kim@samsung.com

This patch adds support suspend to ram on EXYNOS4 system.

As a note since there is a implementation of common PM will be updated later such as sleep.S.

[PATCH 1/3] ARM: EXYNOS4: Add PMU Registers for PM
[PATCH 2/3] ARM: EXYNOS4: Suspend to RAM Support
[PATCH 3/3] ARM: EXYNOS4: Update HRT for supporting PM
