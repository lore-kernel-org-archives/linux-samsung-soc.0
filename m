Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793278292;
	b=NdMcdffNnbQJoFK2eYsNHRKFneMyGR/paC5/SJWVZZS340ErgEcaBPuNz5jSaBzuKlGP
	 D0nIEGIhQ+F/9MgzLG/Lly+NcuzD8HKPYRwBWJLXJLcMxnOvoXWyjNUg64d1v8N4vQxXb
	 75yljiF0ACE7w93b1qIgm/aCDNmp1MJShtWTcSTcSyKBXs/0xVnKR343bJNcBSDtq0jEr
	 Gmg5AY3diArxbbkpnQ63IsAx7v1gRoAPGRWxakJBZOCDFYrzxgWrXYynJAEDWtGvvOgpd
	 Bh8ipvuTubjv5cwYc5XgZHpTn53wD2YLXwasQELEEvkUwjcEDbquV6KzPGdyuMgMCdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793278292;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=0z8I7+VZAbfeTmBO2ZoCkH8Xj6XUxaC9cA+avhAcoWY=;
	b=XqkaP5S8kI+csG53Q3VVJPsFEP720oZkwAxjFVGXtx9fzQIexhsjAvU6Hrj8vP334Fa3
	 JrMx98Fhlgd5yCXBL6HoghVJzYTLQCg/nmX+Goo62yjtSZQ+2Io+iyK4XIvwan68eKn/D
	 Laij2FW/ylAKk/icGxn57w42O624yMJ1Sq+IXmGqiYJzpgzk/yivMI3kxU22oNjOmCama
	 i3iGskjh8U0f8hcNe7X+avu/IMGWqYjMPriqo4eMcOu2g1YPiFZmYRn2DVTd8pSxOYpBC
	 iTdsqT5j1hNqpgRHWXsKiY+UfBahR2SlPIFV8LFuJ1F7Vmb4cida63RTQ/Z+56NkPjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=vWKczAz5;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED580606A31F
	for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Oct 2026 12:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED580606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=vWKczAz5
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261029125129euoutp0153903f321126e4fa53f1f092e1457ecb~jARpw1ptN2183521835euoutp01R
	for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Oct 2026 12:51:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261029125129euoutp0153903f321126e4fa53f1f092e1457ecb~jARpw1ptN2183521835euoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793278289;
	bh=0z8I7+VZAbfeTmBO2ZoCkH8Xj6XUxaC9cA+avhAcoWY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vWKczAz5M8ASPmqV4EaK5jcatQg5a1jlm5jA7CUUes7awowc5hLgdhkq1BKUNgPVU
	 tKPW3tulgsF7SSJ9yDB350acCmOP6x81D9odO1ovdZ2O0qORF/LVLq9f+0EL8qlrpG
	 B0lgko+CzJnZzlBSuDoJMFYhcwclHm6FE0/9IwgU=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261029125129eucas1p2e1c92c4797566ea359e2ccfa1c343cbe~jARpfWWo02295322953eucas1p2K;
	Thu, 29 Oct 2026 12:51:29 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261029125128eusmtip1cfc3b3e8c1081bad41a7bae8a52f0b7c~jARoy7IhX2755927559eusmtip1W;
	Thu, 29 Oct 2026 12:51:28 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, Alim
	Akhtar <alim.akhtar@samsung.com>, Stephen Boyd <sboyd@kernel.org>, Brian
	Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>,
	Henrik Grimler <henrik@grimler.se>, stable@vger.kernel.org
Subject: [PATCH v2 2/3] clk: samsung: exynos5-subcmu: Use
 pm_runtime_get_sync() during probe
Date: Thu, 29 Oct 2026 13:51:15 +0100
Message-ID: <20261029125118.3191455-3-m.szyprowski@samsung.com>
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
X-CMS-MailID: 20261029125129eucas1p2e1c92c4797566ea359e2ccfa1c343cbe
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261029125129eucas1p2e1c92c4797566ea359e2ccfa1c343cbe
X-EPHeader: CA
X-CMS-RootMailID: 20261029125129eucas1p2e1c92c4797566ea359e2ccfa1c343cbe
References: <20261029125118.3191455-1-m.szyprowski@samsung.com>
	<CGME20261029125129eucas1p2e1c92c4797566ea359e2ccfa1c343cbe@eucas1p2.samsung.com>

The clocks are registered right after pm_runtime_get(), which only
schedules a resume asynchronously and doesn't guarantee the device (and
its power domain) is active yet. Use pm_runtime_get_sync() to ensure the
power domain is really on while the clock registers are accessed during
the registration.

Fixes: b06a532bf1fa ("clk: samsung: Add Exynos5 sub-CMU clock driver")
Cc: stable@vger.kernel.org
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos5-subcmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5-subcmu.c b/drivers/clk/samsung/clk-exynos5-subcmu.c
index 373129847301..1d7eb98b72cf 100644
--- a/drivers/clk/samsung/clk-exynos5-subcmu.c
+++ b/drivers/clk/samsung/clk-exynos5-subcmu.c
@@ -103,7 +103,7 @@ static int __init exynos5_subcmu_probe(struct platform_device *pdev)
 
 	pm_runtime_set_suspended(dev);
 	pm_runtime_enable(dev);
-	pm_runtime_get(dev);
+	pm_runtime_get_sync(dev);
 
 	ctx->dev = dev;
 	samsung_clk_register_div(ctx, info->div_clks, info->nr_div_clks);
-- 
2.43.0

