Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793278292;
	b=W8KOZKaSLrOhrlLh38lsBpTc4MwxsOAYnyx/jF6iwGjDG0igBPiNdKvYUibsj80upNSs
	 mtrIZ9Hrr5pc5LT1fnwENjkXnMnQ4O+oHKEmdUV7KmfdUt3mt2Vhvbok8UKeIi4pbJhaA
	 +lWS+I+uq4mduEeYLWQObWVlYzpRySze1z8Pux6wqMo3idXpOKAidPivrMeEO8rLwf4j2
	 2EG0gxQDBOQ9ub25+hcGTIWTMADxP5ovL5ZdBn/tzxWMzIVKU8WkHUiYGxaiAyWNa09kN
	 IS1AJh5wCL784gd11qqHhIGNChWFyT9nC3n2ULkqowvbwTU6okxKybQ8KKZlf6wdtDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793278292;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=LXqnjPVoIvX80Y2AzOOGeUQEC4Xg6CbGHN9TjzLorQc=;
	b=TYLjEgEk/0oeqJaNHdUPsnTVnaG9BQz12QVgidfjrl9crKkohDcnhbB8LoeYGOA6/EkT
	 gxZhdHxIl0Vn9WHM4bQUOi9PiCfUnQyS8MCBlfWINH7Qz6bQw3UGjGJbiGNCMm1DdyCyR
	 XPQn6cKjUxYf+GdVR6erYdHEZFKBn8isqtysaIRAd+moPnXXS3aK0ZLjkWukBbQERcGzs
	 rWyU+QXiq2659qAamTqOMwd/ku0L8waeWfq0uMveDzaa+t+CohqhrdHb4mx8BS4At05ZJ
	 WRgypAmJIV+d+x7NkLlFIrPaVDTW8ILmSwvoTWPX9Gm5hr5wl0RXXXN7j6dBQQvLqVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=vaxsIe0+;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52295606A31D
	for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Oct 2026 12:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52295606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=vaxsIe0+
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261029125129euoutp01bdb3513844f4250b6c96c5a999c4d78b~jARpIOQOL1974319743euoutp01-
	for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Oct 2026 12:51:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261029125129euoutp01bdb3513844f4250b6c96c5a999c4d78b~jARpIOQOL1974319743euoutp01-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793278289;
	bh=LXqnjPVoIvX80Y2AzOOGeUQEC4Xg6CbGHN9TjzLorQc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vaxsIe0+YIFOOy3cfZDngHhRowEamY2LT717GcbxV5i93xGKqSHsyXQsGXrLpl7FI
	 BGpfnNniVVQ07V5jIp2L3bFOCwNsmjxiJnUJREW6g9WVOxxI2vJmhrTCbuBQUwwcn+
	 yMkNTBWAcXKGwO9uUcuq0CoJRclRDZI8JfEFPRqg=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261029125128eucas1p1b444765ed47e86e79db4dc516ca42da8~jARotU5vx0763107631eucas1p15;
	Thu, 29 Oct 2026 12:51:28 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261029125127eusmtip1f12fed402b94d21ae852444ab691c4a8~jARoHDm3r2292422924eusmtip1W;
	Thu, 29 Oct 2026 12:51:27 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, Alim
	Akhtar <alim.akhtar@samsung.com>, Stephen Boyd <sboyd@kernel.org>, Brian
	Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>,
	Henrik Grimler <henrik@grimler.se>, stable@vger.kernel.org
Subject: [PATCH v2 1/3] clk: samsung: exynos-audss: Propagate -EPROBE_DEFER
 from input clocks
Date: Thu, 29 Oct 2026 13:51:14 +0100
Message-ID: <20261029125118.3191455-2-m.szyprowski@samsung.com>
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
X-CMS-MailID: 20261029125128eucas1p1b444765ed47e86e79db4dc516ca42da8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261029125128eucas1p1b444765ed47e86e79db4dc516ca42da8
X-EPHeader: CA
X-CMS-RootMailID: 20261029125128eucas1p1b444765ed47e86e79db4dc516ca42da8
References: <20261029125118.3191455-1-m.szyprowski@samsung.com>
	<CGME20261029125128eucas1p1b444765ed47e86e79db4dc516ca42da8@eucas1p1.samsung.com>

