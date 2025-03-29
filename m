Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr [80.12.242.25])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164BB35977
	for <linux-samsung-soc@vger.kernel.org>; Sat, 29 Mar 2025 07:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743234445; cv=none; b=B53AfEaAYo7AkqezxMiktGocZi9PTkrUGDnYTSjppjh8TKC+NsmoNXKROIlgxSMiNt7cTyyUl9U8fPovpaqiaSzALh76g+iFf5SbIGMcMGXC7cYz27c8nDrHPt5YzRP9JgG/046ZsVlRVlEHgf7YeXc1wpiAH/YVkZ6mKlt06FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743234445; c=relaxed/simple;
	bh=hlhm6x1Iba11hQIC2ruSqILP/CL0rPLRG6ghhSeB+Tg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jFh1U6JZg+hz5yn6pkaSj1gM4LZqqVRVOyIxQx6Vrkev0fJQFBW0caja4T1tXgOE/4L3utrgPa8G21qUTUAM9145DwAm7WfJWLMuc4b6T9vwYm6LDjnKBoa90GW08Did+ebDLhf61MllwYIgtYBulVyYknwkqLpUauww0rh0fyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=toNjNc9z; arc=none smtp.client-ip=80.12.242.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="toNjNc9z"
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id yQtAtsN3Ol9slyQtateVht; Sat, 29 Mar 2025 08:46:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1743234382;
	bh=KNdM5ts0wg1oqDwj15hlgi9Z0FrXnMRdaahatqUkprE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=toNjNc9z8A13w9pHBhyEt10kmMSCVLOwaRh8sQqF0KYujLm1+4+ltUK4HTV9XFkrj
	 UN4Li0VoUiMJ/noc5zosYfrUn6njUPMRx7/d57sQ3WY57/tPnN8LfvYv0v/5W2OHJH
	 MUAIhS6t8WH6wQmD3FAs12yYUtIMx1RqJ4b1yzVseCkZ04ymljsucsUyZo9gHY2WQZ
	 aLk+9hoAuv/JmNQqTddLhoNqrI5bnraOaoT5I72SkRVlFpp99pb2ACnpjYJcjcNXl4
	 jc8siBqdnbwKPXdEB5PHr4j76eOE81PZOoNv5vUR+dx0bzcgtbOtx16rk+lgKJ87sP
	 oOnJcRteUfvhw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 29 Mar 2025 08:46:22 +0100
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
Subject: [PATCH 3/4] mfd: exynos-lpass: Move exynos_lpass_remove()
Date: Sat, 29 Mar 2025 08:45:47 +0100
Message-ID: <1de670e6b9fa33cb81a34e5f882e79b80e479490.1743231856.git.christophe.jaillet@wanadoo.fr>
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

In order be able to call exynos_lpass_remove() from the error handling
path of the probe, it first needs to be moved before the probe.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/mfd/exynos-lpass.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/exynos-lpass.c b/drivers/mfd/exynos-lpass.c
index a2785ceea8bf..7fd8585ba35a 100644
--- a/drivers/mfd/exynos-lpass.c
+++ b/drivers/mfd/exynos-lpass.c
@@ -104,6 +104,15 @@ static const struct regmap_config exynos_lpass_reg_conf = {
 	.fast_io	= true,
 };
 
+static void exynos_lpass_remove(struct platform_device *pdev)
+{
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
@@ -137,15 +146,6 @@ static int exynos_lpass_probe(struct platform_device *pdev)
 	return devm_of_platform_populate(dev);
 }
 
-static void exynos_lpass_remove(struct platform_device *pdev)
-{
-	struct exynos_lpass *lpass = platform_get_drvdata(pdev);
-
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		exynos_lpass_disable(lpass);
-}
-
 static int __maybe_unused exynos_lpass_suspend(struct device *dev)
 {
 	struct exynos_lpass *lpass = dev_get_drvdata(dev);
-- 
2.49.0

