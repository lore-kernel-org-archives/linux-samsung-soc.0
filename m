Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr [80.12.242.19])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8999B1CAA79
	for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Apr 2025 15:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745247665; cv=none; b=NepgJZC9goXfnlh58732m3thNpb1oCoSx8QsY+3ZRjEetwEy7kZWYhDIVJn5phz+/YZw34fqSjI5EAu0YchskWdkE8nQwk5bdwpHaqZnLN4jLTArtn/exenmZdPr5aTEe7Py0CfzVIyTp6IFOIZKiAiCB7UL1ZvBCqKh59Y5Rek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745247665; c=relaxed/simple;
	bh=cqLBh8RKoyai0rDZ0YwoYN2gy4BTTtKqU1IFkhEjhcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HfTxT9kui5Exc3GJ9pgvUO/GcBXr7y+m+oVSIzQgEnjIaPifCBVpiiQxTJ7W1rj2+67zDY28ANnqXylUlIHhwpXTqavYZgW3FSsgSzEQi5pXpMUcBsxgZGefIVB8wnUOaeO8lENPjqsoRnKSfPO+bLTn1jF871xJrTMvz5FHyf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=TMDdinCe; arc=none smtp.client-ip=80.12.242.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="TMDdinCe"
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 6sdZuvbDkiSFB6sdouVInx; Mon, 21 Apr 2025 17:01:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1745247660;
	bh=lDiD6i5z74Svk8ayjFfG3byf2okiGeHcsi0aPvSYhp4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=TMDdinCevHrGlNSotraIExhYUUGQae64ddIrEp6bd0XSCA1+Jk0m7bu3F9FznLspd
	 y22+b3pTuyNWNdACISmjM9k3ZUa3BF0OP1kK5PQJ9Bcq8EKricbp/p1aM6WMKiAAtg
	 XTfdIlF+Vz7/Zj48lwAl4z1ZjfH6Y8wbpGGBQFQhmSiXMaR9f9bSPjyoDmMC4Ow7Cf
	 CGxOamH4eLNFL84D/KzE+HXEqAhDgMBh9RW9DPnEkzcuQgMja6tk68ORJc8iX7qoer
	 ozv6aqr3iIBSAcibvCrDYp0/C8TYO+8d/HShNSpC2xz/+fAhKotH/kNBQG1xWHYD+O
	 PECPhzQemEurQ==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 21 Apr 2025 17:01:00 +0200
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
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 3/3] mfd: exynos-lpass: Fix another error handling path in exynos_lpass_probe()
Date: Mon, 21 Apr 2025 17:00:35 +0200
Message-ID: <69471e839efc0249a504492a8de3497fcdb6a009.1745247209.git.christophe.jaillet@wanadoo.fr>
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

If devm_of_platform_populate() fails, some clean-up needs to be done, as
already done in the remove function.

Add a new devm_add_action_or_reset() to fix the leak in the probe and
remove the need of a remove function.

Fixes: c695abab2429 ("mfd: Add Samsung Exynos Low Power Audio Subsystem driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

Changes in v2:
  - Use a new devm_add_action_or_reset() to fix the leak in the probe
    and remove the need of a remove function.
  - Update the commit description accordingly

v1: https://lore.kernel.org/all/d224865a16b50498279b044a819e1e187d01bb28.1743231856.git.christophe.jaillet@wanadoo.fr/
---
 drivers/mfd/exynos-lpass.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/mfd/exynos-lpass.c b/drivers/mfd/exynos-lpass.c
index a2785ceea8bf..44797001a432 100644
--- a/drivers/mfd/exynos-lpass.c
+++ b/drivers/mfd/exynos-lpass.c
@@ -104,11 +104,22 @@ static const struct regmap_config exynos_lpass_reg_conf = {
 	.fast_io	= true,
 };
 
+static void exynos_lpass_disable_lpass(void *data)
+{
+	struct platform_device *pdev = data;
+	struct exynos_lpass *lpass = platform_get_drvdata(pdev);
+
+	pm_runtime_disable(&pdev->dev);
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		exynos_lpass_disable(lpass);
+}
+
 static int exynos_lpass_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct exynos_lpass *lpass;
 	void __iomem *base_top;
+	int ret;
 
 	lpass = devm_kzalloc(dev, sizeof(*lpass), GFP_KERNEL);
 	if (!lpass)
@@ -134,16 +145,11 @@ static int exynos_lpass_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 	exynos_lpass_enable(lpass);
 
-	return devm_of_platform_populate(dev);
-}
-
-static void exynos_lpass_remove(struct platform_device *pdev)
-{
-	struct exynos_lpass *lpass = platform_get_drvdata(pdev);
+	ret = devm_add_action_or_reset(dev, exynos_lpass_disable_lpass, pdev);
+	if (ret)
+		return ret;
 
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		exynos_lpass_disable(lpass);
+	return devm_of_platform_populate(dev);
 }
 
 static int __maybe_unused exynos_lpass_suspend(struct device *dev)
@@ -183,7 +189,6 @@ static struct platform_driver exynos_lpass_driver = {
 		.of_match_table	= exynos_lpass_of_match,
 	},
 	.probe	= exynos_lpass_probe,
-	.remove	= exynos_lpass_remove,
 };
 module_platform_driver(exynos_lpass_driver);
 
-- 
2.49.0

