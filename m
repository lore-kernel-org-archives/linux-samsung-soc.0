From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH v2] ARM: EXYNOS: add support GPIO for EXYNOS5250
Date: Thu, 16 Feb 2012 06:37:06 +0900
Message-ID: <1329341829-14403-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:40728 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754970Ab2BOVhv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Feb 2012 16:37:51 -0500
Received: by daed14 with SMTP id d14so1278837dae.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Feb 2012 13:37:50 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

This patch adds support GPIOlib for EXYNOS5250 and is including
use ioremap() for EXYNOS4210 and GPIO5250 GPIOlib instead of
static mapping.

Changes since v1:
- use ioremap() for base address of gpio instead of static
  mapping for EXYNOS4210 and EXYNOS5250

NOTE: this patches depend on EXYNOS5250 supporting patches

[PATCH v2 1/3] ARM: EXYNOS: add support GPIO for EXYNOS5250
[PATCH v2 2/3] gpio/samsung: add support GPIOlib for EXYNOS5250
[PATCH v2 3/3] gpio/samsung: use ioremap() for EXYNOS4 GPIOlib
