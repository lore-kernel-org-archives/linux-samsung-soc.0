Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr [80.12.242.19])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EC11459EA;
	Mon, 21 Apr 2025 15:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745247662; cv=none; b=Cs69nYY+BNLe212YTtiHtFzHWb4TBvM7pTamBi4c8Ri10qMcijx+ExEAks51hYXEhEYPslUK4i7uDqHBj+qlFDHnsJ3KuxILUoREDvLXzeSkSLY7j3MdsAmAFI8VAAzO2NhZCRorn20XyUEl7atUpLL2cFwGRugik8C0nWe0nlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745247662; c=relaxed/simple;
	bh=iaNOkzsF96dsxsP5jO9Ta0EMxEmROOiFcolC/Wu7GGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lMNyp+mq6reSAkJxRs0ssOBw2w7OXPKU+iyEayrJPsa6haQCKHRBX4qh8mVpfF1DJ/lqqyXXzIQJAkN7AKvQO5ROxEeLVOtzisCQ5OLbbeZdP7j7vzcLY/J1q+UXlDXxD7lZE2irnGZ9hwVP/Qh4knirjw/c9igiHhtR8H/hkh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=esv9mfjI; arc=none smtp.client-ip=80.12.242.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="esv9mfjI"
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 6sdZuvbDkiSFB6sdluVIa4; Mon, 21 Apr 2025 17:00:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1745247658;
	bh=kmKeC0voji7GXJXSCy45n8sW+gBgOqpDdUUwmio5UWo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=esv9mfjI3IxjRMItKDgfq8laaLN4gYB6ZtonvSfzHT0HhD3vlbg8YqzU7RMqCEuh1
	 SBZ0EUlwuXh+LQcqzuSFPnX5HsNIVUueWxXMwSQujyHDsSngU4wGQ1GSR6IaOllgyM
	 FZEq6hcLuvqK1H+PTmOwFGcGhItAGbRYgNgwOjoq+AcB+MaAlw42U5wDY/8oTBqKlI
	 ujPjx8grbM3MZ1QeEnRxqNJ49Qry9Wj4URFip9YZP216LjOE8/5E9ygGiYKe6FlRpc
	 Le6loVjsibTrrufwh4QkZ70LRVxDl1XEQW6eBi6kYsCfUmrv0gdbUIzPhIIYFlbdpI
	 nw4Id/xBkzrmw==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 21 Apr 2025 17:00:58 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: lee@kernel.org,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	m.szyprowski@samsung.com,
	ideal.song@samsung.com,
	beomho.seo@samsung.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/3] mfd: exynos-lpass: Fix an error handling path in exynos_lpass_probe()
Date: Mon, 21 Apr 2025 17:00:33 +0200
Message-ID: <38414eecb1096840946756ae86887aea2a489c1b.1745247209.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745247209.git.christophe.jaillet@wanadoo.fr>
References: <cover.1745247209.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an error occurs after a successful regmap_init_mmio(), regmap_exit()
should be called as already done in the .remove() function.

Switch to devm_regmap_init_mmio() to avoid the leak and simplify the
.remove() function.

Fixes: c414df12bdf7 ("mfd: exynos-lpass: Add missing remove() function")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Compile tested only.

Changes in v2:
  - Add R-b tag
  - Change the commit ID in Fixes

v1: https://lore.kernel.org/all/d125cbc479f1fa838ed0ff25f0e11d25f382e9d4.1743231856.git.christophe.jaillet@wanadoo.fr/
---
 drivers/mfd/exynos-lpass.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/exynos-lpass.c b/drivers/mfd/exynos-lpass.c
index 6a585173230b..6b95927e99be 100644
--- a/drivers/mfd/exynos-lpass.c
+++ b/drivers/mfd/exynos-lpass.c
@@ -122,8 +122,8 @@ static int exynos_lpass_probe(struct platform_device *pdev)
 	if (IS_ERR(lpass->sfr0_clk))
 		return PTR_ERR(lpass->sfr0_clk);
 
-	lpass->top = regmap_init_mmio(dev, base_top,
-					&exynos_lpass_reg_conf);
+	lpass->top = devm_regmap_init_mmio(dev, base_top,
+					   &exynos_lpass_reg_conf);
 	if (IS_ERR(lpass->top)) {
 		dev_err(dev, "LPASS top regmap initialization failed\n");
 		return PTR_ERR(lpass->top);
@@ -145,7 +145,6 @@ static void exynos_lpass_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		exynos_lpass_disable(lpass);
-	regmap_exit(lpass->top);
 }
 
 static int __maybe_unused exynos_lpass_suspend(struct device *dev)
-- 
2.49.0

