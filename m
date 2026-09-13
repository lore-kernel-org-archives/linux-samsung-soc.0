Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC089339363
	for <linux-samsung-soc@vger.kernel.org>; Sun, 13 Sep 2026 14:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311582; cv=none; b=RjshAkWEsyyS+t5C9g081Ps6NTzu3E6HZpavPYepyCCg/+rsED8e3Vc8evQQ8fk4iUnxw6NU0iJrB4HAErTOfuqUIgKiRPxnnX5KG5Fnp2084lPOONu1PjlYnZ49K5lfNL5cgSlGCrZvvpjY8ihoRJuAW4JjgEOjUgezq5j68GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311582; c=relaxed/simple;
	bh=ak4tshfNok3X2hRPXd4e8Yziszvu7kRWCnmlNF5Pb5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NvNPOndpxZrOhnLdbzEn9HwLfg03UmokDEHz1/X9tc049Ijy74Org9Jnph/zsCuQOkf1p7C02oTvkFc6D7VI4jjsMgF/BTFy8tcowlCQyTwlOYrE5rU42py1TKFfXAWlw3DRSkN3Rgau+R6dM/XVoHsx+W5hNar4vKSV7qBcGC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9CvGy1c; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9CvGy1c"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebad4aeso1185239a12.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 13 Sep 2026 07:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311578; x=1789916378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6v0v0q/G/gLroOU57+Sotz0AlKiMNuB5Ilcu2TBSVco=;
        b=e9CvGy1c+H+BeyV7ALbK9LsNAjPvaScD1wtUjj65xclOGPIqxi5MX1qvtMQLaULH5z
         IMbdyDHPNnubyE/OJ6Px4rT2YyyMe1IRwWyqraSqrEu/IZTacmBDlrv5h+FieCwOmVqi
         /jsMiw3V8Fhtfbg3aspPQlAD8ijYPWAK04loewTreBEexpenkLa7YOpUXH7M0qpvJVcD
         Po5U7/SptpOb5M8nvU1/tokwZ5KLm0Ucxutc5LjYdlpdfu1tAx4bbzxwthFqWiIBF4la
         NdkVYJXZHLoVB9IYzGTNM6F7ZxG9PKuP5wMnKjlaM3qO/9bO6ZvUvwzp4VwCdxvuCqHv
         gKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311578; x=1789916378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6v0v0q/G/gLroOU57+Sotz0AlKiMNuB5Ilcu2TBSVco=;
        b=H63QTSK5/Vev1KPdAPFRVweZ8eJpkvtXe4PPzGqQ0IeGQvtCLAyj4yTuhan4eIqY7c
         tiu2YUrOGzDDK28caRS9xRxSG8BzwrLoS6gKocQ067xU1lztQCxLgzjhoTv/ZnWfsZn/
         1XGp3viN1OceG9CgP7wreav/hhed3Lrn3CIygdcjdJFc+7jwicFu5CcEGaQ51lJ6JToj
         LQ8jdf0yjB9ojjQCnk9RwpLbusRi0rmxMOMK4gaH84ZZlxA3BdSvmkwX5x8On3QptrOp
         fvTNcf9WLppAJayr5ZYN8qsDDqzkhMBEFpnND0jFeVqPeoXJbVbDdbwLUYCaxCOhk6L4
         JtLA==
X-Forwarded-Encrypted: i=1; AKwUvByckl8yyoHDfRju4+aNJw/5xqoH/cn1h27BTbmPfnhtJmqTuqOVQ5bK0SkcbnB8YOS34jA9dZBMqh+qXuy58GmEXQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kALqug5taVOp21ju9vVvLbEEKUP5A8koZnXsVQyiiYUq+9iA1R
	T9SoGRLJT24nHviOp7OepmzUbRR51OF6ku0Cy8PYa1/KNyialWo9ec0Q
X-Gm-Gg: AYBFou110NA0FYsUI1MdJJWmTZgkiD6BH08220xzbtBc1Ox7KXIIUWXBDu4AQu2dGFr
	mKl1Wtlqhx2PDOvNPf6vPCtZFwBIYWiauFqUH0OM/2TwfMsWejexrkShIR7QAtA3JnBOR3qpySi
	Bh+wXWjWMCqPBN6xoD7mK/acIy5xOwieyVocoutH/s4YuD0jqrqZCrZOIdw6v7XUQDivLe6CWHo
	clkWYNCJSq0Cc9lx1yG5E5LkPFeYcFsn+M46uuZDFmNxCuDpv2Ttse+BKFBlWES6PykAXi10ILk
	l5WdewIhr1Stl+0yoZ9W8soyyspr/KZ1eOhu5z/58W9ub+qazz0xVH1Fw4IWOgGekhhDtQqtYCD
	FxOC+CwJHWEXjL2M5awvuLT3OjBJ5kat2n4zmUcZ5z/2zdnlXF/yIMG5rzXN5Pd/ZyxPAiza5PQ
	nTPHsl9EQbbiqJhnSP1Dd4R2FGmf9w5SH1Fb6DG+6XFgyf0Gv2TPAo+ij4eFklKknovaD5Z5w92
	g==
X-Received: by 2002:a17:90b:2588:b0:38d:fda6:4873 with SMTP id 98e67ed59e1d1-39d9bd99cc7mr24628579a91.10.1789311577951;
        Sun, 13 Sep 2026 07:59:37 -0700 (PDT)
Received: from archl-rock5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8f1f7sm17536306c88.11.2026.09.13.07.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:59:37 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-pm@vger.kernel.org (open list:THERMAL),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v9 3/9] thermal/drivers/exynos: Handle optional triminfo clock correctly
Date: Sun, 13 Sep 2026 20:28:31 +0530
Message-ID: <20260913145905.9404-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913145905.9404-1-linux.amoon@gmail.com>
References: <20260913145905.9404-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The triminfo clock is obtained using devm_clk_get_optional_prepared(),
which returns NULL when the optional clock is not present.

Update the clock checks in exynos_tmu_initialize() to test for NULL
instead of using IS_ERR(), allowing TMU instances without a triminfo
clock to initialize correctly.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/thermal/samsung/exynos_tmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 825dbdef0b9a..a64b11e6acdc 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -258,7 +258,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 
 	mutex_lock(&data->lock);
 	clk_enable(data->clk);
-	if (!IS_ERR(data->clk_sec))
+	if (data->clk_sec)
 		clk_enable(data->clk_sec);
 
 	status = readb(data->base + EXYNOS_TMU_REG_STATUS);
@@ -269,7 +269,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 		data->tmu_clear_irqs(data);
 	}
 
-	if (!IS_ERR(data->clk_sec))
+	if (data->clk_sec)
 		clk_disable(data->clk_sec);
 	clk_disable(data->clk);
 	mutex_unlock(&data->lock);
-- 
2.55.0

