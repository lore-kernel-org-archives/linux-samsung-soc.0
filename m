Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr [80.12.242.25])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2106718C02E
	for <linux-samsung-soc@vger.kernel.org>; Sat, 29 Mar 2025 07:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743234437; cv=none; b=EodJ6BpSMGrZlI3/gEQa5PPBBApwwNVnjUD96v72+HLtgLDOXs2V+gF2QkMr/cSWOpMVRE5teftoiJZP0oA09S+OoYXWf2DPOYrv2SP3cTEevpJRZVlUmgZIfQwuFRQUsfjqV0E9Ch4uCZy+8S0GdMlJZv1+Rgvx+UErX94O50k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743234437; c=relaxed/simple;
	bh=gdAiGcHA9ACA8gEU5ZV3breg3WLc8uWPyOoly+XVgws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rrTwrEKsUoKVO9Cuu2oOXsy+hLGD+boi9tGBYqw7SQRS8PGIoWpN2ZsyPyNxFLgLuPXuJKzVrUDwakp7GWDSfHE0icI47n7KNEuaH3rXnK0kGa45jiOSHE8IFZaTS8kA8DNGjo8rwVdBcRq4fWgEpFlCpogCcBhO0wtMuWWoKwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=a7IGOrxC; arc=none smtp.client-ip=80.12.242.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="a7IGOrxC"
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id yQtAtsN3Ol9slyQtPteVWL; Sat, 29 Mar 2025 08:46:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1743234371;
	bh=lxG5GpmIEqwoUGwr9bKBwNL+mtU3l6sCszbqj7Kxf5k=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=a7IGOrxC3ED9Gj0NKMZBuUpb3nmtMAW5WTnV5xDlQida/pNILs6MYQAfcCUYl8jQM
	 HfhLvVpPiVOa65RHj8V97d82otML7mK/Agj6jM1g/GbYix2BhHCk06AmNZ8ZS35N5E
	 i0Dab7gM3eqHYuAHh0pQqEMy1EACDJ5TR0cGvsM2laAi16LGag3xSdGI5o8VZHs0ie
	 dblxMUNIl8nkxDiCiftaPx+yCk1iz3XGYyl+xaym2Xr0XQxjy7grz0hFjFLpxsgIs2
	 LvU6T4Yfs1eeXMX1tRVZeX1eq849X2xJbjUH8TVGamh+KvvSL4s/mHXcYiD4Duknyr
	 ALJWB3QkNN4OA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 29 Mar 2025 08:46:11 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: lee@kernel.org,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	beomho.seo@samsung.com,
	ideal.song@samsung.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 1/4] mfd: exynos-lpass: Fix an error handling path in exynos_lpass_probe()
Date: Sat, 29 Mar 2025 08:45:45 +0100
Message-ID: <d125cbc479f1fa838ed0ff25f0e11d25f382e9d4.1743231856.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1743231856.git.christophe.jaillet@wanadoo.fr>
References: <cover.1743231856.git.christophe.jaillet@wanadoo.fr>
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

Fixes: c695abab2429 ("mfd: Add Samsung Exynos Low Power Audio Subsystem driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
The .remove function was added in commit c414df12bdf7 ("mfd: exynos-lpass:
Add missing remove() function")

Compile tested only.
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

