Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91371C7009;
	Mon, 21 Apr 2025 15:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745247663; cv=none; b=mvmb2g7mJh2FyNquDpVOkQTUEydV4RiVvPiUXdK+imZ4tgobGYMnRzRx1vxTcgK9cH8wGH7LTa7BHPVC4JyyndZ+y6z1U9tT3wripNxbEbgBCxUvYNLJBP9WK7bbfcYt6dkfNueeLwJ+Ml8njRkwKFDOybMfdctfn2zoPqdOBzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745247663; c=relaxed/simple;
	bh=r2Oi+FdkU2X57ETtJqwc+QGUuX81xnR1Um7f3BPN7aY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=USqw5ZoTG0jzJMTiB1dYUp76Rq41tq6dvhWWaeXIWnMn23gr+lhX/uX49Fz+ERcWFClOvm9j2P477UE1fdU2PCdT/RSYUaz20Np8PDtWEee2dkz2EdgTiOCUupzyMZ6uVf0MjRM/kvDmL4VET0KTcNovMPIb9XNML3Lqn+cn7nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=lanKLMiB; arc=none smtp.client-ip=80.12.242.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="lanKLMiB"
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 6sdZuvbDkiSFB6sdnuVIhr; Mon, 21 Apr 2025 17:00:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1745247659;
	bh=eQGxct6K/kcQfnhWWRbqYBef9aZOoyPtucqW7qysfzE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=lanKLMiBzIxfxJmc7t6l6/EY6wAoIPabSGxj0Rr9WYgZ1DtW4LG5/yX6ZzxSPoewd
	 S09Fb58NLEVqgY4HC8Bm2g1mgyf3hdRdwBVtBp5WwwattuEnmc577xr0XWlmhqKsZE
	 OkDE5UxyqqDJh/3D6CMmlhntgaa3A0tWS6biYVZVU9wYbT5kwwdr1QaYHim7jFYdXQ
	 DWI799IXkcymu4XLSVM8x38bXP/WgPivZtP7Ii+jeXM6+KANHyyIcF0Nu8rY7q8amR
	 qWZBjOUnsI+2ideqHM/qbFkNeZTD2LMZo/eC1gtvgDSaAqPEv5RVdzsmqYrn64d8+V
	 evUxhwiBt7ptQ==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 21 Apr 2025 17:00:59 +0200
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
Subject: [PATCH v2 2/3] mfd: exynos-lpass: Avoid calling exynos_lpass_disable() twice in exynos_lpass_remove()
Date: Mon, 21 Apr 2025 17:00:34 +0200
Message-ID: <74d69e8de10308c9855db6d54155a3de4b11abfd.1745247209.git.christophe.jaillet@wanadoo.fr>
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

exynos_lpass_disable() is called twice in the remove function. Remove
one of these calls.

Fixes: 90f447170c6f ("mfd: exynos-lpass: Add runtime PM support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Compile tested only.

Changes in v2:
  - Add R-b tag

v1: https://lore.kernel.org/all/ee6241d024c4cb68622dde9d65d8712016f4205e.1743231856.git.christophe.jaillet@wanadoo.fr/
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

