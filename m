Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793278292;
	b=ctJrQAJRmmSxMkHx80dUeGRmi4n9Hl++3lcuasqjuhR/F8hKTg9kSF3BpVOiS9mj/p+2
	 zinFpwY0Sn+kHcONn2xyQAKcsSD/HJ5Kws9izQemxF2mstXYbqkoku557t9QJoEX26U1J
	 3NcvatFGe+Pc+99iR75CxWH3iAPTFMGeZrMPx/F5Kd6sc938CJAUf9+shVAwuWmp6XXur
	 FGGuLOA0PGNuh6iVAwfhVDw93bdYLubYStJr3NeObJM9N9CRFTcAgqMgrKfxVvqP89rXr
	 Ee3h4kWtjFm07grbwNnbt55i9bChBLQfe/WfW9K4h1WuxFYiRjRtAx36jShoy89eu2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793278292;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=67EGvNIS8KeJSyQnwCqUer3qWVX4S55gYKUvwBlcqZY=;
	b=hoseSCNW1Ka52PkFdYZLw4tI8U3q+2AcCq0wKliXwmkfdYenojxjF4prTVIXBhBPj93d
	 mut0QsF1ezwvx7HXvLWKtzkq1TucRqPfmYyC7lc5UgXxDIHFU3EQUdRgryGHm5FH2VGKS
	 QYEAAo+JeQobGdKqdLOysr1nrBpD81s4OyK8Ep5+iEmpQUy1lIdWT+rC+eCaXrDBJ6XRK
	 80o8vekJLOEG9ez8SAjri6+ghe/dYi6OlNmeW3/9R+Kst4Kf3Xcc8g7txTfKp4eAHXGxH
	 4sBbsevm7tHzwXqLedGopcIFkx5KimugHW+5ZpDggVi9QOi/HNRYdqdpI/A4+pe4xIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=iQbDDog7;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC18E606A31C
	for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Oct 2026 12:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC18E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=iQbDDog7
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261029125130euoutp01a0452cb12048aa4a22a6e2d154ef0f2a~jARqfbkVP2179621796euoutp01V
	for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Oct 2026 12:51:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261029125130euoutp01a0452cb12048aa4a22a6e2d154ef0f2a~jARqfbkVP2179621796euoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793278290;
	bh=67EGvNIS8KeJSyQnwCqUer3qWVX4S55gYKUvwBlcqZY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iQbDDog7ggMl38gE5PNMQ+8TAB+FApzTu0976f4g7FsdInIAH8FlfipML632mrY6w
	 AakLsBntVCI6txf+f5NLNHBtJL3uteqtlHuWkDqoV5NL0nhzCnsiphjwmu4mddRaAT
	 PhiwqdDyI6ZleBGZBCU15n5BTHdiUIOK9Qkjtj18=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261029125130eucas1p28348b477be508aac4d38b8eb808459e4~jARqF_yeF2283122831eucas1p2R;
	Thu, 29 Oct 2026 12:51:30 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261029125129eusmtip157395c595e3571d915eeb84fb57db3e5~jARpfSFU22778227782eusmtip1U;
	Thu, 29 Oct 2026 12:51:29 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, Alim
	Akhtar <alim.akhtar@samsung.com>, Stephen Boyd <sboyd@kernel.org>, Brian
	Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>,
	Henrik Grimler <henrik@grimler.se>, stable@vger.kernel.org
Subject: [PATCH v2 3/3] clk: samsung: exynos5-subcmu: Defer probe until
 power domains are available
Date: Thu, 29 Oct 2026 13:51:16 +0100
Message-ID: <20261029125118.3191455-4-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029125118.3191455-1-m.szyprowski@samsung.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261029125130eucas1p28348b477be508aac4d38b8eb808459e4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261029125130eucas1p28348b477be508aac4d38b8eb808459e4
X-EPHeader: CA
X-CMS-RootMailID: 20261029125130eucas1p28348b477be508aac4d38b8eb808459e4
References: <20261029125118.3191455-1-m.szyprowski@samsung.com>
	<CGME20261029125130eucas1p28348b477be508aac4d38b8eb808459e4@eucas1p2.samsung.com>

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
Cc: stable@vger.kernel.org
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos5-subcmu.c | 27 ++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5-subcmu.c b/drivers/clk/samsung/clk-exynos5-subcmu.c
index 1d7eb98b72cf..fe67c3066f2e 100644
--- a/drivers/clk/samsung/clk-exynos5-subcmu.c
+++ b/drivers/clk/samsung/clk-exynos5-subcmu.c
@@ -6,6 +6,7 @@
 
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
@@ -96,7 +97,7 @@ static int __maybe_unused exynos5_subcmu_resume(struct device *dev)
 	return 0;
 }
 
-static int __init exynos5_subcmu_probe(struct platform_device *pdev)
+static int exynos5_subcmu_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct exynos5_subcmu_info *info = dev_get_drvdata(dev);
@@ -122,7 +123,7 @@ static const struct dev_pm_ops exynos5_subcmu_pm_ops = {
 				     pm_runtime_force_resume)
 };
 
-static struct platform_driver exynos5_subcmu_driver __refdata = {
+static struct platform_driver exynos5_subcmu_driver = {
 	.driver	= {
 		.name = "exynos5-subcmu",
 		.suppress_bind_attrs = true,
@@ -131,7 +132,7 @@ static struct platform_driver exynos5_subcmu_driver __refdata = {
 	.probe = exynos5_subcmu_probe,
 };
 
-static int __init exynos5_clk_register_subcmu(struct device *parent,
+static int exynos5_clk_register_subcmu(struct device *parent,
 					 const struct exynos5_subcmu_info *info,
 					      struct device_node *pd_node)
 {
@@ -153,13 +154,27 @@ static int __init exynos5_clk_register_subcmu(struct device *parent,
 	return ret;
 }
 
-static int __init exynos5_clk_probe(struct platform_device *pdev)
+static int exynos5_clk_probe(struct platform_device *pdev)
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
@@ -177,7 +192,7 @@ static const struct of_device_id exynos5_clk_of_match[] = {
 	{ },
 };
 
-static struct platform_driver exynos5_clk_driver __refdata = {
+static struct platform_driver exynos5_clk_driver = {
 	.driver	= {
 		.name = "exynos5-clock",
 		.of_match_table = exynos5_clk_of_match,
-- 
2.43.0

