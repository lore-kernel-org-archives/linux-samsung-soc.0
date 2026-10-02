Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961EE3F104F
	for <linux-samsung-soc@vger.kernel.org>; Fri,  2 Oct 2026 09:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932901; cv=none; b=eK4fSgEU8HxJp9KJVE4wwtKuaadxdx6pCiAmSr3qYWWm5aY3ufRQG6zqcMT6xH03CCBxKk1QDr6iHWi9JWJWSylE+QHkIIc56KBtTRBnLGp4J4j6ho1biTuFmyuwKuubk/mYYevjkLE1LYpXpdGtAj46MBlVD98RMBJ+sHt0Hu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932901; c=relaxed/simple;
	bh=O3Thk85sAHH5QJSY/mJodPK3iAZArYt5dGhHPaasDbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=gghy8rY0w+5rNT6wZmRxg1LOprtCPHskZkypUljEhuPAHKboeQ/AjRUcX/YA76XhOk+6X6BEoT5ncH3YN4guuvPsvcIUNx7HDxeB42pUYPHjCJXVVicGqLDL5Co41k9wsOP+nio3ecL0WpF/P8IdLDNDBfQNMnb3Bna1VFu0Uwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=dN6qg1gu; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="dN6qg1gu"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261002092130euoutp025a40c22fcede663dc0f883f91dc1b942~aq-meTEDD1198611986euoutp02w
	for <linux-samsung-soc@vger.kernel.org>; Fri,  2 Oct 2026 09:21:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261002092130euoutp025a40c22fcede663dc0f883f91dc1b942~aq-meTEDD1198611986euoutp02w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1790932890;
	bh=wWIBM+vRTtRDKTeZi7RkFmomnPRhth9vGh3Bb1rqyRc=;
	h=From:To:Cc:Subject:Date:References:From;
	b=dN6qg1guHaU+q0LkGhogicm5nAkI6Z5vMmF80y1KcuzyW1A80rss3mfVZUO55aRdy
	 c4KMU3xTuQMxvvm97TPj9yd2u6L0w8MhwOuNJlJqWjCLo4jsakD7gwOzMdo0/MEsef
	 Uvp6wrtRmBbk4tl57RUPd8w2xYccMxxK1GRZWopQ=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261002092130eucas1p1bc0065c21bf1f1e0418ef5b845f72bc6~aq-mLbVUT2596625966eucas1p1B;
	Fri,  2 Oct 2026 09:21:30 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261002092129eusmtip1104c6d782ba79a90563a90a49af2ab93~aq-l23EO23106231062eusmtip1P;
	Fri,  2 Oct 2026 09:21:29 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-sound@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>
Subject: [PATCH] ASoC: samsung: i2s: enable op_clk in probe to balance
 runtime PM
Date: Fri,  2 Oct 2026 11:21:12 +0200
Message-ID: <20261002092116.585466-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261002092130eucas1p1bc0065c21bf1f1e0418ef5b845f72bc6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261002092130eucas1p1bc0065c21bf1f1e0418ef5b845f72bc6
X-EPHeader: CA
X-CMS-RootMailID: 20261002092130eucas1p1bc0065c21bf1f1e0418ef5b845f72bc6
References: <CGME20261002092130eucas1p1bc0065c21bf1f1e0418ef5b845f72bc6@eucas1p1.samsung.com>

The probe function puts the device into the runtime PM active state with
only the "iis" bus clock enabled, but it also sets priv->op_clk to the
parent of the RCLK_SRC mux without enabling it. The runtime PM suspend
callback disables both clocks, so the first runtime suspend after probe
disables op_clk once more than it was enabled.

On Exynos5250 Arndale both clocks resolve to the same EXYNOS_I2S_BUS gate,
so this triggers the following warning during boot:

 WARNING: drivers/clk/clk.c:1270 at clk_core_disable+0xe4/0x23c, CPU#0: kworker/u8:3/45
 i2s_bus already disabled
 ...
 Workqueue: pm pm_runtime_work
 Call trace:
  ...
  clk_core_disable from clk_disable+0x28/0x34
  clk_disable from i2s_runtime_suspend+0x58/0x68 [snd_soc_i2s]
  i2s_runtime_suspend [snd_soc_i2s] from genpd_runtime_suspend+0xc4/0x298
  genpd_runtime_suspend from __rpm_callback+0x48/0x18c
  __rpm_callback from rpm_callback+0x4c/0x50
  rpm_callback from rpm_suspend+0xf4/0x718
  rpm_suspend from pm_runtime_work+0x9c/0xa0
  ...

Fix this by enabling op_clk in probe right after getting it, so the clock
state matches the runtime PM active state, and by disabling it in remove.

Fixes: 48279c53fd1d ("ASoC: samsung: i2s: Prevent external abort on exynos5433 I2S1 access")
Assisted-by: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 sound/soc/samsung/i2s.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 3e76cb81462f..442e70b107da 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1534,9 +1534,16 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 		goto err_disable_pm;
 
 	priv->op_clk = clk_get_parent(priv->clk_table[CLK_I2S_RCLK_SRC]);
+	ret = clk_prepare_enable(priv->op_clk);
+	if (ret < 0) {
+		priv->op_clk = NULL;
+		goto err_unregister_clk;
+	}
 
 	return 0;
 
+err_unregister_clk:
+	i2s_unregister_clock_provider(priv);
 err_disable_pm:
 	pm_runtime_disable(&pdev->dev);
 err_del_sec:
@@ -1559,6 +1566,7 @@ static void samsung_i2s_remove(struct platform_device *pdev)
 
 	i2s_unregister_clock_provider(priv);
 	i2s_delete_secondary_device(priv);
+	clk_disable_unprepare(priv->op_clk);
 	clk_disable_unprepare(priv->clk);
 
 	pm_runtime_put_noidle(&pdev->dev);
-- 
2.43.0

