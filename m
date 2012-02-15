From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH v2 0/3] ARM: EXYNOS: add support mdma and EXYNOS4X12 dma
Date: Thu, 16 Feb 2012 07:31:30 +0900
Message-ID: <1329345093-16180-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:58456 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753103Ab2BOWbq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Feb 2012 17:31:46 -0500
Received: by pbcun15 with SMTP id un15so1798945pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Feb 2012 14:31:45 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

This patch adds support enabling mdma driver and dma for EXYNOS4X12.
Basically, not changed but rebased on arm-soc/depends/rmk/for-armsoc
and merged next/cleanup-exynos-clock-v2 and next/cleanup-use-static.

[PATCH v2 1/3] ARM: EXYNOS: Enable MDMA driver
[PATCH RE-SEND 2/3] ARM: EXYNOS: Add apb_pclk clkdev entry for mdma1
[PATCH v2 3/3] ARM: EXYNOS: add support DMA for EXYNOS4X12 SoC
