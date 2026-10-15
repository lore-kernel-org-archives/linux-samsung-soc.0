Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5E14A9D62
	for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Oct 2026 11:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065024; cv=none; b=HN/AAxeMoI6h4LZ3iPEcbkQJ3u/OlFTC/ZDhNdXcMzKDXsCcxwJR6yMRZru/ZvCAA58cdjin+zF8noLeOmfpjFQfaaRSec41qxZ+2v9GnapVTFmGb+nkXFWh9ZFio4EcVeV1BpEAh9A04trA8jGVK2o524xYUoYjFFq4/0LVu9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065024; c=relaxed/simple;
	bh=/mDHA4KJTGY3TrDLVzkgSXixkRLERv6h6F6Sa39ZjLU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=NeEB/KALaAKZBt+LrtuUhz5gVgVFNlmsMMr7d1n4yrMd5xkhTfjNqYWjjgfE8RSFpfm+Oaic2Z3Lldgm7YmKecKw9aHyOldZKMXuejOBUEahl1vXpaY2nG8kKBibpkyonokZMPHIevQmgjVUajQXeIp0G93cYHFUT3fv8Edf+Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=VFr349+G; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="VFr349+G"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261015115020euoutp01e617afbbe8a638ddcc41ac8947400e2a~esaQ51fTD2874528745euoutp01L
	for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Oct 2026 11:50:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261015115020euoutp01e617afbbe8a638ddcc41ac8947400e2a~esaQ51fTD2874528745euoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792065020;
	bh=6UofuFpzzN1lK89cXgKUM2PbWKLz4kyridFu08qheMM=;
	h=From:To:Cc:Subject:Date:References:From;
	b=VFr349+G7e6ImHFs2khnTSGiV4PpwlE4WWXhSpnpIZAowENa6SIi6/4b9qWPd7I3M
	 ZpTETjjd4SOqYeatDrHEkwE5zPXLUxY3ZoCNPumGcss37WE3tN0zWeYOQRm2PbNecG
	 +A/9IGub94sNEJNBbj/j9yUGduUgrHVvUW3+O1m0=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261015115020eucas1p1652dcb97079fc506b99422994680d76e~esaQeAUMW0106901069eucas1p1o;
	Thu, 15 Oct 2026 11:50:20 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261015115019eusmtip2e8124c6771c12cfa08445087c6278001~esaP6ALnX0510405104eusmtip2_;
	Thu, 15 Oct 2026 11:50:19 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, Alim
	Akhtar <alim.akhtar@samsung.com>, Stephen Boyd <sboyd@kernel.org>, Brian
	Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>
Subject: [PATCH] clk: samsung: exynos5-subcmu: Use pm_runtime_get_sync()
 during probe
Date: Thu, 15 Oct 2026 13:50:06 +0200
Message-ID: <20261015115008.600082-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261015115020eucas1p1652dcb97079fc506b99422994680d76e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261015115020eucas1p1652dcb97079fc506b99422994680d76e
X-EPHeader: CA
X-CMS-RootMailID: 20261015115020eucas1p1652dcb97079fc506b99422994680d76e
References: <CGME20261015115020eucas1p1652dcb97079fc506b99422994680d76e@eucas1p1.samsung.com>

The clocks are registered right after pm_runtime_get(), which only
schedules a resume asynchronously and doesn't guarantee the device (and
its power domain) is active yet. Use pm_runtime_get_sync() to ensure the
power domain is really on while the clock registers are accessed during
the registration.

Fixes: b06a532bf1fa ("clk: samsung: Add Exynos5 sub-CMU clock driver")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos5-subcmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5-subcmu.c b/drivers/clk/samsung/clk-exynos5-subcmu.c
index 587fe6e3bbed..886836494838 100644
--- a/drivers/clk/samsung/clk-exynos5-subcmu.c
+++ b/drivers/clk/samsung/clk-exynos5-subcmu.c
@@ -104,7 +104,7 @@ static int __init exynos5_subcmu_probe(struct platform_device *pdev)
 
 	pm_runtime_set_suspended(dev);
 	pm_runtime_enable(dev);
-	pm_runtime_get(dev);
+	pm_runtime_get_sync(dev);
 
 	ctx->dev = dev;
 	samsung_clk_register_div(ctx, info->div_clks, info->nr_div_clks);
-- 
2.43.0

