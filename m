Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795443517;
	b=zqCg7k3l1oIJzfMA3ukEAsSwE+rXohNO/TLTn3bgK3PZ9F+zp025Nno2U+eLYI/SWWfY
	 el2KrMTkwG1WiOIsQrZV7F7WNoIorGaFQvT+CVUvB7ELEtGOD+i2F/ro2xyIonko9pN0d
	 VnfIjKUX5kvHnOjKB3FOpPmpy9gS0S/JuHg47Pxl+O5NU4Qcnot9ZrmhXfxd7H5ZS9xnL
	 6u2sWd7NVneLwKWh/O2EIkEyfi715hZTDmXcFRviGb8uE6YlpXe2B8a04BgwDcJzvgyGd
	 6gseFqljjoQnSyhP9ARHmhfoWKGsPKMmWYh8ew7FjMjb79TbOMOPhYQd2thqXUxlftA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443517;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3fluvVfpug5iLZdmMQUOn3FkiB9On0yEomcYIj2Ur5Q=;
	b=cfpPdbz8A9XyG1Le7QmI2NwI72pIzLxBUpQJ5An3MHazvSTjbog3hp7mgEGHBFxAv7le
	 AnOjZLESmMSZHExlrW1cHeMxop/kGiguH3rgrTLa+QQGDV7jrzAKBTtkFFeazTiswZkXb
	 jPv6cFFwbbvLbmsl7zcvl8ONqjwO7FD8ygY3c/39OpprL2dNeS03zSqUZeKsm2Xap6RPP
	 xBvrOdusmo7tHhFqt6ql6XzAjcYG3MpfJzz4kI/ETnwFCv2bNVQGqtaoqP/CkHa0y0OsF
	 Qm862+sktcGUrC1IsIUUmeuWKpprsYCtjXF1bIJulm3uSZW42PggFwIeL7ZHw/kPTYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GMtjhjMh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B030606A336;
	Mon, 23 Nov 2026 14:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GMtjhjMh
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795443516;
	b=T5Xo5wQsDiMK0MA22EE1uu9b6zYfZUMqvinsvIkU7NU7Aq/FH7G4aPCJCipN7ETL0ozT
	 RSz9GYx+xQNTbKzT2wLaw3Z1yTqJ0DYP/nV0C+5AHysJDkIKSsNQCXjDuKv49NTRHQ+UQ
	 MkjJut55V26LgX6qgAFkS+OY79t+jQ4zQzuFZesWH6ZZg3YcUkxo29JK3MvRw8Qzo6sM1
	 1fyWRe2W60DyADWZVMA4k5UQUZhfu24H4g7A5A3ZANVy2eLxlinF83PyGkH86ZCNaGl8L
	 Puo4rzlZx9BYPG81ikkCfsEIwH/DY854t6XnsS8LMoDUhIlwng+WvFrVVrpsw6k5+VA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795443516;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3fluvVfpug5iLZdmMQUOn3FkiB9On0yEomcYIj2Ur5Q=;
	b=BXIjrMzNoGEEXuhQ9vjMWHaGzeEaWDbJ7fGdHXcbf3CoJ455jv2BLzKP6mxO+pK4qyKO
	 7azx+3yEjNsYXWR8Y2NiheahuKtWIAADuxe1qT5qD+3QJLBz9AidYCQyGzNhMrrpvEFul
	 pY7aObl5cJz6LG7T4qAYoUqKa+RycDTMCJKj4sSeJnqcAqm/Clwx1ytRhFfoOIp8osh00
	 PAfKD0Uaz5H+jZxfl+lYws1Ry6HfRi9lqefJ3foRKZjRZoLWCO3PhadumfSwrVVu4HHKZ
	 x/4S/cn26z1P2RLSBR32os3Wzq8ifSHiNksQ3FwVUO9WaoAmlSdDBPZADuW5+ZanGvA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 21B921F00ADE;
	Mon, 23 Nov 2026 14:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795443516;
	bh=3fluvVfpug5iLZdmMQUOn3FkiB9On0yEomcYIj2Ur5Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=GMtjhjMhHBUmUEiFgCuCB3PpiHm6lfLwevUogNkUHh11zJL0HFuFqLtD6jVv6s33h
	 KDoMzwu90uJci8RVj+iKquPxs/mDXCETJJhdT12P7WvO8hsIkqlzeVzuHEq1yr4g6E
	 lgaRQ0Wk833F6moivGBWtV9ab/gGT8Y18TVpsGY7vwhZWorOP8gzA0sgi7xdlVfF2U
	 3SJckakh6AvScDbIGOwpwZ5m+IywRCD+EhB3KYPbl1P4rUAeTB/gS4l9fc9Ax9pArB
	 7Ze7FEYPZOEEU8FtrNrTiA+yx+8rMbHWbgfpdk5hLmj+F9KW/5TLrUcU0rpwZPY9TC
	 rRRed9tjfzKrA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id ABDAC4C4D4;
	Mon, 23 Nov 2026 14:18:25 +0000 (UTC)
