From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: [PATCH 1/2] ARM: Exynos4: Put PCM, Slimbus, Spdif clocks to off state
Date: Thu,  6 Sep 2012 19:46:08 +0530
Message-ID: <1346940968-4423-1-git-send-email-chander.kashyap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:33474 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751780Ab2IFOQp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Sep 2012 10:16:45 -0400
Received: by pbbrr13 with SMTP id rr13so2566127pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Sep 2012 07:16:45 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, patches@linaro.org

The clocks for PCM, Slimbus, Spdif added to off list in order
to turn them off at boot time.

Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
---
 arch/arm/mach-exynos/clock-exynos4.c |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/mach-exynos/clock-exynos4.c b/arch/arm/mach-exynos/clock-exynos4.c
index 7cc5491..6a45c9a 100644
--- a/arch/arm/mach-exynos/clock-exynos4.c
+++ b/arch/arm/mach-exynos/clock-exynos4.c
@@ -627,6 +627,25 @@ static struct clk exynos4_init_clocks_off[] = {
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 21),
 	}, {
+		.name		= "pcm",
+		.devname	= "samsung-pcm.1",
+		.enable		= exynos4_clk_ip_peril_ctrl,
+		.ctrlbit	= (1 << 22),
+	}, {
+		.name		= "pcm",
+		.devname	= "samsung-pcm.2",
+		.enable		= exynos4_clk_ip_peril_ctrl,
+		.ctrlbit	= (1 << 23),
+	}, {
+		.name		= "slimbus",
+		.enable		= exynos4_clk_ip_peril_ctrl,
+		.ctrlbit	= (1 << 25),
+	}, {
+		.name		= "spdif",
+		.devname	= "samsung-spdif",
+		.enable		= exynos4_clk_ip_peril_ctrl,
+		.ctrlbit	= (1 << 26),
+	}, {
 		.name		= "ac97",
 		.devname	= "samsung-ac97",
 		.enable		= exynos4_clk_ip_peril_ctrl,
-- 
1.7.9.5
