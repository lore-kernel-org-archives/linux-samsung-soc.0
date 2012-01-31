From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/3] ARM: EXYNOS: adds dma mdma and for new EXYNOS SoCs
Date: Wed,  1 Feb 2012 00:57:14 +0900
Message-ID: <1328025437-5396-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:64900 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753368Ab2AaP5b (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Jan 2012 10:57:31 -0500
Received: by pbdu11 with SMTP id u11so270918pbd.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Jan 2012 07:57:31 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

This patches are including various suppporting DMA on
EXYNOS SoCs like following.

[PATCH 1/3] ARM: EXYNOS: Enable MDMA driver
[PATCH 2/3] ARM: EXYNOS: Support DMA for EXYNOS4X12 SoC
[PATCH 3/3] ARM: EXYNOS: Support DMA for EXYNOS5250 SoC
