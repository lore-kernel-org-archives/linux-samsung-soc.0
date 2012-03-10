From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/5] ARM: EXYNOS: update clock part for new EXYNOS SoC
Date: Sat, 10 Mar 2012 02:19:04 -0800
Message-ID: <1331374749-23256-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:62343 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753176Ab2CJKTS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 10 Mar 2012 05:19:18 -0500
Received: by iagz16 with SMTP id z16so3631387iag.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Mar 2012 02:19:17 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: olof@lixom.net

This patches are splited out as per Olof's suggestion.

And this series is including following:

- move mach-exynos/clock.c to mach-exynos/clock-exynos4.c
- according to moving clock-exynos4.c,
  move <mach/exynos4-clock.h> to "clock-exynos4.h"
- the prefix of clk register replace S5P_ with EXYNOS4_
- add prefix exynos4_ on clk declaration
- add clock registers for exynos4x12-cpufreq

[PATCH 1/5] ARM: EXYNOS: replace clock.c for other new EXYNOS SoCs
[PATCH 2/5] ARM: EXYNOS: use static declaration on regarding clock
[PATCH 3/5] ARM: EXYNOS: change the prefix S5P_ to EXYNOS4_ for
[PATCH 4/5] PM / devfreq: update the name of EXYNOS clock register
[PATCH 5/5] ARM: EXYNOS: add clock registers for exynos4x12-cpufreq
