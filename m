From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: [PATCH v2 2/3] ARM: exynos: Add exynos5800-pmu compatible entry
Date: Thu, 21 Aug 2014 18:52:36 +0545
Message-ID: <1408626457-3422-3-git-send-email-vikas.sajjan@samsung.com>
References: <1408626457-3422-1-git-send-email-vikas.sajjan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:52500 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755199AbaHUNH5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Aug 2014 09:07:57 -0400
Received: by mail-pd0-f179.google.com with SMTP id v10so13984050pde.24
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Aug 2014 06:07:56 -0700 (PDT)
In-Reply-To: <1408626457-3422-1-git-send-email-vikas.sajjan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, sajjan.linux@gmail.com, dianders@chromium.org, olof@lixom.net

Adds exynos5800-pmu compatible string entry in the pmu table.

Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
---
 arch/arm/mach-exynos/exynos.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index 6a24e11..90377c9 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -255,6 +255,7 @@ static const struct of_device_id exynos_dt_pmu_match[] = {
 	{ .compatible = "samsung,exynos5260-pmu" },
 	{ .compatible = "samsung,exynos5410-pmu" },
 	{ .compatible = "samsung,exynos5420-pmu" },
+	{ .compatible = "samsung,exynos5800-pmu" },
 	{ /*sentinel*/ },
 };
 
-- 
1.7.9.5
