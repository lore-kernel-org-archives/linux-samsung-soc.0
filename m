Received: from mta.al2klimov.de (mta.al2klimov.de [162.55.223.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801B330C618;
	Tue, 26 May 2026 06:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.223.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779776023; cv=none; b=f8EqHwXfrHR8VMhFFuSFNDRMmhYRHx3mRCq8mdhtoxNBQtLFXEwx+33WjtMg3TX3MQ7LCWDYEAk6oEkwsiZTN3h38Yalsn/gncUkOnYvEpwZ1nFiLKSRFU0fQQLAwkl+qvxVRo6NaEUnOboTpDAMWZx7krwOyhqf3vB9IeoAZNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779776023; c=relaxed/simple;
	bh=VQwPEACzLrn3sirzJhEJwSUsl+8N7bfQkDfoCfrIXz0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IM+b3APfb3EDnk0AL/9U6kdmryG9QTJUPYAc3k+pWi0O+6DlYIKTQqcTh+30z7ypH0FkkT4rMr3DCS1u1hD4I+5Cal2DpfkvMh8jiqe0cXCGwLxDaG1fYKEN56fliZDFFhcQzYvSx3Hr1DGsJ4gMLZBIcpWFeEoGAuwNUaHs0Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de; spf=pass smtp.mailfrom=al2klimov.de; dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b=FR8Xwd3e; arc=none smtp.client-ip=162.55.223.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b="FR8Xwd3e"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=VQwPEACzLrn3
	sirzJhEJwSUsl+8N7bfQkDfoCfrIXz0=; h=date:subject:cc:to:from;
	d=al2klimov.de; b=FR8Xwd3eL2vwsAGnlMaWeh4Pljo1eFEpKwrdVXr2zBe+tBwPVlcp
	mTonJL/JmYeGMORZCri1YG3pqVj6EVS6xsEA8781MGkjt8XDD0UMnu2mIjXEEXrHmPkyS6
	ocDt4qaBdmy0HAnYvsstjWl+hey+lNaRkdK3+9saOdWlFq5uEs+jSdyG9WHDWO4YoqjrQc
	dNpTUGEA5/q0W0X73tNez3OsC9Vlcp4jnGCFgD0CpJAImYZwrheab5aP6y5oyymfudXkN0
	o8rSEC3hZiiiximX46wwBuc1GrLQz7U8jDEIoMwIIMaHSUikav/jz3hqIkGSiwMM9U7UYf
	KyxST6KZeQ==
Received: from cachy-ak (88.215.123.80.dyn.pyur.net [88.215.123.80])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id c93a46ee (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Tue, 26 May 2026 06:13:37 +0000 (UTC)
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG SOC CLOCK DRIVERS),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] clk: samsung: exynos5410: fix refcount leak
Date: Tue, 26 May 2026 08:13:12 +0200
Message-ID: <20260526061321.6123-1-grandmaster@al2klimov.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Every value returned from of_clk_get() is supposed to be cleaned up
via clk_put() once not needed anymore.

Fixes: be95d2c7d918 ("clk: samsung: Add support for EPLL on exynos5410")
Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 drivers/clk/samsung/clk-exynos5410.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5410.c b/drivers/clk/samsung/clk-exynos5410.c
index baa9988c7bb7..0cd9b0392cf5 100644
--- a/drivers/clk/samsung/clk-exynos5410.c
+++ b/drivers/clk/samsung/clk-exynos5410.c
@@ -269,8 +269,12 @@ static void __init exynos5410_clk_init(struct device_node *np)
 {
 	struct clk *xxti = of_clk_get(np, 0);
 
-	if (!IS_ERR(xxti) && clk_get_rate(xxti) == 24 * MHZ)
-		exynos5410_plls[epll].rate_table = exynos5410_pll2550x_24mhz_tbl;
+	if (!IS_ERR(xxti)) {
+		if (clk_get_rate(xxti) == 24 * MHZ)
+			exynos5410_plls[epll].rate_table =
+				exynos5410_pll2550x_24mhz_tbl;
+		clk_put(xxti);
+	}
 
 	samsung_cmu_register_one(np, &cmu);
 
-- 
2.54.0

