From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/3] ARM: EXYNOS: cleanup clock part
Date: Tue, 31 Jan 2012 13:49:22 +0900
Message-ID: <1327985365-7070-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:54003 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753870Ab2AaEtk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jan 2012 23:49:40 -0500
Received: by pbdu11 with SMTP id u11so279758pbd.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Jan 2012 20:49:40 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Basically, this patch changes the clock.c in mach-exynos/ to
clock-exynos4.c at the same directory and this is neeed to
support for new EXYNOS SoC, and the prefix of the clk register
from S5P_ to EXYNOS4_ to use it clearly.

[PATCH 1/3] ARM: EXYNOS: cleanup clock part for new EXYNOS SoCs
[PATCH 2/3] [CPUFREQ] EXYNOS4210: update the name of EXYNOS clock
[PATCH 3/3] PM / devfreq: update the name of EXYNOS clock register
