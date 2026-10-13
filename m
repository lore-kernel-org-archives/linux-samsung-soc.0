Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DD94EB878
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Oct 2026 11:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890339; cv=none; b=FgAZKrn8nsOQTRw4CzyBJLW6LFVEChWRybn9QOETCFyW4FapvKeLAUhRaG1SY4qmonrj1O9J2O1DBkqsjA0cLEkuMfYWsa73iwmR2URIo3epwCVKfpSOc4WYTHNxUh5kjy40GhPrh47wffHkiIm+sUmVwZQCJ6Bqyys5w7R6ihw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890339; c=relaxed/simple;
	bh=Pmb/9CzQoF1Kn6vDWWXveaw+TPjp7YU+ATqmm/fuEFI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=HdjiGUVwLbbytRxO5JudgpZ5raoe265jZRwUTBo/AkhBRtC9p2BlsT0pd45h5mnixPlgY7fVQnFjYddFyK4q1k6bLiSN5y93dDGQPGMnrrDs8H9oLqXw+kbenfmjugBrGelV+YHclTnuprqPt5SxRgHUCs3eR6CMwtGhdvn43Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=J0WY8qxK; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="J0WY8qxK"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261013111848euoutp01bcbf4113812268746ddeb3019a672829~eEsJ2s_GV1171611716euoutp01Z
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Oct 2026 11:18:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261013111848euoutp01bcbf4113812268746ddeb3019a672829~eEsJ2s_GV1171611716euoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791890328;
	bh=KpYuu+5yyvf79YSypMq6/mLWCSOaEtNzRYOOB+G4PEs=;
	h=From:To:Cc:Subject:Date:References:From;
	b=J0WY8qxKLPasnsknDSNCnYC/qKVJ1CNc9OzFXCKZIHdG0ybHo7x+SRR/X7YEsDtDT
	 vfdRzcLmQQBM8XpIJw2TfqISZQIOiA9IfggVTnKTm8zYmi0BlWyxN+PLiLeIiTzoyo
	 kF8b1J/ioaVmUEUCYg1jFdyWaeqGFxgmPZUfJXX8=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261013111847eucas1p24df37631cc74fa27879f7d979348a1e1~eEsJlCsuX2644726447eucas1p2B;
	Tue, 13 Oct 2026 11:18:47 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261013111847eusmtip1451a44e6abb62a9f217269a01c39c6a2~eEsJBl8CZ0615106151eusmtip1w;
	Tue, 13 Oct 2026 11:18:47 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, Alim
	Akhtar <alim.akhtar@samsung.com>, Stephen Boyd <sboyd@kernel.org>, Brian
	Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>
Subject: [PATCH] clk: samsung: exynos5-subcmu: Defer probe until power
 domains are available
Date: Tue, 13 Oct 2026 13:18:38 +0200
Message-ID: <20261013111840.3645724-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261013111847eucas1p24df37631cc74fa27879f7d979348a1e1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261013111847eucas1p24df37631cc74fa27879f7d979348a1e1
X-EPHeader: CA
X-CMS-RootMailID: 20261013111847eucas1p24df37631cc74fa27879f7d979348a1e1
References: <CGME20261013111847eucas1p24df37631cc74fa27879f7d979348a1e1@eucas1p2.samsung.com>

Sub-CMU devices are added to their power domains with
of_genpd_add_device() during exynos5_clk_probe(). Its return value is
ignored, so if the power domain provider is not registered yet, the
sub-CMU device is silently left outside of its power domain.

Since commit c09a3e6c97f0 ("soc: samsung: pm_domains: Convert to regular
platform driver"), power domain providers are registered only when their
platform devices are probed, which happens after exynos5_clk_probe() has
already been called.

When a sub-CMU device is outside of its power domain, its runtime PM
callbacks race with the power domain state changes, which might result in
losing the proper hardware state. In practice, some clock muxes are left
switched to the oscillator instead of the respective PLLs.

Fix this by deferring exynos5_clk_probe() until the platform devices for
all available power domains are instantiated.

Fixes: c09a3e6c97f0 ("soc: samsung: pm_domains: Convert to regular platform driver")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos5-subcmu.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5-subcmu.c b/drivers/clk/samsung/clk-exynos5-subcmu.c
index 373129847301..587fe6e3bbed 100644
--- a/drivers/clk/samsung/clk-exynos5-subcmu.c
+++ b/drivers/clk/samsung/clk-exynos5-subcmu.c
@@ -6,6 +6,7 @@
 
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
@@ -155,11 +156,25 @@ static int __init exynos5_clk_register_subcmu(struct device *parent,
 
 static int __init exynos5_clk_probe(struct platform_device *pdev)
 {
+	static const char pd_node_name[] = "samsung,exynos4210-pd";
 	struct device_node *np;
 	const char *name;
 	int i;
 
-	for_each_compatible_node(np, NULL, "samsung,exynos4210-pd") {
+	/* Defer until all needed power domains are registered */
+	for_each_compatible_node(np, NULL, pd_node_name) {
+		if (of_device_is_available(np)) {
+			struct platform_device *pd = of_find_device_by_node(np);
+
+			if (!pd) {
+				of_node_put(np);
+				return -EPROBE_DEFER;
+			}
+			put_device(&pd->dev);
+		}
+	}
+
+	for_each_compatible_node(np, NULL, pd_node_name) {
 		if (of_property_read_string(np, "label", &name) < 0)
 			continue;
 		for (i = 0; i < nr_cmus; i++)
-- 
2.43.0

