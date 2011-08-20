From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/4] ARM: SAMSUNG: Add support CPU ID and Rev. at runtime
Date: Sat, 20 Aug 2011 14:05:55 +0900
Message-ID: <1313816759-14564-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:33099 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750851Ab1HTFVc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 20 Aug 2011 01:21:32 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

This patch adds support handling of CPU ID and varialble silicon revision
at runtime.

[PATCH 1/4] ARM: SAMSUNG: Add support for detecting CPU at runtime
[PATCH 2/4] ARM: S5P64X0: Use cpu_is_s5p64x0() to distinguish cpu at runtime
[PATCH 3/4] ARM: SAMSUNG: Add support for handling of cpu revision
[PATCH 4/4] ARM: EXYNOS4: Use samsung_rev() to distinguish silicon revision
