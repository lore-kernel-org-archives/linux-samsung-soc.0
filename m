From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 0/2] ARM: EXYNOS: Add DRM device to Origen and SMDKV310
Date: Tue, 27 Mar 2012 10:10:37 +0530
Message-ID: <1332823239-12280-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:58890 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752937Ab2C0EsX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Mar 2012 00:48:23 -0400
Received: by pbcun15 with SMTP id un15so6884481pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Mar 2012 21:48:23 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

This patch series adds DRM core device and FIMD DRM platform device support 
to Origen and SMDKV310 boards.

This series depends on the following patch:
http://www.spinics.net/lists/arm-kernel/msg164762.html

Sachin Kamat (2):
  ARM: EXYNOS: Add DRM device to Origen
  ARM: EXYNOS: Add DRM device to SMDKV310

 arch/arm/mach-exynos/Kconfig         |    2 ++
 arch/arm/mach-exynos/mach-origen.c   |   31 +++++++++++++++++++++++++++++++
 arch/arm/mach-exynos/mach-smdkv310.c |   30 ++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+), 0 deletions(-)

-- 
1.7.4.1
