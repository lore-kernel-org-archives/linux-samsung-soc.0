Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7C4307AEE
	for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Oct 2025 09:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761298583; cv=none; b=farVMsuYjuvPirJX4xr3dxd+3fFYw5A2pDuVaYXrfS5UrY5DzoaF/ckGD17GFy4j/m8judoINI71OuRQeiHakqgIrgjB32BraLyajf4YOup0xPlT3B5YH5nIbp7RKM2nWZB4E+KIW8HnUKzZGvIBbclUfx8ipCygawv2f+Kj/dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761298583; c=relaxed/simple;
	bh=IhwFcLohg6CKFfqE7EDdE2jMLoyb02JJ0wyha3Wr1cs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=f1xC9KxOqQvnOvfSJ3Ei37jLkMv60RX8aruX9nx58ymb9J3xTQfVkFoaPEXaTZF7qqt53c9z1QvIL3LZqHD9vgXklDriUezVdiGNFEmlrlL0z5FZZb5nMyI/XF/U/RTnHwdrsL0fXS5y/UQ4DQyP3gH9bSUNgFhquNuwVLtLbQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=idr7lAAe; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="idr7lAAe"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251024093618euoutp01410a8e460008efb355012faa450014da~xY7mtoT_K1267712677euoutp01q
	for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Oct 2025 09:36:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251024093618euoutp01410a8e460008efb355012faa450014da~xY7mtoT_K1267712677euoutp01q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761298578;
	bh=ERmBh8xYiDTbvxZ7jovH95wfR/eqlSI7mH3VZQ40nNM=;
	h=From:To:Cc:Subject:Date:References:From;
	b=idr7lAAeHj3cE08helkfkXeCVQed8SvbyIeVFsCUnJ8U0eVgMBVikdkO0L5K9l/Cl
	 tif7KXj4ZfaBUzSFlsWF7mkX9oAsMIankUuKA2xYGr4XxiXJO9L+CXW0KMV/i/34cH
	 uihW/51e54r3KKg9qb3hdbj+JsMkgSUStQkCpEFg=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251024093617eucas1p2a84deaa88e39692fd4933d14684aaeb9~xY7mU8nQK3107431074eucas1p2n;
	Fri, 24 Oct 2025 09:36:17 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251024093617eusmtip29ebfba4ee32bac7b05eb047c444494d7~xY7l7mEAJ2834328343eusmtip2Z;
	Fri, 24 Oct 2025 09:36:17 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, =?UTF-8?q?Andr=C3=A9=20Draszik?=
	<andre.draszik@linaro.org>, Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH] pmdomain: samsung: Rework legacy splash-screen handover
 workaround
Date: Fri, 24 Oct 2025 11:36:03 +0200
Message-Id: <20251024093603.3484783-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251024093617eucas1p2a84deaa88e39692fd4933d14684aaeb9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251024093617eucas1p2a84deaa88e39692fd4933d14684aaeb9
X-EPHeader: CA
X-CMS-RootMailID: 20251024093617eucas1p2a84deaa88e39692fd4933d14684aaeb9
References: <CGME20251024093617eucas1p2a84deaa88e39692fd4933d14684aaeb9@eucas1p2.samsung.com>

Limit the workaround for splash-screen handover handling to the affected
power domains in legacy ARM 32bit systems and replace forcing a
sync_state by explicite power domain shutdown. This approach lets
compiler to optimize it out on newer ARM 64bit systems.

Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
Fixes: 0745658aebbe ("pmdomain: samsung: Fix splash-screen handover by enforcing a sync_state")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index f53e1bd24798..8e7ac1ab0780 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -128,6 +128,16 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	pd->pd.power_on = exynos_pd_power_on;
 	pd->local_pwr_cfg = pm_domain_cfg->local_pwr_cfg;
 
+	/*
+	 * Some Samsung platforms with bootloaders turning on the splash-screen
+	 * and handing it over to the kernel, requires the power-domains to be
+	 * reset during boot.
+	 */
+	if (IS_ENABLED(CONFIG_ARM) &&
+	    of_device_is_compatible(np, "samsung,exynos4210-pd") &&
+	    (strstr(pd->pd.name, "LCD") || strstr(pd->pd.name, "DISP")))
+		exynos_pd_power_off(&pd->pd);
+
 	on = readl_relaxed(pd->base + 0x4) & pd->local_pwr_cfg;
 
 	pm_genpd_init(&pd->pd, NULL, !on);
@@ -146,15 +156,6 @@ static int exynos_pd_probe(struct platform_device *pdev)
 				parent.np, child.np);
 	}
 
-	/*
-	 * Some Samsung platforms with bootloaders turning on the splash-screen
-	 * and handing it over to the kernel, requires the power-domains to be
-	 * reset during boot. As a temporary hack to manage this, let's enforce
-	 * a sync_state.
-	 */
-	if (!ret)
-		of_genpd_sync_state(np);
-
 	pm_runtime_enable(dev);
 	return ret;
 }
-- 
2.34.1