From: Shigeaki Asai via B4 Relay <devnull+y-asai.0816.docomonet.jp@kernel.org>
Date: Mon, 23 Nov 2026 23:18:24 +0900
Subject: [PATCH RFC 2/2] clk: samsung: exynos5-subcmu: defer probe until
 power domains are registered
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-exynos5-subcmu-defer-v1-2-43aef47d4f2b@docomonet.jp>
References: <20261123-exynos5-subcmu-defer-v1-0-43aef47d4f2b@docomonet.jp>
In-Reply-To: <20261123-exynos5-subcmu-defer-v1-0-43aef47d4f2b@docomonet.jp>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Shigeaki Asai <y-asai.0816@docomonet.jp>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795443504; l=4200;
 i=y-asai.0816@docomonet.jp; s=20261004; h=from:subject:message-id;
 bh=06wGL2OqoYzK5WTk4tX/mGxzOuQQyJdcsjmAmiOi95k=;
 b=De7pQ0KDp06OwJJM4PZolf4jW8UVsKntB1DYNyexEkHDE6wWOnybAAzOtp6kMInVJ5bwNGIUs
 uPLGYaZQuhkB93P9XKCNnR5yJc3UQrHyJ+xAi+e+Ter2V3Sv/eeDWUo
X-Developer-Key: i=y-asai.0816@docomonet.jp; a=ed25519;
 pk=jkd95ViSn8i/X3oPMHYG1A8mae8IOwOKGE64kzLqC5c=
X-Endpoint-Received: by B4 Relay for y-asai.0816@docomonet.jp/20261004 with
 auth_id=1110
X-Original-From: Shigeaki Asai <y-asai.0816@docomonet.jp>
Reply-To: y-asai.0816@docomonet.jp
Content-Transfer-Encoding: 7bit

From: Shigeaki Asai <y-asai.0816@docomonet.jp>

Since the Exynos power domain driver became a regular platform driver,
exynos5_clk_probe() may run before the power domains are registered.
The sub-CMU devices are created by the clock driver without a DT node,
so fw_devlink cannot order them after their power domains.
of_genpd_add_device() then fails silently, the sub-CMU devices are added
without a power domain and their clock setup is not restored across
power domain off/on cycles. On ODROID-XU4 this leaves the G3D clocks
misconfigured, causing very poor GPU performance and panfrost
"gpu sched timeout" errors.

Attach all sub-CMU devices to their power domains first, and defer the
probe if a power domain provider is not registered yet.

This patch was written with the help of Claude (claude-opus-5-5).

Fixes: c09a3e6c97f0 ("soc: samsung: pm_domains: Convert to regular platform driver")
Signed-off-by: Shigeaki Asai <y-asai.0816@docomonet.jp>
---
 drivers/clk/samsung/clk-exynos5-subcmu.c | 85 ++++++++++++++++++++++----------
 1 file changed, 58 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5-subcmu.c b/drivers/clk/samsung/clk-exynos5-subcmu.c
