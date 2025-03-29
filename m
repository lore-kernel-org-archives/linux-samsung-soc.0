Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr [80.12.242.25])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145721581F9
	for <linux-samsung-soc@vger.kernel.org>; Sat, 29 Mar 2025 07:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743234444; cv=none; b=e0yAYRhNsF5Nrb6O5ioKt+jZrtljSsnPfXPpkO6lqWQlCFjHhld/aH/3uqFZihJlLbEpQLTX2237dCPNK50axbFdDVZVNmrXTUOl0QPKlQGfGrSCG4dA6y8sTT3DSr7qXqnclOxVL2zUrZb5V2o8I3sPqescRMdzVuusp8PmzZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743234444; c=relaxed/simple;
	bh=m8V0vELosjMEi2lRQu+v2yxrgQPQu+IsVPQcDAhIlyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nJz1aXp8HuFrIifvzu/z9g10mBSSzNzBLFVinD6IP8zwcOiRvU7upqb+dnF/xuO6A+j3lUjMH/oX6Mkxez7Sl2FayIQJNHfZ80Y219x2K/fLMCA7/lpb624VYZfM93KbVrV8EyWQGCMa8AqK8OshVedvVsDSoxY2KSmzz7vNtBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=sMjhG3sp; arc=none smtp.client-ip=80.12.242.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="sMjhG3sp"
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id yQtAtsN3Ol9slyQtWteVbm; Sat, 29 Mar 2025 08:46:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1743234378;
	bh=4LCH57c1dhGxYdF7fm0yxki2rBXjTc81wlG/k7Z0uK0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=sMjhG3spoP5M9YlmLwCgPiXoJqJF1CR7rIox5NYC/4EAvamy48n3GDFo9h18XDntW
	 qy7VzK5ylsU0Tgjhy6IibuKBn4NXsA6b9RfJbttybLasOH2IzcVRpuA5sMfTcdkv7w
	 Rfo/OH0yvtZskUtmdzpPYFx61DbhilXCGa1+oTl5ZvKzPkor9hqFabVo+FLkQNPMre
	 AIL9J2zw3o2rtOLUna0p8pwbcAVVskCpFRkLItryc89W3ocu49ZockyT533meijGV7
	 teWA6pB+UaO1DIX5HyLjL2w19nvUC38ztb9whV9ZAWHIQqO+yPRmgQhnShsCu00xB9
	 JGzzFin6gEStw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 29 Mar 2025 08:46:18 +0100
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
Subject: [PATCH 2/4] mfd: exynos-lpass: Avoid calling exynos_lpass_disable() twice in exynos_lpass_remove()
Date: Sat, 29 Mar 2025 08:45:46 +0100
Message-ID: <ee6241d024c4cb68622dde9d65d8712016f4205e.1743231856.git.christophe.jaillet@wanadoo.fr>
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

exynos_lpass_disable() is called twice in the remove function. Remove
one of these calls.

Fixes: 90f447170c6f ("mfd: exynos-lpass: Add runtime PM support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.
---
 drivers/mfd/exynos-lpass.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mfd/exynos-lpass.c b/drivers/mfd/exynos-lpass.c
index 6b95927e99be..a2785ceea8bf 100644
--- a/drivers/mfd/exynos-lpass.c
+++ b/drivers/mfd/exynos-lpass.c
@@ -141,7 +141,6 @@ static void exynos_lpass_remove(struct platform_device *pdev)
 {
 	struct exynos_lpass *lpass = platform_get_drvdata(pdev);
 
-	exynos_lpass_disable(lpass);
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		exynos_lpass_disable(lpass);
-- 
2.49.0

