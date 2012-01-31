From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/2] ARM: EXYNOS: support GPIO for EXYNOS5250
Date: Wed,  1 Feb 2012 00:50:38 +0900
Message-ID: <1328025040-4751-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:51817 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753340Ab2AaPux (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Jan 2012 10:50:53 -0500
Received: by pbdu11 with SMTP id u11so266795pbd.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Jan 2012 07:50:53 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Grant Likely <grant.likely@secretlab.ca>

This patch adds support GPIOlib for EXYNOS5250 SoC.

Note: this patch depends on supporting EXYNOS5250 patches and
will be updated when EXYNOS5 DT is supported.

[PATCH 1/2] ARM: EXYNOS: add support GPIO for EXYNOS5250
[PATCH 2/2] gpio/samsung: add support GPIOlib for EXYNOS5250