exynos_audss_clk_probe() fetches the optional pll_ref/pll_in/cdclk/
sclk_audio/sclk_pcm_in input clocks with devm_clk_get() and only
checks IS_ERR() before falling back to a default parent clock name.
This means a transient -EPROBE_DEFER (e.g. because the clock provider
behind "pll_in" has not registered its real clock yet) is silently
treated the same as the clock simply not being present, so the
mout_audss/mout_i2s muxes get permanently registered with the wrong
parent name.

Fix this by checking for -EPROBE_DEFER on each of these clocks right
after fetching them, before anything is registered, and bailing out
of probe so it gets retried once the real clocks are available.

Fixes: 547f33509ccc ("clk: exynos-audss: allow input clocks to be specified in device tree")
Cc: stable@vger.kernel.org
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos-audss.c | 33 +++++++++++++++++++-------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/samsung/clk-exynos-audss.c
index e11ac67819ef..950c67491dad 100644
--- a/drivers/clk/samsung/clk-exynos-audss.c
+++ b/drivers/clk/samsung/clk-exynos-audss.c
@@ -152,7 +152,25 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
 	clk_table = clk_data->hws;
 
 	pll_ref = devm_clk_get(dev, "pll_ref");
+	if (PTR_ERR(pll_ref) == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+
 	pll_in = devm_clk_get(dev, "pll_in");
+	if (PTR_ERR(pll_in) == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+
+	cdclk = devm_clk_get(dev, "cdclk");
+	if (PTR_ERR(cdclk) == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+
+	sclk_audio = devm_clk_get(dev, "sclk_audio");
+	if (PTR_ERR(sclk_audio) == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+
+	sclk_pcm_in = devm_clk_get(dev, "sclk_pcm_in");
+	if (PTR_ERR(sclk_pcm_in) == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+
 	if (!IS_ERR(pll_ref))
 		mout_audss_p[0] = __clk_get_name(pll_ref);
 	if (!IS_ERR(pll_in)) {
@@ -169,6 +187,12 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
 			}
 		}
 	}
+	if (!IS_ERR(cdclk))
+		mout_i2s_p[1] = __clk_get_name(cdclk);
+	if (!IS_ERR(sclk_audio))
+		mout_i2s_p[2] = __clk_get_name(sclk_audio);
+	if (!IS_ERR(sclk_pcm_in))
+		sclk_pcm_p = __clk_get_name(sclk_pcm_in);
 
 	/*
 	 * Enable runtime PM here to allow the clock core using runtime PM
@@ -185,12 +209,6 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
 				CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
 				reg_base + ASS_CLK_SRC, 0, 1, 0, &lock);
 
-	cdclk = devm_clk_get(dev, "cdclk");
-	sclk_audio = devm_clk_get(dev, "sclk_audio");
-	if (!IS_ERR(cdclk))
-		mout_i2s_p[1] = __clk_get_name(cdclk);
-	if (!IS_ERR(sclk_audio))
-		mout_i2s_p[2] = __clk_get_name(sclk_audio);
 	clk_table[EXYNOS_MOUT_I2S] = clk_hw_register_mux(dev, "mout_i2s",
 				mout_i2s_p, ARRAY_SIZE(mout_i2s_p),
 				CLK_SET_RATE_NO_REPARENT,
@@ -224,9 +242,6 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
 				 "sclk_pcm", CLK_SET_RATE_PARENT,
 				reg_base + ASS_CLK_GATE, 4, 0, &lock);
 
-	sclk_pcm_in = devm_clk_get(dev, "sclk_pcm_in");
-	if (!IS_ERR(sclk_pcm_in))
-		sclk_pcm_p = __clk_get_name(sclk_pcm_in);
 	clk_table[EXYNOS_SCLK_PCM] = clk_hw_register_gate(dev, "sclk_pcm",
 				sclk_pcm_p, CLK_SET_RATE_PARENT,
 				reg_base + ASS_CLK_GATE, 5, 0, &lock);
-- 
2.43.0