index 373129847301..797ec9f059cb 100644
--- a/drivers/clk/samsung/clk-exynos5-subcmu.c
+++ b/drivers/clk/samsung/clk-exynos5-subcmu.c
@@ -9,6 +9,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
+#include <linux/slab.h>
 
 #include "clk.h"
 #include "clk-exynos5-subcmu.h"
@@ -131,43 +132,73 @@ static struct platform_driver exynos5_subcmu_driver __refdata = {
 	.probe = exynos5_subcmu_probe,
 };
 
-static int __init exynos5_clk_register_subcmu(struct device *parent,
-					 const struct exynos5_subcmu_info *info,
-					      struct device_node *pd_node)
-{
-	struct of_phandle_args genpdspec = { .np = pd_node };
-	struct platform_device *pdev;
-	int ret;
-
-	pdev = platform_device_alloc("exynos5-subcmu", PLATFORM_DEVID_AUTO);
-	if (!pdev)
-		return -ENOMEM;
-
-	pdev->dev.parent = parent;
-	platform_set_drvdata(pdev, (void *)info);
-	of_genpd_add_device(&genpdspec, &pdev->dev);
-	ret = platform_device_add(pdev);
-	if (ret)
-		platform_device_put(pdev);
-
-	return ret;
-}
-
 static int __init exynos5_clk_probe(struct platform_device *pdev)
 {
+	struct platform_device **subcmus;
 	struct device_node *np;
 	const char *name;
-	int i;
+	int i, n = 0, ret;
+
+	subcmus = kcalloc(nr_cmus, sizeof(*subcmus), GFP_KERNEL);
+	if (!subcmus)
+		return -ENOMEM;
 
 	for_each_compatible_node(np, NULL, "samsung,exynos4210-pd") {
+		struct of_phandle_args genpdspec = { .np = np };
+
 		if (of_property_read_string(np, "label", &name) < 0)
 			continue;
-		for (i = 0; i < nr_cmus; i++)
-			if (strcmp(cmu[i]->pd_name, name) == 0)
-				exynos5_clk_register_subcmu(&pdev->dev,
-							    cmu[i], np);
+		for (i = 0; i < nr_cmus && n < nr_cmus; i++) {
+			struct platform_device *sub;
+
+			if (strcmp(cmu[i]->pd_name, name) != 0)
+				continue;
+
+			sub = platform_device_alloc("exynos5-subcmu",
+						    PLATFORM_DEVID_AUTO);
+			if (!sub) {
+				of_node_put(np);
+				ret = -ENOMEM;
+				goto err;
+			}
+			sub->dev.parent = &pdev->dev;
+			platform_set_drvdata(sub, (void *)cmu[i]);
+
+			ret = of_genpd_add_device(&genpdspec, &sub->dev);
+			if (ret == -ENOENT || ret == -EPROBE_DEFER) {
+				platform_device_put(sub);
+				of_node_put(np);
+				ret = dev_err_probe(&pdev->dev, -EPROBE_DEFER,
+						    "power domain %s not ready\n",
+						    name);
+				goto err;
+			} else if (ret) {
+				dev_warn(&pdev->dev,
+					 "failed to add %s sub-CMU to its power domain: %d\n",
+					 name, ret);
+			}
+			subcmus[n++] = sub;
+		}
+	}
+
+	for (i = 0; i < n; i++) {
+		ret = platform_device_add(subcmus[i]);
+		if (ret) {
+			pm_genpd_remove_device(&subcmus[i]->dev);
+			platform_device_put(subcmus[i]);
+		}
 	}
+
+	kfree(subcmus);
 	return 0;
+
+err:
+	while (n--) {
+		pm_genpd_remove_device(&subcmus[n]->dev);
+		platform_device_put(subcmus[n]);
+	}
+	kfree(subcmus);
+	return ret;
 }
 
 static const struct of_device_id exynos5_clk_of_match[] = {

-- 
2.43.0


