From: Jongpill Lee <boyko.lee@samsung.com>
Subject: [PATCH V2 0/3] ASV support for Exynos4 series
Date: Thu, 10 Nov 2011 14:48:00 +0900
Message-ID: <1320904083-19173-1-git-send-email-boyko.lee@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:48695 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757458Ab1KJIQJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Nov 2011 03:16:09 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, boyko.lee@gmail.com

Each SoC has specification.For example voltage or ids current.
These values are related to production process.
If you have a good specification SoC, you can supply lower voltage into SoC.
Also, If your SoC has bad specification, you have to supply higher voltage into SoC.
So, after get these SoC specification value on initialize time, we can use these value to fix voltage for running SoC.
Using by this patch set, Exynos4210 can get SoC specification and adjust voltage.

[PATCH V2 1/3] ARM: EXYNOS4: Add ASV feature for Exynos4 series
[PATCH V2 2/3] ARM: EXYNOS4: Add clock for Exynos4210 asv feature
[PATCH V2 3/3] ARM: EXYNOS4: Support ASV for Exynos4210
